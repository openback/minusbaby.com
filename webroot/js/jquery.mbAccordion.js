(function($) {
    var $openSection = null,
        settings = {
            toggled_selector: 'article',
            close: '.close',
            scrollTo: true,
            onInit: null,
            onBeforeOpen: null,
            onAfterOpen: null,
            onBeforeClose: null,
            onAfterClose: null
        },
        methods = {
            callback: function(name, toApply) {
                if (typeof settings[name] === 'function') {
                    settings[name].apply(toApply);
                }
            },
            init: function(options) {
                this.each(function() {
                    if (options) {
                        $.extend(settings, options);
                    }

                    $(this).click(methods.click);
                    // check if this one is open already
                    $toggled_el = $(this).siblings(settings.toggled_selector);

                    if ($toggled_el.css('display') !== 'none') {
                        $openSection = $toggled_el;
                    }

                    $(settings.close).click(methods.close);
                });

                methods.callback('onInit', this);

                return this;
            },
            close: function(e) {
                if ($openSection) {
                    methods.callback('onBeforeClose', $openSection);

                    $openSection.slideUp(400, function () {
                        methods.callback('onAfterClose', this);
                    }).siblings(settings.close).fadeOut(400);
                }

                $openSection = null;

                if (typeof e === 'object' && e.preventDefault) {
                    e.preventDefault();
                }

                return this;
            },
            click: function(e) {
                var $sectionToShow = $(this).siblings('article');

                if ($sectionToShow.equals($openSection)) {
                    methods.close();
                } else {
                    methods.close();
                    methods.callback('onBeforeOpen', $sectionToShow);

                    $sectionToShow.slideDown('slow');
                    $sectionToShow.siblings(settings.close).fadeIn('slow', function () {
                        methods.callback('onAfterOpen', $sectionToShow);
                        if ($.fn.scrollTo && settings.scrollTo) {
                            $.scrollTo(this, 'slow');
                        }
                    });

                    $openSection = $sectionToShow;
                }

                e.preventDefault();

                return this;
            }
        };
    $.fn.mbAccordion = function(method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === 'object' || !method) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' +  method + ' does not exist on jQuery.mbAccordion');
        }
    }
})(jQuery);
