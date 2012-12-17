(function() {
  var $, flash_failure;

  $ = jQuery;

  String.prototype.endsWith = function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
  };

  $.fn.equals = function(selector) {
    return $(this).get(0) === $(selector).get(0);
  };

  flash_failure = function(content) {
    var $flash;
    $flash = $(".flash-failure");
    if ($flash.length === 0) {
      $flash = $("<div>").addClass("flash-failure").hide().prependTo("#content");
    }
    $flash.html(content);
    if ($flash.css("display") === "none") {
      return $flash.slideDown("slow", function() {
        return $(this).effect("highlight", {}, 1000);
      });
    } else {
      return $flash.effect("highlight", {}, 1000);
    }
  };

  $(document).ready(function() {
    var $ball, $current, $email, $highlight, $nav, $news, clicked, left, width;
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
    $(".flash-failure").effect("highlight", {}, 1000);
    $email = $("a.email");
    if ($email.length > 0) {
      $email.add("#xmpp span").html(function(index, oldhtml) {
        return oldhtml.replace("(@]", "@");
      });
      $email.attr("href", "mailto:" + $email.html().toLowerCase());
    }
    $news = $('.content.news');
    if ($news.length && typeof History.Adapter !== 'undefined') {
      return bindNavigatorLinks('nav.posts', 'article.post', 'post');
    }
  });

}).call(this);
