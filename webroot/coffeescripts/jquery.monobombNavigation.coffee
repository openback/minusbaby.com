###
# Format:
# <div .content>
#	<div .admin />?
#	<div .all_events>
#		<div .past-events>
#			<nav .event>+
#		</div>
#	</div>
#	<nav .pager><a .back /><a .close /><a .forward /></nav>
#	<a .more />
# </div>
#
# Required setting:
#	main_nav_wrapper: .all_events
#	inner_nav_wrapper: .past-events
#	inner_elements: .event
#	controls_nav: .pager
###

(($) ->
	methods =
		# ----------------------------------------------------------------------------
		# moveToPage
		#
		# page: page number (1 indexed) or the actual page itself
		# ----------------------------------------------------------------------------
		moveToPage: (page, force, cb) ->
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
				cb

			methods.setButtons.apply(this)
			this

		# ----------------------------------------------------------------------------
		# openToPage
		#
		# opens the Navigator with the currently viewed or specified page as the first
		# one
		# ----------------------------------------------------------------------------
		openToPage: (page, cb) ->
			data = this.data('monobombNavigator')

			data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeOut 'slow'
			data.$controls_nav.fadeIn 'slow'

			data.$main_nav_wrapper.stop().animate
				left: 0
				'slow'

			data.closed = false

			methods.moveToPage.call(this, page, false, cb)
			this

		# ----------------------------------------------------------------------------
		# closeToPage
		#
		# closes the Navigator back to its original spot with specified page staying
		# visible
		# ----------------------------------------------------------------------------
		closeToPage: ($nav, cb) ->
			data = this.data('monobombNavigator')

			return if data.$main_nav_wrapper.position().left is data.original_left

			if typeof($nav) is 'object'
				## find our new "viewing" page
				data.viewing = 1

				for nav in data.$actual_navs
					if $nav.equals $(nav)
						break
					data.viewing++
			else
				cb = $nav

			methods.moveToPage.call(this, data.viewing)
			data.$controls_nav.fadeOut 'slow'
			data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeIn 'slow'
			data.$main_nav_wrapper.stop().animate
				left: data.original_left + 'px'
				'slow'
				cb
			data.closed = true
			false

		# ----------------------------------------------------------------------------
		# back
		#
		# Scrolls the navigator one full page back
		# ----------------------------------------------------------------------------
		back: (cb) ->
			data = this.data('monobombNavigator')
			return if data.$inner_nav_wrapper.is(':animated')

			methods.moveToPage.call(this, Math.max(1, data.first_page - data.settings.visible_columns))
			this

		# ----------------------------------------------------------------------------
		# forward
		#
		# Scrolls the navigator one full page forward
		# ----------------------------------------------------------------------------
		forward: (cb) ->
			data = this.data('monobombNavigator')
			return if data.$inner_nav_wrapper.is(':animated')

			newPage = data.first_page + data.settings.visible_columns
			maxFirstPage = data.nav_count - data.settings.visible_columns + 1

			if newPage > maxFirstPage
				# We can't go so far
				newPage = maxFirstPage

			methods.moveToPage.call(this, newPage, false, cb)
			this

		# ----------------------------------------------------------------------------
		# setButtons
		#
		# Sets the control's buttons according to availability of pages
		# ----------------------------------------------------------------------------
		setButtons: () ->
			data = this.data('monobombNavigator')
			if data.nav_count - data.first_page > data.settings.visible_columns - 1 then data.$forward.removeClass('disabled') else data.$forward.addClass('disabled')
			if data.first_page > 1 then data.$back.removeClass('disabled') else data.$back.addClass('disabled')
			this

		# ----------------------------------------------------------------------------
		# hideClose
		#
		# Shows the control's close buttons
		# ----------------------------------------------------------------------------
		hideClose: () ->
			this.data('monobombNavigator').$close.hide()
			this

		# ----------------------------------------------------------------------------
		# showClose
		#
		# Shows the control's close buttons
		# ----------------------------------------------------------------------------
		showClose: () ->
			this.data('monobombNavigator').$close.show()
			this

		# ----------------------------------------------------------------------------
		# isAnimating
		#
		# Returns boolean of whether the nav is animating or not
		# ----------------------------------------------------------------------------
		isAnimating: ->
			this.data('monobombNavigator').$inner_nav_wrapper.is(':animated')

		# ----------------------------------------------------------------------------
		# isOpen
		#
		# Returns boolean of whether the nav is open or not
		# ----------------------------------------------------------------------------
		isOpen: ->
			this.data('monobombNavigator').$main_nav_wrapper.position().left is 0

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

	$.fn.monobombNavigator = (method) ->
		if methods[method]
			 return methods[method].apply(this, Array.prototype.slice.call(arguments, 1))

		 return methods.init.apply(this, arguments)
) jQuery
