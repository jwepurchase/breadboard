function Validatable(selector, validation) {

  this.selector = selector;

  this.validate = validation;

  this.show = function(el, message) {
      var fieldErrorEl = $("<span class='coral-Form-fielderror coral-Icon coral-Icon--alert coral-Icon--sizeS' data-init='quicktip' data-quicktip-type='error' />");

      var field = el.closest(".coral-Form-field");
      field.attr("aria-invalid", "true").toggleClass("is-invalid", true);
      field.nextAll(".coral-Form-fieldinfo").addClass("u-coral-screenReaderOnly");

      var error = field.nextAll(".coral-Form-fielderror");
      if (error.length === 0) {
          var arrow = field.closest("form").hasClass("coral-Form--vertical") ? "right" : "top";

          fieldErrorEl
              .attr("data-quicktip-arrow", arrow)
              .attr("data-quicktip-content", message)
              .insertAfter(field);

      } else {
          error.data("quicktipContent", message);
      }
  };

  this.clear = function(el){
      var field = el.closest(".coral-Form-field");
      field.removeAttr("aria-invalid").removeClass("is-invalid");
      field.nextAll(".coral-Form-fielderror").tooltip("hide").remove();
      field.nextAll(".coral-Form-fieldinfo").removeClass("u-coral-screenReaderOnly");
  }
}

(function (document, $, ns){

    "use strict";

    var minAutoPlaySpeed = new Validatable(
        '.field-autoplaySpeed .js-coral-NumberInput-input',
        function(el){
            var field = el.closest(".coral-Form-field");
            var value = new Number(el.val());

            if (value < 0) {
                return Granite.I18n.get("Autoplay Speed must be at least zero");
            }
        }
    )
    $.validator.register(minAutoPlaySpeed);

    var minSlidesToShow = new Validatable(
        '.field-slidesToShow .js-coral-NumberInput-input',
        function(el) {
            var value= new Number(el.val());
            if (value < 1) {
                return Granite.I18n.get("Slides to Show must be at least one");
            }
        }
    );
    $.validator.register(minSlidesToShow);

    var minSlidesToScroll = new Validatable(
        '.field-slidesToScroll .js-coral-NumberInput-input',
        function(el) {
            var value= new Number(el.val());
            if (value < 1) {
                return Granite.I18n.get("Slides to Scroll must be at least one");
            }
        }
    );
    $.validator.register(minSlidesToScroll);

}) (document, Granite.$, Granite.author);
