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


$(document).ready ->
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

				return if not editor.editable().isInline()

				if editor.checkDirty()
					# Got our data
					$el = $(editor.element.$)
					model = $el.attr('data-model')

					# Get our hidden form
					$form = $el.next()
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
							if not response.success
								alert('Sorry, there was a problem!')

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

	if $.fn.datepicker
		$('.datepicker').datepicker
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd"

	if $.fn.datetimepicker
		$('.datetimepicker').datetimepicker
			changeMonth: true,
			changeYear: true,
			dateFormat: "yy-mm-dd"

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
