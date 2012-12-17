(function() {
  var $, bindNavigatorLinks, flash_failure;

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

  bindNavigatorLinks = function(outer_wrapper_selector, article_selector, model_name) {
    var $content, $loading, $outer_wrapper,
      _this = this;
    $outer_wrapper = $(outer_wrapper_selector);
    $content = $('.content');
    $loading = $content.find('> .loading');
    History.Adapter.bind(window, 'statechange', function() {
      var $articles, $current, $page, id, split_url, state;
      state = History.getState();
      split_url = state.url.split('/');
      id = split_url[split_url.length - 2];
      if (isNaN(id)) {
        $outer_wrapper.find('.current').removeClass('current');
        $('.pager').addClass('start-open');
        $content.monobombNavigator('hideClose').monobombNavigator('openToPage', 1);
        return;
      } else {
        $content.monobombNavigator('showClose');
      }
      $outer_wrapper.find('.current').removeClass('current');
      $current = $('#' + model_name + '-' + id);
      $current.addClass('current');
      $page = $current.closest('nav');
      if ($content.monobombNavigator('isOpen')) {
        $content.monobombNavigator('closeToPage', $page, false, function() {
          return $('.start-open').removeClass('start-open');
        });
      } else {
        $content.monobombNavigator('moveToPage', $page, true);
      }
      $articles = $(article_selector);
      $loading.fadeIn('fast');
      return $articles.fadeOut(function() {
        var article, _i, _len, _ref;
        _ref = $articles.slice(1);
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          article = _ref[_i];
          $(article).remove();
        }
        return $.ajax({
          type: 'GET',
          url: state.url + '.json',
          success: function(response) {
            var $article,
              _this = this;
            if (response.success) {
              $article = $(response.data);
              $article.hide();
              $(article_selector).replaceWith($article);
              $loading.fadeOut('fast');
              $('> .admin', $content).animate({
                opacity: 1
              });
              return $article.fadeIn(function() {
                var height;
                height = $article.height();
                return $content.stop().animate({
                  height: height + 140 + 'px'
                });
              });
            }
          }
        });
      });
    });
    return $outer_wrapper.delegate('a', 'click', function() {
      var $this;
      if (!$('.content').monobombNavigator('isAnimating')) {
        $this = $(this);
        History.pushState(null, 'Crashfaster • ' + $this.find('.title').text(), $this.attr('href'));
      }
      return false;
    });
  };

  $(document).ready(function() {
    var $ball, $current, $email, $highlight, $nav, $news, $past_events, clicked, left, width;
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
      bindNavigatorLinks('nav.posts', 'article.post', 'post');
    }
    $past_events = $('.past-events');
    if ($past_events.length && typeof History.Adapter !== 'undefined') {
      return bindNavigatorLinks('nav.events', 'article.event', 'event');
    }
  });

}).call(this);
