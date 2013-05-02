(function() {
  var addRowFromTable;

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
        if ($el.attr('type') === 'checkbox') {
          $el.attr('value', 1);
        } else if ($el.attr('id').endsWith('_')) {
          $el.attr('value', 0);
        } else {
          $el.attr('value', '');
        }
      }
    }
    $row.find('td:last').html('<a href="#" class="remove-row-from-table delete">REMOVE</a>');
    return $table.trInsertSlideDown($row);
  };

  $(document).ready(function() {
    if (typeof CKEDITOR !== "undefined" && CKEDITOR !== null) {
      CKEDITOR.on('instanceCreated', function(e) {
        var $element, editor, element;
        editor = e.editor;
        element = editor.element;
        $element = $(element.$);
        editor.config.removePlugins = 'sourcearea';
        editor.config.extraPlugins = 'sourcedialog';
        editor.config.allowedContent = true;
        editor.config.toolbar = [
          {
            name: 'text',
            items: ['Bold']
          }, {
            name: 'clipboard',
            items: ['Source', 'PasteText', 'PasteFromWord']
          }, {
            name: 'format',
            items: ['RemoveFormat']
          }, {
            name: 'html',
            items: ['Link', 'Unlink', 'HorizontalRule', 'Sourcedialog']
          }
        ];
        if (element.is('h1', 'h2', 'h3') || $element.hasClass('no-p')) {
          editor.on('configLoaded', function() {
            editor.config.removePlugins = 'colorbutton,find,flash,font,' + 'forms,iframe,image,newpage,removeformat,scayt,' + 'smiley,specialchar,stylescombo,templates,wsc,sourcearea';
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
                if (!response.success) {
                  return Monobomb.flashError('Sorry, there was a problem saving that item. (' + response.data + ')');
                }
              },
              error: function(jqXHR, textStatus, errorThrown) {
                return Monobomb.flashError('Sorry, there was a problem saving that item. (' + textStatus + ')');
              }
            });
          }
        });
      });
      $('.cke_editable').live('mouseover', function(e) {
        var $field;
        $field = $(e.target);
        if ($field.text() === '') {
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
            if (!response.success) {
              return Monobomb.flashError('Sorry, there was a problem reording the videos. (' + response.data + ')');
            }
          },
          error: function(jqXHR, textStatus, errorThrown) {
            return Monobomb.flashError('Sorry, there was a problem reording the videos. (' + textStatus + ')');
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
