(function() {
  var $, addRowFromTable, bindNavigatorLinks, flash_failure;

  $ = jQuery;

  String.prototype.endsWith = function(suffix) {
    return this.indexOf(suffix, this.length - suffix.length) !== -1;
  };

  $.fn.equals = function(selector) {
    return $(this).get(0) === $(selector).get(0);
  };

  $.fn.trInsertSlideDown = function(row, duration, cb) {
    var $row;
    $row = $(row);
    $row.find('td').wrapInner('<div style="display:none;" />');
    $(this).find('tbody').append($row);
    return $row.find('td > div').slideDown(duration, function() {
      var $this;
      $this = $(this);
      $(this).replaceWith($this.contents());
      if (cb) {
        return cb();
      }
    });
  };

  $.fn.trSlideUpRemove = function(duration, cb) {
    return $(this).find('td').wrapInner('<div style="display:block;" />').parent().find('td > div').slideUp(duration, function() {
      $(this).closest('tr').remove();
      if (cb) {
        return cb();
      }
    });
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

  addRowFromTable = function(table) {
    var $el, $lastInput, $row, $table, chunks, el, matches, nextId, row, _i, _j, _len, _len1, _ref, _ref1;
    $table = $(table);
    nextId = 0;
    _ref = $table.find('tbody tr');
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      row = _ref[_i];
      $lastInput = $(row).find('input:first');
      chunks = $lastInput.attr('name').split('][');
      nextId = Math.max(nextId, chunks[1]);
    }
    nextId++;
    $row = $table.find('tbody tr:last').clone();
    $row.find('input[id$=Id]').remove();
    $row.find('input[id$=Delete]').remove();
    $row.find('input[id$=Delete_]').remove();
    $row.find('.error-message').remove();
    $row.find('.error').removeClass('error');
    $row.find('.form-error').removeClass('form-error');
    _ref1 = $row.find('input, select');
    for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
      el = _ref1[_j];
      $el = $(el);
      matches = $el.attr('id').match(/(\D+)(\d+)(\D+)/);
      $el.attr('id', matches[1] + nextId + matches[3]);
      chunks = $el.attr('name').split('][');
      chunks[1] = nextId;
      $el.attr('name', chunks.join(']['));
      if (matches[3] === 'SortOrder') {
        $el.attr('value', parseInt($el.attr('value')) + 1);
      } else {
        $el.attr('value', '');
      }
    }
    $row.find('td:last').html('<a href="#" class="remove-row-from-table delete">REMOVE</a>');
    return $table.trInsertSlideDown($row);
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
    if (typeof CKEDITOR !== "undefined" && CKEDITOR !== null) {
      CKEDITOR.on('instanceCreated', function(e) {
        var $element, editor, element;
        editor = e.editor;
        element = editor.element;
        $element = $(element.$);
        if (element.is('h1', 'h2', 'h3') || $element.hasClass('no-p')) {
          editor.on('configLoaded', function() {
            editor.config.removePlugins = 'colorbutton,find,flash,font,' + 'forms,iframe,image,newpage,removeformat,scayt,' + 'smiley,specialchar,stylescombo,templates,wsc';
            editor.config.enterMode = CKEDITOR.ENTER_BR;
            editor.config.shiftEnterMode = CKEDITOR.ENTER_P;
            return editor.config.toolbarGroups = [
              {
                name: 'editing',
                groups: ['basicstyles', 'links']
              }, {
                name: 'undo'
              }, {
                name: 'clipboard',
                groups: ['selection', 'clipboard']
              }, {
                name: 'about'
              }
            ];
          });
          if ($element.hasClass('no-bar')) {
            return editor.config.toolbarGroups = [];
          }
        }
      });
      CKEDITOR.on('instanceReady', function(e) {
        e.editor.on('focus', function(ee) {
          if ($(ee.editor.element.$).hasClass('no-bar')) {
            return $('.' + ee.editor.id).hide();
          }
        });
        return e.editor.on('blur', function(ee) {
          var $el, $form, data, editor, model, url;
          editor = ee.editor;
          if (!editor.editable().isInline()) {
            return;
          }
          if (editor.checkDirty()) {
            $el = $(editor.element.$);
            model = $el.attr('data-model');
            $form = $el.next();
            $('[name="data[' + model + '][id]"]', $form).val($el.attr('data-id'));
            $('[name="data[' + model + '][' + $el.attr('data-field') + ']"]', $form).val(ee.editor.getData());
            data = $form.serialize();
            url = '/' + $el.attr('data-controller') + '/edit/' + $el.attr('data-id') + '.json';
            return $.ajax({
              type: 'POST',
              url: url,
              data: data,
              dataType: 'json',
              success: function(response) {
                console.log('RESPONSE: ', response);
                if (!response.success) {
                  return alert('Sorry, there was a problem!');
                }
              }
            });
          }
        });
      });
      $('.cke_editable').live('mouseover', function(e) {
        var $field;
        $field = $(e.target);
        if ($field.text() === '') {
          $field.css('color', '#666');
          return $field.text($field.attr('data-label'));
        }
      }).live('mouseout', function(e) {
        var $field;
        $field = $(e.target);
        if ($field.text() === $field.attr('data-label')) {
          return $field.text('');
        }
      }).live('click', function(e) {
        var $field;
        $field = $(e.target);
        $field.css('color', 'inherit');
        if ($field.text() === $field.attr('data-label')) {
          return $field.text('');
        }
      });
    }
    if ($.fn.datepicker) {
      $('.datepicker').datepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd"
      });
    }
    if ($.fn.datetimepicker) {
      $('.datetimepicker').datetimepicker({
        changeMonth: true,
        changeYear: true,
        dateFormat: "yy-mm-dd"
      });
    }
    $news = $('.content.news');
    if ($news.length && typeof History.Adapter !== 'undefined') {
      bindNavigatorLinks('nav.posts', 'article.post', 'post');
    }
    $('table#videos tbody').disableSelection().sortable({
      helper: function(e, ui) {
        ui.children().each(function() {
          return $(this).width($(this).width());
        });
        return ui;
      },
      update: function(e, ui) {
        var $form, $rows, data, ids, row;
        $rows = $(this).find('tr');
        ids = (function() {
          var _i, _len, _results;
          _results = [];
          for (_i = 0, _len = $rows.length; _i < _len; _i++) {
            row = $rows[_i];
            _results.push($(row).attr('id'));
          }
          return _results;
        })();
        $form = $('form.hidden');
        $('#VideoIds').val(ids.toString());
        data = $form.serialize();
        return $.ajax({
          type: 'POST',
          url: '/videos/sort.json',
          data: data,
          dataType: 'json',
          success: function(response) {
            return console.log('RESPONSE: ', response);
          }
        });
      }
    });
    $('table.artists tbody').add('table.sites tbody').sortable({
      helper: function(e, ui) {
        ui.children().each(function() {
          return $(this).width($(this).width());
        });
        return ui;
      },
      update: function(e, ui) {
        var $rows, order, row, _i, _len;
        $rows = $(this).find('tr');
        order = 1;
        for (_i = 0, _len = $rows.length; _i < _len; _i++) {
          row = $rows[_i];
          $(row).find('input[type=number]:first').val(order++);
        }
        return ui;
      }
    });
    $past_events = $('.past-events');
    if ($past_events.length && typeof History.Adapter !== 'undefined') {
      bindNavigatorLinks('nav.events', 'article.event', 'event');
    }
    if (jQuery.fn.autocomplete) {
      $('input#EventTitle').autocomplete({
        source: '/events/autocomplete/title.json'
      });
      $('input#EventAge').autocomplete({
        source: '/events/autocomplete/age.json'
      });
      $('input#EventPrice').autocomplete({
        source: '/events/autocomplete/price.json'
      });
      $('input#EventExternalUrl').autocomplete({
        source: '/events/autocomplete/external_url.json'
      });
    }
    if ($('#EventUsingExistingVenue').val() === '0') {
      $('.new-venue').hide();
      $('#EventVenueId').hide();
      $('.venue-portion').show();
    }
    $('.new-venue').click(function() {
      $(this).stop().slideUp();
      $('#EventVenueId').stop().slideUp();
      $('.venue-portion').slideDown();
      $('#EventUsingExistingVenue').val(0);
      return false;
    });
    $('.existing-venue').click(function() {
      $('.new-venue').stop().slideDown();
      $('#EventVenueId').stop().slideDown();
      $('.venue-portion').slideUp();
      $('#EventUsingExistingVenue').val(1);
      return false;
    });
    $('a.add-row-from-table').live('click', function() {
      addRowFromTable($($(this).attr('data-table-selector')));
      return false;
    });
    return $('a.remove-row-from-table').live('click', function() {
      $(this).closest('tr').trSlideUpRemove();
      return false;
    });
  });

}).call(this);
