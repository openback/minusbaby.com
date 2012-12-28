$ = jQuery

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
