$ = jQuery

$sections = $('.albums > nav')
album_width = $($sections[0]).find('li:first').outerWidth(true)

for nav in $sections
	do (nav) ->
		$nav = $(nav)
		album_count = $nav.find('li').length
		min_left = - album_width * (album_count - 4)
		$forward = $nav.find('.forward')
		$back = $nav.find('.back')
		$list = $nav.find('ul')

		$nav.find('ul').width(album_count * album_width + 'px')
		$back.addClass('disabled')
		$forward.addClass('disabled') if album_count <= 4

		$forward.click =>
			return false if $forward.hasClass('disabled') or $list.is(':animated')
			current_left = $list.position().left

			delta = 4 * album_width
			delta = current_left - min_left if current_left - delta < min_left

			$back.removeClass('disabled')
			$forward.addClass('disabled') if current_left - delta is min_left

			$list.animate
				left: '-=' + delta + 'px'
				'slow'

			false

		$back.click =>
			return false if $back.hasClass('disabled') or $list.is(':animated')
			current_left = $list.position().left

			return false if current_left == 0

			delta = 4 * album_width
			delta = -current_left if current_left + delta > 0

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

