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
"methods:nomunge, private_: nomunge"

$ = jQuery
History = window.History

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

		if typeof(page) is 'function'
			callback = page
			page = null

		if typeof(force) is 'function'
			callback = force
			force = false

		return if data.closed and not force

		page = data.first_page if not page
		time = if force then 0 else 'slow'
		$nav = private_.getPageObject.call(this, page)
		page = private_.getPageNumber.call(this, page)

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

		data.$more.fadeOut('slow')
		this.find('> article').add(this.find('.admin')).stop().animate
			opacity: 0
			'slow'
		data.$controls_nav.fadeIn 'slow'

		data.$main_nav_wrapper.stop().animate
			left: 0
			'slow'

		data.closed = false

		if data.nav_count <= data.settings.visible_columns
			methods.moveToPage.call(this, 1, false, callback)
		else
			methods.moveToPage.call(this, page, false, callback)
		this

	###*
	 * Closes the navigator back to its original spot with the current or specified
	 * page staying visible
	 *
	 * @example $(element).monobombNavigator('closeToPage', 2, false)
	 *
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 * @param {boolean} [show_articles] Should we redisplay the articles?
	 * @param {function} [callback] Callback
	 *
	 * @returns {object} Jquery object
	###
	closeToPage: (page, show_articles, callback) ->
		data = this.data('monobombNavigator')

		return if data.$main_nav_wrapper.position().left is data.original_left

		if typeof(page) is 'boolean'
			callback = fade-articles
			show_articles = page
			page = null

		if typeof(page)  is 'function'
			callback = page
			page = null
			show_articles = true

		if typeof(show_articles) is 'function'
			callback = show_articles
			show_articles = true

		show_articles = true if typeof(show_articles) isnt 'boolean'
		page = data.$inner_nav_wrapper.find('.current')?.closest('nav') if not page
		page = 1 if typeof page.position() is 'undefined'

		methods.moveToPage.call(this, page)
		data.$controls_nav.fadeOut 'slow'
		data.$more.fadeIn('slow')

		data.$main_nav_wrapper.stop().animate(
			left: data.original_left + 'px',
			'slow',
			=>
				if show_articles
					this.find('> article').add(this.find('.admin')).stop().animate
						opacity: 1
						'fast'
						callback
				else
					callback()
		)

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

		if data.nav_count - data.first_page > data.settings.visible_columns - 1
			data.$forward.removeClass('disabled')
		else
			data.$forward.addClass('disabled')

		if data.first_page > 1
			data.$back.removeClass('disabled')
		else
			data.$back.addClass('disabled')
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
	 * If we're using AJAX for loading the contents of contained links, then
	 * pass the article_selector and model name.
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
	 * @config {string} [article_selector] Selector that we'll animate and hold the result of an AJAX request
	 * @config {string} [model] Name of the model used in AJAX requests
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
			# The next two are for AJAX requests
			article_selector: null
			model: null
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
		data.$content           = $('.content')
		data.$main_nav_wrapper  = $(settings.main_nav_wrapper)
		data.$inner_nav_wrapper = data.$main_nav_wrapper.find(settings.inner_nav_wrapper)
		data.$controls_nav      = $(settings.controls_nav)
		data.$more              = this.find(settings.more_selector)
		data.$back              = data.$controls_nav.find(settings.back_selector)
		data.$close             = data.$controls_nav.find(settings.close_selector)
		data.$forward           = data.$controls_nav.find(settings.forward_selector)
		data.$actual_navs       = data.$inner_nav_wrapper.find(settings.inner_elements)
		data.nav_count          = data.$actual_navs.length
		data.original_left      = 960 - $(data.$actual_navs[0]).width()
		# holds the first page visible when opened
		data.first_page         = 1
		data.closed             = not data.$main_nav_wrapper.hasClass('start-open')

		this.data 'monobombNavigator', data

		# We need to adjust the width of the wrapper to fit all the navs
		individual_width   = $(data.$actual_navs[1]).outerWidth(true)
		new_width = data.nav_count * individual_width
		new_width = 960 if new_width < 960
		data.$inner_nav_wrapper.width( new_width + 'px')

		# And adjust the height of page to contain everything
		required_height = data.$inner_nav_wrapper.outerHeight(true)
		data.min_height = required_height + 140

		# Figure out our truly required height
		total_height = 0

		this.children().each ->
			if $(this).css('position') isnt 'absolute'
				total_height += $(this).outerHeight(true)

		if total_height < data.min_height
			this.height(data.min_height)
		else
			# Just to give some room in case this is a single post view
			this.height(total_height + 140)

		# Switch to the current page if we're on a view page
		if data.closed and ($first_page = this.find('.first-page')).length
			methods.moveToPage.call(this, $first_page, true)

		if data.nav_count < 2
			data.$more.hide()

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

		if data.settings.article_selector and data.settings.model
			$loading = data.$content.find('> .loading')

			History.Adapter.bind(window, 'statechange'
				, =>
					state = History.getState()
					split_url = state.url.split('/')
					id = split_url[5]
					#This may be a page that was moved into /music
					id = split_url[6] if isNaN(id) and split_url.length > 6

					if isNaN(id)
						# We ended up on the main page
						data.$inner_nav_wrapper.find('.current').removeClass('current')
						$('.pager').addClass('start-open')
						data.$content.monobombNavigator('hideClose')
							.monobombNavigator('openToPage', 1)

						return
					else
						data.$content.monobombNavigator('showClose')

					data.$inner_nav_wrapper.find('.current').removeClass('current')
					$current = $('#' + data.settings.model + '-' + id)
					$current.addClass('current')
					$page = $current.closest('nav')

					if data.$content.monobombNavigator('isOpen')
						data.$content.monobombNavigator('closeToPage', $page, false
							, ->
								$('.start-open').removeClass('start-open')
						)
					else
						data.$content.monobombNavigator('moveToPage', $page, true)

					$articles = $(data.settings.article_selector)
					$loading.fadeIn('fast')
					$articles.fadeOut ->
						# We only need one event now
						for article in $articles.slice(1)
							$(article).remove()

						$.ajax
							type: 'GET'
							url: state.url + '.json'
							success: (response) ->
								if (response.success)
									$err = $('.flash-error')
									$err.slideUp() if $err.css('display') isnt 'none'

									$article = $(response.data)

									$article.imagesLoaded ->
										$article.hide()
										$(data.settings.article_selector).replaceWith($article)
										$loading.fadeOut('fast')
										$('> .admin', data.$content).animate {opacity: 1}
										$article.fadeIn =>
											height = $article.height()
											new_height = if height < data.min_height + 140 then data.min_height + 140 else height + 140
											data.$content.stop().animate
												height: new_height + 'px'
								else
									$loading.hide('fast')
									Monobomb.flashError 'Sorry, there was a problem loading that item. ' + response.data
									History.back()
							error: (jqXHR, textStatus, errorThrown) ->
								$loading.hide('fast')
								Monobomb.flashError('Sorry, there was a problem loading that item. (' + textStatus + ')')
								History.back()
			)

			data.$inner_nav_wrapper.delegate('a', 'click', ->
				if not data.$content.monobombNavigator('isAnimating')
					$this = $(this)
					History.pushState(null, SiteConfig.siteTitle + ' • ' + $this.find('.title').text(), $this.attr('href'))

				false
			)

		this

private_ =
	###*
	 * @lends $.fn.monobombNavigator
	###

	###*
	 * Returns the numberof the specified page
	 *
	 * @private
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 *
	 * @returns {int} Page number
	###
	getPageNumber: (page) ->
		data = this.data('monobombNavigator')

		if typeof(page) is 'object'
			## find our new "viewing" page
			$page = $(page)
			page_num = 1

			for nav in data.$actual_navs
				if $page.equals nav
					break
				page_num++

			return page_num

		parseInt(page)

	###*
	 * Returns the jQuery object of the specified page
	 *
	 * @private
	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
	 *
	 * @returns {object} Jquery object
	###
	getPageObject: (page) ->
		return $(page) if typeof(page) is 'object'

		data = this.data('monobombNavigator')
		data.$inner_nav_wrapper.find(data.settings.inner_elements + ':nth-child(' + parseInt(page) + ')')

###*
 * monobombNavigator - handles navigation
 *
 * @memberOf $.fn
###
$.fn.monobombNavigator = (method) ->
	if methods[method]
		 return methods[method].apply(this, Array.prototype.slice.call(arguments, 1))

	 return methods.init.apply(this, arguments)
