(function() {
  var $;

  $ = jQuery;

  $(document).ready(function() {
    var $bullet, $current, $email, $highlight, $nav, clicked, doneMoving, left, width;
    clicked = false;
    $highlight = $('<span id="highlight"/>');
    $bullet = $('<span id="ball"/>').hide();
    $nav = $('nav.main');
    $nav.append($highlight).append($bullet);
    $current = $nav.find('.current');
    if (!$current.length) {
      $current = $nav.find('a:first-child');
    }
    width = $current.width();
    left = $current.position().left;
    doneMoving = true;
    $highlight.css({
      'left': left,
      'width': width
    });
    $nav.find('li').hover(function() {
      var $a, newLeft, newWidth;
      if (clicked) {
        return;
      }
      doneMoving = false;
      $a = $(this).find('a');
      newLeft = $a.position().left;
      newWidth = $a.width();
      return $highlight.stop().animate({
        'left': newLeft,
        'width': newWidth
      }, function() {
        return doneMoving = true;
      });
    }, function() {
      if (clicked) {
        return;
      }
      doneMoving = false;
      return $highlight.stop().animate({
        'left': left,
        'width': width
      }, function() {
        return doneMoving = true;
      });
    });
    $nav.delegate('a', 'click', function() {
      var bottom, followLink, shoot, shootAfterDoneMoving, url,
        _this = this;
      if (clicked) {
        return;
      }
      clicked = true;
      bottom = $highlight.position().top - $bullet.height();
      $bullet.css({
        'left': $highlight.position().left + ($highlight.width() / 2 - $bullet.width() / 2),
        'top': bottom
      });
      url = $(this).attr('href');
      followLink = function() {
        return window.location = url;
      };
      shoot = function() {
        var $link;
        $link = $(_this);
        $bullet.css({
          width: $link.width() - ($link.width() % 6)
        });
        $bullet.css({
          'left': $highlight.position().left + ($link.width() / 2 - $bullet.width() / 2)
        });
        return $bullet.show().animate({
          'top': '60px'
        }, 200, function() {
          $bullet.css({
            top: bottom
          });
          return shoot();
        });
      };
      shootAfterDoneMoving = function() {
        if (!doneMoving) {
          return setTimeout(shootAfterDoneMoving, 50);
        } else {
          return shoot();
        }
      };
      shootAfterDoneMoving();
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
