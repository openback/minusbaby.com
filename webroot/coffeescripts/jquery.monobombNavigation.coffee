###*
 * @fileOverview monobombNavigator jQuery plugin
 *               Format:
 *               <div .content>
 *                 <div .admin />?
 *                 <div .all_events>
 *                 	<div .past-events>
 *                 		<nav .event>+
 *                 	</div>
 *                 </div>
 *                 <nav .pager><a .back /><a .close /><a .forward /></nav>
 *                 <a .more />
 *               </div>
 * @version 0.90
 * @author Timothy Caraballo http://pixelpod.net
 * @requires jQuery
 ###

###*
 * See <a href="http://jquery.com">http://jquery.com</a>.
 * @name $
 * @class
 * See the jQuery Library  (<a href="http://jquery.com">http://jquery.com</a>) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
 ###

###*
 * See <a href="http://jquery.com">http://jquery.com</a>
 * @name fn
 * @class
 * See the jQuery Library  (<a href="http://jquery.com">http://jquery.com</a>) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
 * @memberOf $
 ###

$ = jQuery

methods =
	###*
	 * @lends $.fn.monobombNavigator
	###

	###*
	 * Moves so that the first or specified page is the leftmost visible page
	 *
	 * @example $(element).monobombNavigator('moveToPage', 2)
	 *
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 * @param {bool} [force] Whether to still move even if the nav is closed
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	moveToPage: (page, force, callback) ->
		data = this.data('monobombNavigator')

		return if data.closed and not force

		page = 1 if typeof(page) is 'undefined'

		if typeof(page) is 'number'
			$nav = data.$inner_nav_wrapper.find(data.settings.inner_elements + ':nth-child(' + page + ')')
		else
			$nav = $(page)

			page = 1
			for nav in data.$actual_navs
				break if $(nav).equals $nav
				page++

		time = if force then 0 else 'slow'

		data.first_page = page
		data.$inner_nav_wrapper.stop().animate
			left: '-' + $nav.position().left + 'px'
			time
			callback

		methods.setButtons.apply(this)
		this

	###*
	 * Opens so that the current or specified page is the leftmost visible page
	 *
	 * @example $(element).monobombNavigator('openToPage', 2)
	 *
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	openToPage: (page, callback) ->
		data = this.data('monobombNavigator')

		data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeOut 'slow'
		data.$controls_nav.fadeIn 'slow'

		data.$main_nav_wrapper.stop().animate
			left: 0
			'slow'

		data.closed = false

		methods.moveToPage.call(this, page, false, callback)
		this

	###*
	 * Closes the navigator back to its original spot with the current or specified
	 * page staying visible
	 *
	 * @example $(element).monobombNavigator('closeToPage', 2)
	 *
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	closeToPage: (page, callback) ->
		data = this.data('monobombNavigator')

		return if data.$main_nav_wrapper.position().left is data.original_left

		if typeof(page) is 'object'
			## find our new "viewing" page
			data.viewing = 1

			for nav in data.$actual_navs
				if $nav.equals $(page)
					break
				data.viewing++
		else
			callback = page

		methods.moveToPage.call(this, data.viewing)
		data.$controls_nav.fadeOut 'slow'
		data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeIn 'slow'
		data.$main_nav_wrapper.stop().animate
			left: data.original_left + 'px'
			'slow'
			callback
		data.closed = true
		this

	###*
	 * Scrolls the navigator one full page back
	 *
	 * @example $(element).monobombNavigator('back')
	 *
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	back: (callback) ->
		data = this.data('monobombNavigator')
		return if data.$inner_nav_wrapper.is(':animated')

		methods.moveToPage.call(this, Math.max(1, data.first_page - data.settings.visible_columns))
		this

	###*
	 * Scrolls the navigator one full page forward
	 *
	 * @example $(element).monobombNavigator('forward')
	 *
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	forward: (callback) ->
		data = this.data('monobombNavigator')
		return if data.$inner_nav_wrapper.is(':animated')

		newPage = data.first_page + data.settings.visible_columns
		maxFirstPage = data.nav_count - data.settings.visible_columns + 1

		if newPage > maxFirstPage
			# We can't go so far
			newPage = maxFirstPage

		methods.moveToPage.call(this, newPage, false, callback)
		this

	###*
	 * Sets the control's buttons according to availability of pages
	 *
	 * @example $(element).monobombNavigator('setButtons')
	 *
	 * @returns {object} Jquery object
	###
	setButtons: () ->
		data = this.data('monobombNavigator')
		if data.nav_count - data.first_page > data.settings.visible_columns - 1 then data.$forward.removeClass('disabled') else data.$forward.addClass('disabled')
		if data.first_page > 1 then data.$back.removeClass('disabled') else data.$back.addClass('disabled')
		this

	###*
	 * Hides the control's close buttons
	 *
	 * @example $(element).monobombNavigator('hideClose')
	 *
	 * @returns {object} Jquery object
	###
	hideClose: () ->
		this.data('monobombNavigator').$close.hide()
		this

	###*
	 * Shows the control's close buttons
	 *
	 * @example $(element).monobombNavigator('showClose')
	 *
	 * @returns {object} Jquery object
	###
	showClose: () ->
		this.data('monobombNavigator').$close.show()
		this

	###*
	 * @example $(element).monobombNavigator('isAnimating')
	 *
	 * @returns {boolean} Whether the nav is animating
	###
	isAnimating: ->
		this.data('monobombNavigator').$inner_nav_wrapper.is(':animated')

	###*
	 * @example $(element).monobombNavigator('isOpen')
	 *
	 * @returns {boolean} of whether the nav is open
	###
	isOpen: ->
		this.data('monobombNavigator').$main_nav_wrapper.position().left is 0

	###*
	 * Initializes the navigator
	 *
	 * @example $(element).monobombNavigator({
	 *              main_nav_wrapper: ".members",
	 *              inner_nav_wrapper: ".collaborator-wrapper",
	 *              inner_elements: "dl",
	 *              controls_nav: ".pager",
	 *              visible_columns: 2
	 *          })
	 *
	 * @param {object} options Various settings for the navigator
	 * @config {string} main_nav_wrapper Outer wrapper selector
	 * @config {string} inner_nav_wrapper Inner wrapper selector
	 * @config {string} inner_elements Page selector
	 * @config {string} controls_nav Control selector
	 * @config {string} [more_selector] More button selector ('> .more')
	 * @config {string} [back_selector] Back button selector '.back')
	 * @config {string} [close_selector] Close button selector ('.close')
	 * @config {string} [forward_selector] Forward button selector ('.forward')
	 * @config {string} [visible_columns] Number of columns visible at once (4)
	 *
	 * @returns {object} Jquery object
	 * @constructs
	###
	init: (options) ->
		settings =
			more_selector: '> .more'
			back_selector: '.back'
			close_selector: '.close'
			forward_selector: '.forward'
			visible_columns: 4
			# The rest are required
			main_nav_wrapper: null
			inner_nav_wrapper: null
			inner_elements: null
			controls_nav: null


		settings = $.extend settings, options

		if not settings.main_nav_wrapper? or not settings.inner_nav_wrapper? or not settings.controls_nav?
			console.log '[monobombNavigator] Error: required settings not defined.'
			return false

		data =
			settings: settings
		data.$main_nav_wrapper  = $(settings.main_nav_wrapper)
		data.$inner_nav_wrapper = data.$main_nav_wrapper.find(settings.inner_nav_wrapper)
		data.$controls_nav      = $(settings.controls_nav)
		data.$more              = this.find(settings.more_selector)
		data.$back              = data.$controls_nav.find(settings.back_selector)
		data.$close             = data.$controls_nav.find(settings.close_selector)
		data.$forward           = data.$controls_nav.find(settings.forward_selector)
		data.$actual_navs       = data.$inner_nav_wrapper.find(settings.inner_elements)
		data.nav_count          = data.$actual_navs.length
		data.individual_width   = $(data.$actual_navs[1]).outerWidth(true)
		data.required_height    = data.$inner_nav_wrapper.height()
		data.original_left      = 960 - $(data.$actual_navs[1]).width()
		# holds the page of the currently viewed article
		data.viewing            = 1
		# holds the first page visible when opened
		data.first_page         = 1
		data.closed             = not data.$main_nav_wrapper.hasClass('start-open')

		this.data 'monobombNavigator', data

		# We need to adjust the width of the wrapper to fit all the navs
		data.$inner_nav_wrapper.width(data.nav_count * data.individual_width + 'px')
		# And adjust the height of page to contain everything
		this.height(data.required_height + 140) if this.height() < data.required_height

		# Switch to the current page if we're on a view page
		if data.closed and ($first_page = this.find('.first-page')).length
			methods.moveToPage.call(this, $first_page, true)

		methods.setButtons.apply(this)

		# Set up our navigation events
		data.$more.click =>
			methods.openToPage.apply(this)
			false

		data.$close.click =>
			methods.closeToPage.apply(this)
			false

		data.$forward.click =>
			methods.forward.apply(this)
			false

		data.$back.click =>
			methods.back.apply(this)
			false

		this


###*
 * monobombNavigator - handles navigation
 *
 * @memberOf $.fn
###
$.fn.monobombNavigator = (method) ->
	if methods[method]
		 return methods[method].apply(this, Array.prototype.slice.call(arguments, 1))

	 return methods.init.apply(this, arguments)
