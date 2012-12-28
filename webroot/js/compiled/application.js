(function() {
  var $;

  $ = jQuery;

  $(document).ready(function() {
    var $ball, $current, $email, $highlight, $nav, clicked, left, width;
    clicked = false;
    $highlight = $('<span id="highlight"/>');
    $ball = $('<span id="ball"/>').hide();
    $nav = $('nav.main');
    $nav.append($highlight).append($ball);
    $current = $nav.find('.current');
    if (!$current.length) {
      $current = $nav.find('a:first-child');
    }
    width = $current.width();
    left = $current.position().left;
    $highlight.css({
      'left': left,
      'width': width
    });
    $nav.find('li').hover(function() {
      var $a, newLeft, newWidth;
      if (clicked) {
        return;
      }
      $a = $(this).find('a');
      newLeft = $a.position().left;
      newWidth = $a.width();
      return $highlight.stop().animate({
        'left': newLeft,
        'width': newWidth
      });
    }, function() {
      if (clicked) {
        return;
      }
      return $highlight.stop().animate({
        'left': left,
        'width': width
      });
    });
    $nav.delegate('a', 'click', function() {
      var bottom, bouncy, followLink, url;
      if (clicked) {
        return;
      }
      clicked = true;
      bottom = $highlight.position().top - $ball.height();
      $ball.css({
        'left': $highlight.position().left + ($highlight.width() / 2 - $ball.width() / 2),
        'top': bottom
      });
      url = $(this).attr('href');
      followLink = function() {
        return window.location = url;
      };
      bouncy = function() {
        return $ball.animate({
          'top': '60px'
        }, 100, function() {
          return $ball.animate({
            'top': bottom
          }, 100, bouncy);
        });
      };
      $ball.show().animate({
        'top': '60px',
        'left': $(this).position().left + ($(this).width() / 2 - $ball.width() / 2)
      }, 100, bouncy);
      setTimeout(followLink, 100);
      return false;
    });
    $("#flashMessage").add(".flash-success").effect("highlight", 1000, function() {
      return $(this).delay(2000).slideUp();
    });
    $(".flash-error").effect("highlight", {}, 1000);
    $email = $("a.email");
    if ($email.length > 0) {
      $email.add("#xmpp span").html(function(index, oldhtml) {
        return oldhtml.replace("(@]", "@");
      });
      return $email.attr("href", "mailto:" + $email.html().toLowerCase());
    }
  });

  $(window).load(function() {
    var $videos, max_height;
    if ($('.content.videos')) {
      $videos = $('.videos-wrapper figure');
      max_height = 0;
      $videos.each(function() {
        return max_height = Math.max(max_height, $(this).height());
      });
      return $videos.height(max_height);
    }
  });

}).call(this);
