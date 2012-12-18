buildr = require 'buildr'
util = require 'util'

options =
	watch: false
	compress: true
	srcPath: __dirname + '/webroot/js'
	outPath: __dirname + '/webroot/cjs'
	# Checking
	checkScripts: false
	jshintOptions:
		browser: true
		laxbreak: true
		boss: true
		undef: true
		onevar: true
		strict: true
		noarg: true

configs = [
	{
		name: 'JS: Application'
		watch: options.watch
		srcPath: options.srcPath
		checkScripts: options.checkScripts
		jshintOptions: options.jshintOptions
		compressScripts: options.compress # Array or true or false

		scriptsOrder: [
			'jquery.jplayer.js'
			'jquery.easing.1.3.js'
			'jquery.cookie.js'
			'history.adapter.jquery.js'
			'history.js'
			'compiled/jquery.monobombNavigation.js'
			'compiled/application.js'
			'compiled/music.js'
		]

		bundleScriptPath: options.outPath + '/application.min.js'
	}
	{
		name: 'JS: Application for IE'
		watch: options.watch
		srcPath: options.srcPath
		checkScripts: options.checkScripts
		jshintOptions: options.jshintOptions
		compressScripts: options.compress # Array or true or false

		scriptsOrder: [
			'selectivizr.js'
			'jquery.jplayer.js'
			'jquery.easing.1.3.js'
			'jquery.cookie.js'
			'compiled/jquery.monobombNavigation.js'
			'compiled/application.js'
			'compiled/music.js'
		]

		bundleScriptPath: options.outPath + '/application.ie.min.js'
	}
	{
		name: 'JS: Admin'
		watch: options.watch
		srcPath: options.srcPath
		checkScripts: options.checkScripts
		jshintOptions: options.jshintOptions
		compressScripts: options.compress # Array or true or false

		scriptsOrder: [
			'compiled/admin.js'
			'jquery-ui-timepicker-addon.js'
		]

		bundleScriptPath: options.outPath + '/admin.min.js'
	}
]

# Standard
for config in configs
	buildrInstance = buildr.createInstance config
	buildrInstance.process (err) ->
		throw err if err

