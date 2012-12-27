(function() {
  var $, $ji, $jp, $sections, $tracks, album_width, currentTrack, nav, playlist, volume, _fn, _i, _len;

  $ = jQuery;

  $sections = $('.albums > nav');

  album_width = $($sections[0]).find('li:first').outerWidth(true);

  _fn = function(nav) {
    var $back, $forward, $list, $nav, album_count, min_left,
      _this = this;
    $nav = $(nav);
    album_count = $nav.find('li').length;
    min_left = -album_width * (album_count - 4);
    $forward = $nav.find('.forward');
    $back = $nav.find('.back');
    $back.addClass('disabled');
    $list = $nav.find('ul');
    $nav.find('ul').width(album_count * album_width + 'px');
    if (album_count <= 4) {
      $forward.addClass('disabled');
    }
    $forward.click(function() {
      var current_left, delta;
      if ($forward.hasClass('disabled') || $list.is(':animated')) {
        return false;
      }
      current_left = $list.position().left;
      delta = 4 * album_width;
      if (current_left - delta < min_left) {
        delta = current_left - min_left;
      }
      $back.removeClass('disabled');
      if (current_left - delta === min_left) {
        $forward.addClass('disabled');
      }
      $list.animate({
        left: '-=' + delta + 'px'
      }, 'slow');
      return false;
    });
    return $back.click(function() {
      var current_left, delta;
      if ($back.hasClass('disabled') || $list.is(':animated')) {
        return false;
      }
      current_left = $list.position().left;
      if (current_left === 0) {
        return false;
      }
      delta = 4 * album_width;
      if (current_left - delta < 0) {
        delta = -current_left;
      }
      $forward.removeClass('disabled');
      if (current_left + delta === 0) {
        $back.addClass('disabled');
      }
      $list.animate({
        left: '+=' + delta + 'px'
      }, 'slow');
      return false;
    });
  };
  for (_i = 0, _len = $sections.length; _i < _len; _i++) {
    nav = $sections[_i];
    _fn(nav);
  }

  $jp = $("#jquery_jplayer");

  $ji = $("#jp_interface");

  $tracks = $jp.nextAll("dl.tracks");

  playlist = [];

  volume = 0.8;

  currentTrack = 0;

  $tracks.find("a").each(function(index) {
    var songUrl;
    songUrl = $(this).attr("href");
    playlist.push(songUrl);
    return $(this).click(function(e) {
      $jp.jPlayer("setMedia", {
        mp3: songUrl
      }).jPlayer("play");
      currentTrack = index;
      return false;
    });
  });

  if (playlist.length > 0) {
    $jp.jPlayer({
      swfPath: "/swf",
      solution: "flash, html",
      cssSelectorAncestor: "#jp_interface",
      preload: "none",
      volume: volume,
      ready: function() {
        return $(this).jPlayer("setMedia", {
          mp3: playlist[0]
        });
      }
    }).bind($.jPlayer.event.play, function() {
      $(this).jPlayer("pauseOthers");
      $ji.find(".jp-play").css("display", "none");
      $ji.find(".jp-stop").css("display", "inline-block");
      $tracks.find("dd").each(function(index) {
        return $(this).removeClass("jp-playlist-current");
      });
      return $tracks.find("dd a[href=\"" + playlist[currentTrack] + "\"]").parent().addClass("jp-playlist-current");
    }).bind($.jPlayer.event.pause, function() {
      $ji.find(".jp-stop").css("display", "none");
      $ji.find(".jp-play").css("display", "inline-block");
      return $tracks.find("dd.jp-playlist-current").removeClass("jp-playlist-current");
    }).bind($.jPlayer.event.ended, function(e) {
      currentTrack += 1;
      if (currentTrack < playlist.length) {
        return $(this).jPlayer("setMedia", {
          mp3: playlist[currentTrack]
        }).jPlayer("play");
      } else {
        currentTrack = 0;
        $(this).jPlayer("setMedia", {
          mp3: playlist[currentTrack]
        });
        $ji.find(".jp-stop").css("display", "none");
        $ji.find(".jp-play").css("display", "inline-block");
        return $tracks.find("dd").removeClass("jp-playlist-current");
      }
    }).bind($.jPlayer.event.error, function(e) {
      $ji.find(".jp-stop").css("display", "none");
      $ji.find(".jp-play").css("display", "inline-block");
      return $tracks.find("dd.jp-playlist-current").removeClass("jp-playlist-current");
    });
    $ji.find(".jp-lower").click(function() {
      if (volume > 0.0) {
        volume -= 0.1;
        volume = parseFloat(volume.toFixed(1));
        $jp.jPlayer("volume", volume);
      }
      return false;
    });
    $ji.find(".jp-higher").click(function() {
      if (volume < 1.0) {
        volume += 0.1;
        volume = parseFloat(volume.toFixed(1));
        $jp.jPlayer("volume", volume);
      }
      return false;
    });
  }

}).call(this);
