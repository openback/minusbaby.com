# Adds utility functions
$ = jQuery

window.Monobomb =
	###*
	 * Will create a new flash-error message or reuse an existing one
	 * and replace its contents
	 *
	 * @param {string} content the HTML to be placed in the message
	 ###
	flashError: (content) ->
		$flash = $(".flash-error")

		# We need to build an error flash
		$flash = $("<div>").addClass("flash-error").hide().insertBefore(".content") if $flash.length is 0
		$flash.html content

		if $flash.css("display") is "none"
			$flash.slideDown ->
				$(this).effect "highlight", {}, 1000
				$flash.delay(2000).slideUp()
		else
			$flash.effect "highlight", {}, 1000

# And now some simple separate ones
String.prototype.endsWith = (suffix) ->
	this.indexOf(suffix, this.length - suffix.length) isnt -1

$.fn.equals = (selector) ->
	$(this).get(0) is $(selector).get(0)

