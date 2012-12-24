(function() {
  var $;

  $ = jQuery;

  window.Monobomb = {
    /**
    	 * Will create a new flash-error message or reuse an existing one
    	 * and replace its contents
    	 *
    	 * @param {string} content the HTML to be placed in the message
    */

    flashError: function(content) {
      var $flash;
      $flash = $(".flash-error");
      if ($flash.length === 0) {
        $flash = $("<div>").addClass("flash-error").hide().insertBefore(".content");
      }
      $flash.html(content);
      if ($flash.css("display") === "none") {
        return $flash.slideDown(function() {
          $(this).effect("highlight", {}, 1000);
          return $flash.delay(2000).slideUp();
        });
      } else {
        return $flash.effect("highlight", {}, 1000);
      }
    }
  };

  String.prototype.endsWith = function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
  };

  $.fn.equals = function(selector) {
    return $(this).get(0) === $(selector).get(0);
  };

}).call(this);
