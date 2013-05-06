$ = jQuery

$(document).ready ->
	# flag for whether the user clicked to go elsewhere
	clicked = false
	# Add the highlight and bullet to the page
	$highlight = $('<span id="highlight"/>')
	$bullet = $('<span id="ball"/>').hide()
	$nav = $('nav.main')
	$nav.append($highlight).append($bullet)
	# Find the current section
	$current = $nav.find('.current')
	$current =  $nav.find('a:first-child') if not $current.length
	width = $current.width()
	left = $current.position().left
	# Signals if the highlight is finished moving
	doneMoving = true

	# Set it up to be where we are now
	$highlight.css
		'left': left
		'width': width

	# Set it up to follow
	$nav.find('li').hover(
		->
			return if clicked
			doneMoving = false
			$a = $(this).find('a')
			newLeft = $a.position().left
			newWidth = $a.width()

			$highlight.stop().animate
				'left': newLeft
				'width': newWidth
				, ->
					doneMoving = true
		,->
			return if clicked
			doneMoving = false
			$highlight.stop().animate
				'left': left
				'width': width
				, ->
					doneMoving = true
	)

	$nav.delegate('a', 'click', ->
		return if clicked
		clicked = true
		bottom = $highlight.position().top - $bullet.height()
		$bullet.css
			'left': $highlight.position().left + ($highlight.width()/2 - $bullet.width()/2)
			'top': bottom

		url = $(this).attr('href')

		followLink = ->
			window.location = url

		shoot = =>
			$link = $(this)
			$bullet.css
				width: $link.width() - ($link.width() % 6)

			$bullet.css
				'left': $highlight.position().left + ($link.width()/2 - $bullet.width()/2)

			$bullet.show().animate
				'top': '60px'
				, 200
				, ->
					$bullet.css
						top: bottom
					shoot()

		shootAfterDoneMoving = ->
			if not doneMoving
				setTimeout(shootAfterDoneMoving, 50)
			else
				shoot()

		shootAfterDoneMoving()

		setTimeout(followLink, 100)
		return false
	)

	# Flash the...flash
	$("#flashMessage").add(".flash-success").effect("highlight", 1000, -> $(this).delay(2000).slideUp())
	$(".flash-error").effect("highlight", {}, 1000)

	$email = $("a.email")

	if $email.length > 0
		$email.add("#xmpp span").html (index, oldhtml) ->
			oldhtml.replace "(@]", "@"
		$email.attr "href", "mailto:" + $email.html().toLowerCase()

$(window).load ->
	if $('.content.videos')
		# We need to align the heights of everything
		$videos = $('.videos-wrapper figure')
		max_height = 0

		$videos.each ->
			max_height = Math.max(max_height, $(this).height())

		$videos.height(max_height)
