$ = jQuery
String.prototype.endsWith = (suffix) ->
	this.indexOf(suffix, this.length - suffix.length) isnt -1

pushState = (title, path) ->
	if (typeof(window.history.pushState) == 'function')
		window.history.pushState(null, title, path)
	else
		window.location.hash = '#!' + path

$.fn.equals = (selector) ->
	$(this).get(0) is $(selector).get(0)

# $('table').trSlideDownInsert('hi')
$.fn.trInsertSlideDown = (row, duration, cb) ->
	$row = $(row)
	$row.find('td').wrapInner('<div style="display:none;" />')

	$(this).find('tbody').append($row)
	$row.find('td > div').slideDown(
		duration,
		->
			$this = $(this)
			$(this).replaceWith($this.contents())
			cb() if cb
	)

# $('tr:last').slideUpRemove()
$.fn.trSlideUpRemove = (duration, cb) ->
	$(this)
		.find('td')
		.wrapInner('<div style="display:block;" />')
		.parent().find('td > div')
		.slideUp(
			duration,
			->
				$(this).closest('tr').remove()
				cb() if cb
		)

# Will create a new flash-failure message or reuse an existing one
#    * and replace its contents
#    * @param content the HTML to be placed in the message
#
flash_failure = (content) ->
	$flash = $(".flash-failure")

	# We need to build an error flash
	$flash = $("<div>").addClass("flash-failure").hide().prependTo("#content")  if $flash.length is 0
	$flash.html content

	if $flash.css("display") is "none"
		$flash.slideDown "slow", -> $(this).effect "highlight", {}, 1000
	else
		$flash.effect "highlight", {}, 1000

addRowFromTable = (table) ->
	$table = $(table)
	# Let's find out what the next number should be
	nextId = 0

	for row in $table.find('tbody tr')
		$lastInput = $(row).find('input:first')
		chunks = $lastInput.attr('name').split ']['
		nextId = Math.max(nextId, chunks[1])

	nextId++

	# Make a new row and adjust field names and such
	$row = $table.find('tbody tr:last').clone()
	$row.find('input[id$=Id]').remove()
	$row.find('input[id$=Delete]').remove()
	$row.find('input[id$=Delete_]').remove()
	$row.find('.error-message').remove()
	$row.find('.error').removeClass('error')
	$row.find('.form-error').removeClass('form-error')

	for el in $row.find('input, select')
		$el = $(el)
		matches = $el.attr('id').match /(\D+)(\d+)(\D+)/
		$el.attr('id', matches[1] + nextId + matches[3])
		chunks = $el.attr('name').split ']['
		chunks[1] = nextId
		$el.attr('name', chunks.join(']['))

		# Clean them out, but maintain a sort_order if there is one
		if matches[3] is 'SortOrder'
			$el.attr('value', parseInt($el.attr('value')) + 1)
		else
			$el.attr('value', '')

	# And finally, add a delete link
	$row.find('td:last').html('<a href="#" class="remove-row-from-table delete">REMOVE</a>')

	# $table.find('tbody').append($row)
	$table.trInsertSlideDown($row)

bindNavigatorLinks = (outer_wrapper_selector, article_selector, model_name) ->
	$outer_wrapper = $(outer_wrapper_selector)
	$content = $('.content')
	$loading = $content.find('> .loading')

	History.Adapter.bind(window, 'statechange'
		, =>
			state = History.getState()

			split_url = state.url.split('/')
			id = split_url[split_url.length - 2]

			if isNaN(id)
				# We ended up on the main page
				$outer_wrapper.find('.current').removeClass('current')
				$('.pager').addClass('start-open')
				$content.monobombNavigator('hideClose')
					.monobombNavigator('openToPage', 1)

				return
			else
				$content.monobombNavigator('showClose')

			$outer_wrapper.find('.current').removeClass('current')
			$current = $('#' + model_name + '-' + id)
			$current.addClass('current')
			$page = $current.closest('nav')

			if $content.monobombNavigator('isOpen')
				$content.monobombNavigator('closeToPage', $page
					, ->
						$('.start-open').removeClass('start-open')
				)
			else
				$content.monobombNavigator('moveToPage', $page, true)


			$articles = $(article_selector)
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
							$article = $(response.data)
							$article.hide()
							$(article_selector).replaceWith($article)
							$loading.fadeOut('fast')
							$article.fadeIn()
	)

	$outer_wrapper.delegate('a', 'click', ->
		if not $('.content').monobombNavigator('isAnimating')
			$this = $(this)
			History.pushState(null, 'Crashfaster • ' + $this.find('.title').text(), $this.attr('href'))

		false
	)


