
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

  (function($) {
    var methods;
    methods = {
      moveToPage: function(page, force, cb) {
        var $nav, data, nav, time, _i, _len, _ref;
        data = this.data('monobombNavigator');
        if (data.closed && !force) {
          return;
        }
        if (typeof page === 'undefined') {
          page = 1;
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
        }, time, cb);
        methods.setButtons.apply(this);
        return this;
      },
      openToPage: function(page, cb) {
        var data;
        data = this.data('monobombNavigator');
        data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeOut('slow');
        data.$controls_nav.fadeIn('slow');
        data.$main_nav_wrapper.stop().animate({
          left: 0
        }, 'slow');
        data.closed = false;
        methods.moveToPage.call(this, page, false, cb);
        return this;
      },
      closeToPage: function($nav, cb) {
        var data, nav, _i, _len, _ref;
        data = this.data('monobombNavigator');
        if (data.$main_nav_wrapper.position().left === data.original_left) {
          return;
        }
        if (typeof $nav === 'object') {
          data.viewing = 1;
          _ref = data.$actual_navs;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            nav = _ref[_i];
            if ($nav.equals($(nav))) {
              break;
            }
            data.viewing++;
          }
        } else {
          cb = $nav;
        }
        methods.moveToPage.call(this, data.viewing);
        data.$controls_nav.fadeOut('slow');
        data.$more.add(this.find('> article').add(this.find('.admin'))).stop().fadeIn('slow');
        data.$main_nav_wrapper.stop().animate({
          left: data.original_left + 'px'
        }, 'slow', cb);
        data.closed = true;
        return false;
      },
      back: function(cb) {
        var data;
        data = this.data('monobombNavigator');
        if (data.$inner_nav_wrapper.is(':animated')) {
          return;
        }
        methods.moveToPage.call(this, Math.max(1, data.first_page - data.settings.visible_columns));
        return this;
      },
      forward: function(cb) {
        var data, maxFirstPage, newPage;
        data = this.data('monobombNavigator');
        if (data.$inner_nav_wrapper.is(':animated')) {
          return;
        }
        newPage = data.first_page + data.settings.visible_columns;
        maxFirstPage = data.nav_count - data.settings.visible_columns + 1;
        if (newPage > maxFirstPage) {
          newPage = maxFirstPage;
        }
        methods.moveToPage.call(this, newPage, false, cb);
        return this;
      },
      setButtons: function() {
        var data;
        data = this.data('monobombNavigator');
        if (data.nav_count - data.first_page > data.settings.visible_columns - 1) {
          data.$forward.removeClass('disabled');
        } else {
          data.$forward.addClass('disabled');
        }
        if (data.first_page > 1) {
          data.$back.removeClass('disabled');
        } else {
          data.$back.addClass('disabled');
        }
        return this;
      },
      hideClose: function() {
        this.data('monobombNavigator').$close.hide();
        return this;
      },
      showClose: function() {
        this.data('monobombNavigator').$close.show();
        return this;
      },
      isAnimating: function() {
        return this.data('monobombNavigator').$inner_nav_wrapper.is(':animated');
      },
      isOpen: function() {
        return this.data('monobombNavigator').$main_nav_wrapper.position().left === 0;
      },
      init: function(options) {
        var $first_page, data, settings,
          _this = this;
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
        data.$main_nav_wrapper = $(settings.main_nav_wrapper);
        data.$inner_nav_wrapper = data.$main_nav_wrapper.find(settings.inner_nav_wrapper);
        data.$controls_nav = $(settings.controls_nav);
        data.$more = this.find(settings.more_selector);
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
        this.data('monobombNavigator', data);
        data.$inner_nav_wrapper.width(data.nav_count * data.individual_width + 'px');
        if (this.height() < data.required_height) {
          this.height(data.required_height + 140);
        }
        if (data.closed && ($first_page = this.find('.first-page')).length) {
          methods.moveToPage.call(this, $first_page, true);
        }
        methods.setButtons.apply(this);
        data.$more.click(function() {
          methods.openToPage.apply(_this);
          return false;
        });
        data.$close.click(function() {
          methods.closeToPage.apply(_this);
          return false;
        });
        data.$forward.click(function() {
          methods.forward.apply(_this);
          return false;
        });
        return data.$back.click(function() {
          methods.back.apply(_this);
          return false;
        });
      }
    };
    return $.fn.monobombNavigator = function(method) {
      if (methods[method]) {
        return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
      }
      return methods.init.apply(this, arguments);
    };
  })(jQuery);

}).call(this);
