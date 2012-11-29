
/*
# Format:
# <div .content>
#	<div .admin />?
#	<div .all_events>
#		<div .past-events>
#			<nav .event>+
#		</div>
#	</div>
#	<nav .pager><a .back /><a .close /><a .forward /></nav>
#	<a .more />
# </div>
#
# Required setting:
#	main_nav_wrapper: .all_events
#	inner_nav_wrapper: .past-events
#	inner_elements: .event
#	controls_nav: .pager
*/


(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    monobombNavigator: function(options, args) {
      return this.each(function() {
        return new $.monobombNavigator(this, options, args);
      });
    }
  });

  $.monobombNavigator = function(elem, options, args) {
    var $first_page, closeNav, closeToPage, data, moveToPage, openNav, setButtons, settings;
    moveToPage = function(page, force) {
      var $nav, data, nav, time, _i, _len, _ref;
      data = $(elem).data('monobombNavigator');
      if (data.closed && !force) {
        return;
      }
      if (typeof page === 'number') {
        $nav = data.$inner_nav_wrapper.find(data.settings.inner_elements + ':nth-child(' + page + ')');
      } else {
        $nav = $(page);
        page = 1;
        _ref = data.$actual_navs;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          nav = _ref[_i];
          if ($(nav).equals($nav)) {
            break;
          }
          page++;
        }
      }
      time = force ? 0 : 'slow';
      data.first_page = page;
      data.$inner_nav_wrapper.stop().animate({
        left: '-' + $nav.position().left + 'px'
      }, time);
      return setButtons(data);
    };
    openNav = function() {
      data.$more.add(data.$elem.find('> article').add(data.$elem.find('.admin'))).stop().fadeOut('slow');
      data.$controls_nav.fadeIn('slow');
      data.$main_nav_wrapper.stop().animate({
        left: 0
      }, 'slow');
      data.closed = false;
      return moveToPage(Math.max(1, Math.min(data.first_page, data.nav_count - settings.visible_columns + 1)));
    };
    closeNav = function() {
      var data;
      data = $(elem).data('monobombNavigator');
      moveToPage(data.viewing);
      data.$controls_nav.fadeOut('slow');
      data.$more.add(data.$elem.find('> article').add(data.$elem.find('.admin'))).stop().fadeIn('slow');
      data.$main_nav_wrapper.stop().animate({
        left: data.original_left + 'px'
      }, 'slow');
      return data.closed = true;
    };
    closeToPage = function($nav) {
      var $elem, data, nav, _i, _len, _ref;
      $elem = $(elem);
      data = $elem.data('monobombNavigator');
      if (data.$main_nav_wrapper.position().left === data.original_left) {
        return;
      }
      data.viewing = 1;
      _ref = data.$actual_navs;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        nav = _ref[_i];
        if ($nav.equals($(nav))) {
          break;
        }
        data.viewing++;
      }
      closeNav();
      return false;
    };
    setButtons = function(data) {
      if (data.nav_count - data.first_page > data.settings.visible_columns) {
        data.$forward.removeClass('disabled');
      } else {
        data.$forward.addClass('disabled');
      }
      if (data.first_page > 1) {
        return data.$back.removeClass('disabled');
      } else {
        return data.$back.addClass('disabled');
      }
    };
    if (options && typeof options === 'string') {
      switch (options) {
        case 'closeToPage':
          closeToPage(args);
      }
      return;
    }
    settings = {
      more_selector: '> .more',
      back_selector: '.back',
      close_selector: '.close',
      forward_selector: '.forward',
      visible_columns: 4,
      main_nav_wrapper: null,
      inner_nav_wrapper: null,
      inner_elements: null,
      controls_nav: null
    };
    settings = $.extend(settings, options);
    if (!(settings.main_nav_wrapper != null) || !(settings.inner_nav_wrapper != null) || !(settings.controls_nav != null)) {
      console.log('[monobombNavigator] Error: required settings not defined.');
      return false;
    }
    data = {
      settings: settings
    };
    data.$elem = $(elem);
    data.$main_nav_wrapper = $(settings.main_nav_wrapper);
    data.$inner_nav_wrapper = data.$main_nav_wrapper.find(settings.inner_nav_wrapper);
    data.$controls_nav = $(settings.controls_nav);
    data.$more = data.$elem.find(settings.more_selector);
    data.$back = data.$controls_nav.find(settings.back_selector);
    data.$close = data.$controls_nav.find(settings.close_selector);
    data.$forward = data.$controls_nav.find(settings.forward_selector);
    data.$actual_navs = data.$inner_nav_wrapper.find(settings.inner_elements);
    data.nav_count = data.$actual_navs.length;
    data.individual_width = $(data.$actual_navs[1]).outerWidth(true);
    data.required_height = data.$inner_nav_wrapper.height();
    data.original_left = 960 - $(data.$actual_navs[1]).width();
    data.viewing = 1;
    data.first_page = 1;
    data.closed = !data.$main_nav_wrapper.hasClass('start-open');
    data.$inner_nav_wrapper.width(data.nav_count * data.individual_width + 'px');
    if (data.$elem.height() < data.required_height) {
      data.$elem.height(data.required_height + 140);
    }
    data.$elem.data('monobombNavigator', data);
    if (data.closed && ($first_page = data.$elem.find('.first-page')).length) {
      moveToPage($first_page, true);
    }
    setButtons(data);
    data.$more.click(function() {
      openNav();
      return false;
    });
    data.$close.click(function() {
      closeNav();
      return false;
    });
    data.$forward.click(function() {
      var newPage;
      if (data.$inner_nav_wrapper.is(':animated')) {
        return;
      }
      if (data.nav_count - data.first_page - 1 < data.nav_count - settings.visible_columns) {
        newPage = data.nav_count - settings.visible_columns + 1;
      } else {
        newPage = data.first_page + settings.visible_columns;
      }
      moveToPage(newPage);
      return false;
    });
    return data.$back.click(function() {
      if (data.$inner_nav_wrapper.is(':animated')) {
        return;
      }
      moveToPage(Math.max(1, data.first_page - settings.visible_columns));
      return false;
    });
  };

}).call(this);