$(document).ready ->
	# flag for whether the user clicked to go elsewhere
	clicked = false
	# Add the highlight and ball to the page
	$highlight = $('<span id="highlight"/>')
	$ball = $('<span id="ball"/>').hide()
	$nav = $('nav.main')
	$nav.append($highlight).append($ball)
	# Find the current section
	$current = $nav.find('.current')
	$current =  $nav.find('a:first-child') if not $current.length
	width = $current.width()
	left = $current.position().left

	# Set it up to be where we are now
	$highlight.css
		'left': left
		'width': width

	# Set it up to follow
	$nav.find('li').hover(
		->
			return if clicked
			$a = $(this).find('a')

			newLeft = $a.position().left
			newWidth = $a.width()
			$highlight.stop().animate
				'left': newLeft
				'width': newWidth
		,->
			return if clicked
			$highlight.stop().animate
				'left': left
				'width': width
	)

	$nav.delegate('a', 'click', ->
		return if clicked
		clicked = true
		bottom = $highlight.position().top - $ball.height()
		$ball.css
			'left': $highlight.position().left + ($highlight.width()/2 - $ball.width()/2)
			'top': bottom

		url = $(this).attr('href')

		followLink = ->
			window.location = url

		bouncy = ->
			$ball.animate
				'top': '60px'
				,100
				, ->
					$ball.animate
						'top': bottom
						,100
						,bouncy

		$ball.show().animate
			'top': '60px'
			'left': $(this).position().left + ($(this).width()/2 - $ball.width()/2)
			,100
			,bouncy

		setTimeout(followLink, 100)
		return false
	)

	# Flash the...flash
	$("#flashMessage").add(".flash-success").effect("highlight", 1000, -> $(this).delay(2000).slideUp())
	$(".flash-failure").effect("highlight", {}, 1000)

	$email = $("a.email")

	if $email.length > 0
		$email.add("#xmpp span").html (index, oldhtml) ->
			oldhtml.replace "(@]", "@"
		$email.attr "href", "mailto:" + $email.html().toLowerCase()

	if CKEDITOR?
		CKEDITOR.on 'instanceCreated', (e) ->
			editor = e.editor
			element = editor.element
			$element = $(element.$)

			if element.is('h1', 'h2', 'h3') or $element.hasClass('no-p')
				editor.on('configLoaded', ->
					# Remove unnecessary plugins to make the editor simpler.

					editor.config.removePlugins = 'colorbutton,find,flash,font,' +
						'forms,iframe,image,newpage,removeformat,scayt,' +
						'smiley,specialchar,stylescombo,templates,wsc'

					# Remove the paragraph wrapping unless we hit Shift+Enter
					editor.config.enterMode = CKEDITOR.ENTER_BR
					editor.config.shiftEnterMode = CKEDITOR.ENTER_P

					# Rearrange the layout of the toolbar.
					editor.config.toolbarGroups = [
						{
							name: 'editing'
							groups: [ 'basicstyles', 'links' ]
						},
						{ name: 'undo' },
						{
							name: 'clipboard'
							groups: [ 'selection', 'clipboard' ]
						},
						{ name: 'about' }
					]
				)

				if $element.hasClass('no-bar')
					editor.config.toolbarGroups = []



		CKEDITOR.on 'instanceReady', (e) ->
			e.editor.on('focus', (ee) ->
				if $(ee.editor.element.$).hasClass('no-bar')
					$('.' + ee.editor.id).hide()
			)

			e.editor.on('blur', (ee) ->
				editor = ee.editor

				if editor.checkDirty()
					# Got our data
					$el = $(editor.element.$)
					model = $el.attr('data-model')

					# Get our hidden form
					$form = $el.prev()
					$('[name="data[' + model + '][id]"]', $form).val($el.attr('data-id'))
					$('[name="data[' + model + '][' + $el.attr('data-field') + ']"]', $form).val(ee.editor.getData())

					data = $form.serialize()

					url = '/' + $el.attr('data-controller') + '/edit/' + $el.attr('data-id') + '.json'

					$.ajax
						type: 'POST'
						url: url
						data: data
						dataType: 'json'
						success: (response) ->
							console.log 'RESPONSE: ', response

			)

		# Show labels on hover
		$('.cke_editable').live('mouseover', (e) ->
			$field = $(e.target)

			if $field.text() is ''
				$field.css('color','#666')
				$field.text($field.attr('data-label'))
		).live('mouseout', (e) ->
			$field = $(e.target)

			if $field.text() is $field.attr('data-label')
				$field.text('')
		).live('click', (e) ->
			$field = $(e.target)

			$field.css('color', 'inherit')
			if $field.text() is $field.attr('data-label')
				$field.text('')
		)

	if $.fn.datetimepicker
		$('.datetimepicker').datetimepicker
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd"

	# News
	$news = $('.content.news')

	if $news.length
		bindNavigatorLinks('nav.posts', 'article.post', 'post')

	# Video forms
	$('table#videos tbody').disableSelection().sortable
		helper: (e, ui) ->
			ui.children().each ->
				$(this).width($(this).width())

			ui
		update: (e, ui) ->
			# update our current elements
			$rows = $(this).find('tr')

			ids = for row in $rows
				$(row).attr('id')

			$form = $('form.hidden')
			$('#VideoIds').val(ids.toString())
			data = $form.serialize()

			$.ajax
				type: 'POST'
				url: '/videos/sort.json'
				data: data
				dataType: 'json'
				success: (response) ->
					console.log 'RESPONSE: ', response

	# Artist forms
	$('table.artists tbody').add('table.sites tbody').sortable
		helper: (e, ui) ->
			ui.children().each ->
				$(this).width($(this).width())
			ui
		update: (e, ui) ->
			$rows = $(this).find('tr')
			order = 1

			for row in $rows
				$(row).find('input[type=number]:first').val(order++)
			ui

	# Events
	$past_events = $('.past-events')

	if $past_events.length
		bindNavigatorLinks('nav.events', 'article.event', 'event')

	# Events forms
	if jQuery.fn.autocomplete
		$('input#EventTitle').autocomplete
			source: '/events/autocomplete/title.json'

		$('input#EventAge').autocomplete
			source: '/events/autocomplete/age.json'

		$('input#EventPrice').autocomplete
			source: '/events/autocomplete/price.json'

		$('input#EventExternalUrl').autocomplete
			source: '/events/autocomplete/external_url.json'

	if $('#EventUsingExistingVenue').val() is '0'
		$('.new-venue').hide()
		$('#EventVenueId').hide()
		$('.venue-portion').show()

	$('.new-venue').click ->
		$(this).stop().slideUp()
		$('#EventVenueId').stop().slideUp()
		$('.venue-portion').slideDown()
		$('#EventUsingExistingVenue').val(0)
		false

	$('.existing-venue').click ->
		$('.new-venue').stop().slideDown()
		$('#EventVenueId').stop().slideDown()
		$('.venue-portion').slideUp()
		$('#EventUsingExistingVenue').val(1)
		false

	# Get our tables ready to add rows
	$('a.add-row-from-table').live 'click', ->
		addRowFromTable($($(this).attr('data-table-selector')))
		false

	$('a.remove-row-from-table').live 'click', ->
		$(this).closest('tr').trSlideUpRemove()
		# TODO: Redo sort_order
		false
