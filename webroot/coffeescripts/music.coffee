$ = jQuery

$sections = $('.albums > nav')
album_width = $($sections[0]).find('li:first').outerWidth(true)

for nav in $sections
	do (nav) ->
		$nav = $(nav)
		album_count = $nav.find('li').length
		max_left = if album_count >= 2 then - album_width * (album_count - 2) else 0
		$forward = $nav.find('.forward')
		$back = $nav.find('.back')
		$back.addClass('disabled')
		$list = $nav.find('ul')

		$nav.find('ul').width(album_count * album_width + 'px')
		$forward.addClass('disabled') if album_count <= 2

		$forward.click =>
			return false if $forward.hasClass('disabled') or $list.is(':animated')
			current_left = $list.position().left

			return false if current_left is max_left

			delta = if current_left - album_width is max_left then album_width else 2 * album_width

			$back.removeClass('disabled')
			$forward.addClass('disabled') if current_left - delta is max_left

			$list.animate
				left: '-=' + delta + 'px'
				'slow'

			false

		$back.click =>
			return false if $back.hasClass('disabled') or $list.is(':animated')
			current_left = $list.position().left

			return false if not current_left

			delta = if current_left + album_width is 0 then album_width else 2 * album_width

			$forward.removeClass('disabled')
			$back.addClass('disabled') if current_left + delta is 0

			$list.animate
				left: '+=' + delta + 'px'
				'slow'

			false

$jp = $("#jquery_jplayer")
$ji = $("#jp_interface")
$tracks = $jp.nextAll("dl.tracks")
playlist = []
volume = 0.8
currentTrack = 0

# Save this album's track into a playlist
$tracks.find("a").each (index) ->
	songUrl = $(this).attr("href")
	playlist.push songUrl

	$(this).click (e) ->
		$jp.jPlayer("setMedia",
			mp3: songUrl
		).jPlayer "play"
		currentTrack = index
		false

if playlist.length > 0
	# debug: true,
	$jp.jPlayer(
		swfPath: "/swf"
		solution: "flash, html"
		cssSelectorAncestor: "#jp_interface"
		preload: "none"
		volume: volume
		ready: ->
			$(this).jPlayer "setMedia",
				mp3: playlist[0]

	).bind($.jPlayer.event.play, ->
		$(this).jPlayer "pauseOthers"
		$ji.find(".jp-play").css "display", "none"
		$ji.find(".jp-stop").css "display", "inline-block"
		$tracks.find("dd").each (index) ->
			$(this).removeClass "jp-playlist-current"

		$tracks.find("dd a[href=\"" + playlist[currentTrack] + "\"]").parent().addClass "jp-playlist-current"
	).bind($.jPlayer.event.pause, ->
		$ji.find(".jp-stop").css "display", "none"
		$ji.find(".jp-play").css "display", "inline-block"
		$tracks.find("dd.jp-playlist-current").removeClass "jp-playlist-current"
	).bind($.jPlayer.event.ended, (e) ->
		currentTrack += 1
		if currentTrack < playlist.length
			$(this).jPlayer("setMedia",
				mp3: playlist[currentTrack]
			).jPlayer "play"
		else
			currentTrack = 0
			$(this).jPlayer "setMedia",
				mp3: playlist[currentTrack]

			$ji.find(".jp-stop").css "display", "none"
			$ji.find(".jp-play").css "display", "inline-block"
			$tracks.find("dd").removeClass "jp-playlist-current"
	).bind $.jPlayer.event.error, (e) ->
		$ji.find(".jp-stop").css "display", "none"
		$ji.find(".jp-play").css "display", "inline-block"
		$tracks.find("dd.jp-playlist-current").removeClass "jp-playlist-current"

	# alert(e.jPlayer.error.message);
	$ji.find(".jp-lower").click ->
		if volume > 0.0
			volume -= 0.1

			# Damn silly JS precisions
			volume = parseFloat(volume.toFixed(1))
			$jp.jPlayer "volume", volume
		false

	$ji.find(".jp-higher").click ->
		if volume < 1.0
			volume += 0.1

			# Damn silly JS precisions
			volume = parseFloat(volume.toFixed(1))
			$jp.jPlayer "volume", volume
		false

