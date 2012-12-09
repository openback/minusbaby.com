
/**
 * @fileOverview monobombNavigator jQuery plugin
 *               Format:
 *               <div .content>
 *                 <div .admin />?
 *                 <div .all_events>
 *                 	<div .past-events>
 *                 		<nav .event>+
 *                 	</div>
 *                 </div>
 *                 <nav .pager><a .back /><a .close /><a .forward /></nav>
 *                 <a .more />
 *               </div>
 * @version 0.90
 * @author Timothy Caraballo http://pixelpod.net
 * @requires jQuery
*/


/**
 * See <a href="http://jquery.com">http://jquery.com</a>.
 * @name $
 * @class
 * See the jQuery Library  (<a href="http://jquery.com">http://jquery.com</a>) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
*/


/**
 * See <a href="http://jquery.com">http://jquery.com</a>
 * @name fn
 * @class
 * See the jQuery Library  (<a href="http://jquery.com">http://jquery.com</a>) for full details.  This just
 * documents the function and classes that are added to jQuery by this plug-in.
 * @memberOf $
*/


(function() {
  "methods:nomunge, private_: nomunge";

  var $, methods, private_;

  $ = jQuery;

  methods = {
    /**
    	 * @lends $.fn.monobombNavigator
    */

    /**
    	 * Moves so that the first or specified page is the leftmost visible page
    	 *
    	 * @example $(element).monobombNavigator('moveToPage', 2)
    	 *
    	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
    	 * @param {bool} [force] Whether to still move even if the nav is closed
    	 * @param {function} [callback] Callback
    	 *
    	 * @returns {object} Jquery object
    */

    moveToPage: function(page, force, callback) {
      var $nav, data, time;
      data = this.data('monobombNavigator');
      if (typeof page === 'function') {
        callback = page;
        page = null;
      }
      if (typeof force === 'function') {
        callback = force;
        force = false;
      }
      if (data.closed && !force) {
        return;
      }
      if (!page) {
        page = 1;
      }
      time = force ? 0 : 'slow';
      $nav = private_.getPageObject.call(this, page);
      page = private_.getPageNumber.call(this, page);
      data.first_page = page;
      data.$inner_nav_wrapper.stop().animate({
        left: '-' + $nav.position().left + 'px'
      }, time, callback);
      methods.setButtons.apply(this);
      return this;
    },
    /**
    	 * Opens so that the current or specified page is the leftmost visible page
    	 *
    	 * @example $(element).monobombNavigator('openToPage', 2)
    	 *
    	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
    	 * @param {function} [callback] Callback
    	 *
    	 * @returns {object} Jquery object
    */

    openToPage: function(page, callback) {
      var data;
      data = this.data('monobombNavigator');
      data.$more.fadeOut('slow');
      this.find('> article').add(this.find('.admin')).stop().animate({
        opacity: 0
      }, 'slow');
      data.$controls_nav.fadeIn('slow');
      data.$main_nav_wrapper.stop().animate({
        left: 0
      }, 'slow');
      data.closed = false;
      methods.moveToPage.call(this, page, false, callback);
      return this;
    },
    /**
    	 * Closes the navigator back to its original spot with the current or specified
    	 * page staying visible
    	 *
    	 * @example $(element).monobombNavigator('closeToPage', 2, false)
    	 *
    	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
    	 * @param {boolean} [show_articles] Should we redisplay the articles?
    	 * @param {function} [callback] Callback
    	 *
    	 * @returns {object} Jquery object
    */

    closeToPage: function(page, show_articles, callback) {
      var data;
      data = this.data('monobombNavigator');
      if (data.$main_nav_wrapper.position().left === data.original_left) {
        return;
      }
      if (typeof page === 'boolean') {
        callback = fade - articles;
        show_articles = page;
        page = null;
      }
      if (typeof page === 'function') {
        callback = page;
        page = null;
        show_articles = true;
      }
      if (typeof show_articles === 'function') {
        callback = show_articles;
        show_articles = true;
      }
      if (typeof show_articles !== 'boolean') {
        show_articles = true;
      }
      methods.moveToPage.call(this, page, callback);
      data.$controls_nav.fadeOut('slow');
      data.$more.fadeIn('fast');
      if (show_articles) {
        this.find('> article').add(this.find('.admin')).stop().animate({
          opacity: 100
        }, 'fast');
      }
      data.$main_nav_wrapper.stop().animate({
        left: data.original_left + 'px'
      }, 'slow', callback);
      data.closed = true;
      return this;
    },
    /**
    	 * Scrolls the navigator one full page back
    	 *
    	 * @example $(element).monobombNavigator('back')
    	 *
    	 * @param {function} [callback] Callback
    	 *
    	 * @returns {object} Jquery object
    */

    back: function(callback) {
      var data;
      data = this.data('monobombNavigator');
      if (data.$inner_nav_wrapper.is(':animated')) {
        return;
      }
      methods.moveToPage.call(this, Math.max(1, data.first_page - data.settings.visible_columns));
      return this;
    },
    /**
    	 * Scrolls the navigator one full page forward
    	 *
    	 * @example $(element).monobombNavigator('forward')
    	 *
    	 * @param {function} [callback] Callback
    	 *
    	 * @returns {object} Jquery object
    */

    forward: function(callback) {
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
      methods.moveToPage.call(this, newPage, false, callback);
      return this;
    },
    /**
    	 * Sets the control's buttons according to availability of pages
    	 *
    	 * @example $(element).monobombNavigator('setButtons')
    	 *
    	 * @returns {object} Jquery object
    */

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
    /**
    	 * Hides the control's close buttons
    	 *
    	 * @example $(element).monobombNavigator('hideClose')
    	 *
    	 * @returns {object} Jquery object
    */

    hideClose: function() {
      this.data('monobombNavigator').$close.hide();
      return this;
    },
    /**
    	 * Shows the control's close buttons
    	 *
    	 * @example $(element).monobombNavigator('showClose')
    	 *
    	 * @returns {object} Jquery object
    */

    showClose: function() {
      this.data('monobombNavigator').$close.show();
      return this;
    },
    /**
    	 * @example $(element).monobombNavigator('isAnimating')
    	 *
    	 * @returns {boolean} Whether the nav is animating
    */

    isAnimating: function() {
      return this.data('monobombNavigator').$inner_nav_wrapper.is(':animated');
    },
    /**
    	 * @example $(element).monobombNavigator('isOpen')
    	 *
    	 * @returns {boolean} of whether the nav is open
    */

    isOpen: function() {
      return this.data('monobombNavigator').$main_nav_wrapper.position().left === 0;
    },
    /**
    	 * Initializes the navigator
    	 *
    	 * @example $(element).monobombNavigator({
    	 *              main_nav_wrapper: ".members",
    	 *              inner_nav_wrapper: ".collaborator-wrapper",
    	 *              inner_elements: "dl",
    	 *              controls_nav: ".pager",
    	 *              visible_columns: 2
    	 *          })
    	 *
    	 * @param {object} options Various settings for the navigator
    	 * @config {string} main_nav_wrapper Outer wrapper selector
    	 * @config {string} inner_nav_wrapper Inner wrapper selector
    	 * @config {string} inner_elements Page selector
    	 * @config {string} controls_nav Control selector
    	 * @config {string} [more_selector] More button selector ('> .more')
    	 * @config {string} [back_selector] Back button selector '.back')
    	 * @config {string} [close_selector] Close button selector ('.close')
    	 * @config {string} [forward_selector] Forward button selector ('.forward')
    	 * @config {string} [visible_columns] Number of columns visible at once (4)
    	 *
    	 * @returns {object} Jquery object
    	 * @constructs
    */

    init: function(options) {
      var $first_page, data, individual_width, required_height, settings,
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
      data.original_left = 960 - $(data.$actual_navs[1]).width();
      data.viewing = 1;
      data.first_page = 1;
      data.closed = !data.$main_nav_wrapper.hasClass('start-open');
      this.data('monobombNavigator', data);
      individual_width = $(data.$actual_navs[1]).outerWidth(true);
      data.$inner_nav_wrapper.width(data.nav_count * individual_width + 'px');
      required_height = data.$inner_nav_wrapper.height();
      if (this.height() < required_height) {
        this.height(required_height + 140);
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
      data.$back.click(function() {
        methods.back.apply(_this);
        return false;
      });
      return this;
    }
  };

  private_ = {
    /**
    	 * @lends $.fn.monobombNavigator
    */

    /**
    	 * Returns the numberof the specified page
    	 *
    	 * @private
    	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
    	 *
    	 * @returns {int} Page number
    */

    getPageNumber: function(page) {
      var $page, data, nav, page_num, _i, _len, _ref;
      data = this.data('monobombNavigator');
      if (typeof page === 'object') {
        $page = $(page);
        page_num = 1;
        _ref = data.$actual_navs;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          nav = _ref[_i];
          if ($page.equals(nav)) {
            break;
          }
          page_num++;
        }
        return page_num;
      }
      return parseInt(page);
    },
    /**
    	 * Returns the jQuery object of the specified page
    	 *
    	 * @private
    	 * @param {mixed} [page] Page number (1 indexed) or the actual page itself
    	 *
    	 * @returns {object} Jquery object
    */

    getPageObject: function(page) {
      var data;
      if (typeof page === 'object') {
        return $(page);
      }
      data = this.data('monobombNavigator');
      return data.$inner_nav_wrapper.find(data.settings.inner_elements + ':nth-child(' + parseInt(page) + ')');
    }
  };

  /**
   * monobombNavigator - handles navigation
   *
   * @memberOf $.fn
  */


  $.fn.monobombNavigator = function(method) {
    if (methods[method]) {
      return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
    }
    return methods.init.apply(this, arguments);
  };

}).call(this);
