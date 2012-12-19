<?php
/* Adapted from the Kohana framework
 * http://kohanaframework.org/3.0/guide/api/Arr#path
 *
 ******************************************************************************
 *
 * Kohana License Agreement
 *
 * This license is a legal agreement between you and the Kohana Team for the use
 * of Kohana Framework (the "Software"). By obtaining the Software you agree to
 * comply with the terms and conditions of this license.
 *
 * * Copyright © 2007–2012 Kohana Team. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 *
 * * Neither the name of the Kohana nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
class Dot {
	public static function get($array, $path, $default = null, $delimiter = '.') {
		if (!is_array($array)) {
			return $default;
		}

		if (is_array($path)) {
			// The path has already been separated into keys
			$keys = $path;
		} else {
			if (array_key_exists($path, $array)) { // No need to do extra processing
				return $array[$path];
			}

			// Remove starting delimiters and spaces
			$path = ltrim($path, "{$delimiter} ");

			// Remove ending delimiters, spaces, and wildcards
			$path = rtrim($path, "{$delimiter} *");

			// Split the keys by delimiter
			$keys = explode($delimiter, $path);
		}

		do {
			$key = array_shift($keys);
			$key = ctype_digit($key)?  (int)$key : $key;

			if (isset($array[$key])) {
				if ($keys) {
					if (is_array($array[$key])) {
						// Dig down into the next part of the path
						$array = $array[$key];
					} else {
						// Unable to dig deeper
						break;
					}
				} else {
					// Found the path requested
					return $array[$key];
				}
			} elseif ($key === '*') {
				// Handle wildcards
				$values = array();
				foreach ($array as $arr) {
					if ($value = Dot::get($arr, implode('.', $keys))) {
						$values[] = $value;
					}
				}

				if ($values) {
					// Found the values requested
					return $values;
				} else {
					// Unable to dig deeper
					break;
				}
			} else {
				// Unable to dig deeper
				break;
			}
		} while ($keys);

		// Unable to find the value requested
		return $default;
	}
}
