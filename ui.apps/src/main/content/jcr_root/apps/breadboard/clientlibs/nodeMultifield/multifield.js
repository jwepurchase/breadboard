(function () {
    var DATA_EAEM_NESTED = "data-eaem-nested";
    var CFFW = ".coral-Form-fieldwrapper";

    //reads multifield data from server, creates the nested composite multifields and fills them
    function addDataInFields() {

        function buildMultiField(data, $multifield, mName){
            if(_.isEmpty(mName) || _.isEmpty(data)){
                return;
            }

            _.each(data, function(value, key){
                if(key == "jcr:primaryType"){
                    return;
                }

                $multifield.find(".js-coral-Multifield-add").click();

                _.each(value, function(fValue, fKey){
                    if(fKey == "jcr:primaryType"){
                        return;
                    }

                    var $field = $multifield.find("[name='./" + fKey + "']").last();

                    if(_.isEmpty($field)){
                        return;
                    }

                    $field.val(fValue);
                });
            });
        }

        $(document).on("dialog-ready", function() {
            var $multifield = $("[" + DATA_EAEM_NESTED + "]").first();

            var actionUrl = $(".cq-dialog").attr("action") + ".infinity.json";

            $.ajax(actionUrl).done(function(data){

                _.each(data, function(value, key){
                    if (key.startsWith("item-")) {

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
        });
    }

    //collect data from widgets in multifield and POST them to CRX
    function collectDataFromFields(){
        function fillValue($form, fieldSetName, $field, counter){
            var name = $field.attr("name");

            if (!name) {
                return;
            }

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

        $(document).on("click", ".cq-dialog-submit", function () {
            var $multifields = $("[" + DATA_EAEM_NESTED + "]");

            if(_.isEmpty($multifields)){
                return;
            }

            var $form = $(this).closest("form.foundation-form");
            var $fieldSets;
            var $fields;

            $multifields.each(function(i, multifield){
                $fieldSets = $(multifield).find("[class='coral-Form-fieldset']");

                $fieldSets.each(function (counter, fieldSet) {
                    $fields = $(fieldSet).children().children(CFFW);

                    $fields.each(function (j, field) {
                        fillValue($form, $(fieldSet).data("name"), $(field).find("[name]"), "item-" + (counter + 1));
                    });
                });
            });
        });
    }

    $(document).ready(function () {
        addDataInFields();
        collectDataFromFields();
    });
})();