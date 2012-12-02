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
$ = jQuery

$.fn.extend
	monobombNavigator: (options, args, cb) ->
		this.each ->
			new $.monobombNavigator(this, options, args, cb)


$.monobombNavigator = (elem, options, args, cb) ->
	# ----------------------------------------------------------------------------
	# moveToPage
	#
	# page: page number (1 indexed) or the actual page itself
	# ----------------------------------------------------------------------------
	moveToPage = (page, force) ->
		data = $(elem).data('monobombNavigator')

		return if data.closed and not force

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

		setButtons(data)

	# ----------------------------------------------------------------------------
	# openNav
	#
	# opens the Navigator with the currently viewed page as the first one
	# ----------------------------------------------------------------------------
	openNav = ->
		data.$more.add(data.$elem.find('> article').add(data.$elem.find('.admin'))).stop().fadeOut 'slow'
		data.$controls_nav.fadeIn 'slow'

		data.$main_nav_wrapper.stop().animate
			left: 0
			'slow'

		data.closed = false

		moveToPage(Math.max(1, Math.min(data.first_page, data.nav_count - settings.visible_columns + 1)))
	# ----------------------------------------------------------------------------
	# closeNav
	#
	# closes the Navigator back to its original spot with the current viewed page
	# staying visible
	# ----------------------------------------------------------------------------
	closeNav = (cb) ->
		data = $(elem).data('monobombNavigator')
		moveToPage(data.viewing)
		data.$controls_nav.fadeOut 'slow'
		data.$more.add(data.$elem.find('> article').add(data.$elem.find('.admin'))).stop().fadeIn 'slow'
		data.$main_nav_wrapper.stop().animate
			left: data.original_left + 'px'
			'slow'
			cb
		data.closed = true

	# ----------------------------------------------------------------------------
	# closeToPage
	#
	# closes the Navigator back to its original spot with specified page staying
	# visible
	# ----------------------------------------------------------------------------
	closeToPage = ($nav, cb) ->
		$elem = $(elem)
		data = $elem.data('monobombNavigator')

		return if data.$main_nav_wrapper.position().left is data.original_left

		## find our new "viewing" page
		data.viewing = 1

		for nav in data.$actual_navs
			if $nav.equals $(nav)
				break
			data.viewing++

		closeNav(cb)
		false

	# ----------------------------------------------------------------------------
	# setButtons
	#
	# Sets the control's buttons according to availability of pages
	# ----------------------------------------------------------------------------
	setButtons = (data) ->
		if data.nav_count - data.first_page > data.settings.visible_columns then data.$forward.removeClass('disabled') else data.$forward.addClass('disabled')
		if data.first_page > 1 then data.$back.removeClass('disabled') else data.$back.addClass('disabled')

	# ----------------------------------------------------------------------------
	# hideClose
	#
	# Showss the control's close buttons
	# ----------------------------------------------------------------------------
	hideClose = (cb) ->
		data = $(elem).data('monobombNavigator')
		data.$close.hide()
		cb() if cb

	# ----------------------------------------------------------------------------
	# showClose
	#
	# Showss the control's close buttons
	# ----------------------------------------------------------------------------
	showClose = (cb) ->
		data = $(elem).data('monobombNavigator')
		data.$close.show()
		cb() if cb

	# ----------------------------------------------------------------------------
	# Switch control to the proper method
	if options and typeof(options) is 'string'
		switch options
			when 'closeToPage' then closeToPage(args, cb)
			when 'showClose' then showClose(args, cb)
			when 'hideClose' then hideClose(args, cb)
		return

	# No method called, so init
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
	data.$elem              = $(elem)
	data.$main_nav_wrapper  = $(settings.main_nav_wrapper)
	data.$inner_nav_wrapper = data.$main_nav_wrapper.find(settings.inner_nav_wrapper)
	data.$controls_nav      = $(settings.controls_nav)
	data.$more              = data.$elem.find(settings.more_selector)
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

	# We need to adjust the width of the wrapper to fit all the navs
	data.$inner_nav_wrapper.width(data.nav_count * data.individual_width + 'px')
	# And adjust the height of page to contain everything
	data.$elem.height(data.required_height + 140) if data.$elem.height() < data.required_height

	data.$elem.data 'monobombNavigator', data

	# Switch to the current page if we're on a view page
	if data.closed and ($first_page = data.$elem.find('.first-page')).length
		moveToPage($first_page, true)

	setButtons(data)

	# Set up our navigation events
	data.$more.click ->
		openNav()
		false

	data.$close.click ->
		closeNav()
		false

	data.$forward.click ->
		return if data.$inner_nav_wrapper.is(':animated')

		if data.nav_count - data.first_page - 1 < data.nav_count - settings.visible_columns
			# We can't go so far
			newPage = data.nav_count - settings.visible_columns + 1
		else
			newPage = data.first_page + settings.visible_columns

		moveToPage(newPage)
		false

	data.$back.click ->
		return if data.$inner_nav_wrapper.is(':animated')

		moveToPage(Math.max(1, data.first_page - settings.visible_columns))
		false

