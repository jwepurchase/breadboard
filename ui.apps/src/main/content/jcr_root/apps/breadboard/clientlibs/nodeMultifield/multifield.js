_.isNotEmpty = function(object){
    return ! _.isEmpty(object);
};

(function () {
    var DATA_EAEM_NESTED = "data-eaem-nested";
    var CFFW = ".coral-Form-fieldwrapper";

    //reads multifield data from server, creates the nested composite multifields and fills them
    function addDataInFields() {

        $(document).on("dialog-ready", function() {
            var $multifield = $("[" + DATA_EAEM_NESTED + "]").first();

            if (_.isNotEmpty($multifield)) {

                var childPrefix = $multifield.attr('data-element-prefix');

                var actionUrl = $(".cq-dialog").attr("action") + ".infinity.json";

                $.ajax(actionUrl).done(function(data){

                    _.each(data, function(value, key){
                        if (key.startsWith(childPrefix)) {

                            $multifield.find(".js-coral-Multifield-add").click();

                            _.each(data[key], function(fValue, fKey){
                                if (fKey != "jcr:primaryType") {
                                    var $field = $multifield.find("[name='./" + fKey +"']").last();
                                    if(!_.isEmpty($field)) {
                                        $field.val(fValue);
                                    }
                                }
                            });
                        }
                    });
                });

            }

        });
    }

    //collect data from widgets in multifield and POST them to CRX
    function collectDataFromFields(){
        function fillValue($form, fieldSetName, $field, counter){
            var name = $field.attr("name");

            if (name) {
                //strip ./
                if (name.indexOf("./") == 0) {
                    name = name.substring(2);
                }

                //remove the field, so that individual values are not POSTed
                $field.remove();

                $('<input />').attr('type', 'hidden')
                    .attr('name', fieldSetName + "/" + counter + "/" + name)
                    .attr('value', $field.val())
                    .appendTo($form);
            }

        }

        $(document).on("click", ".cq-dialog-submit", function () {
            var $multifield = $("[" + DATA_EAEM_NESTED + "]").first();

            if( _.isNotEmpty($multifield)){
                var childPrefix = $multifield.attr('data-element-prefix');
                var $form = $(this).closest("form.foundation-form");
                var $fieldSets;
                var $fields;

                $fieldSets = $multifield.find("[class='coral-Form-fieldset']");

                $fieldSets.each(function (counter, fieldSet) {
                    $fields = $(fieldSet).children().children(CFFW);

                    $fields.each(function (j, field) {
                        fillValue($form, $(fieldSet).data("name"), $(field).find("[name]"), childPrefix + (counter + 1));
                    });
                });
            }
        });
    }

    $(document).ready(function () {
        addDataInFields();
        collectDataFromFields();
    });
})();