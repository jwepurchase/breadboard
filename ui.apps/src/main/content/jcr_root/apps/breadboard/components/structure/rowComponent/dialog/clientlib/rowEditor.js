(function ($, $document) {
    "use strict"

    $document.on("dialog-ready", function(){


            var componentPath = $('#rowDlg').attr("data-component-path");
            $.get(componentPath + '.infinity.json', function(data){

                var columns = [];

                _.keys(data).forEach(function(key){
                    if(key.startsWith("col-")) {
                        var column = {
                            data: data[key],
                            name: key,
                            active: false
                        };
                        columns.push(column);
                    }
                });

                columns[0].active = true;

                var dlg = new Vue({
                    el: '#rowDlg',
                    data: {
                        columns: columns,
                        raw: data
                    },
                    methods: {
                        clickTab: function(index) {
                            for (var i = 0 ; i < columns.length; i++) {
                                if(i != index) {
                                    columns[i].active = false;
                                } else {
                                    columns[i].active = true;
                                }
                            }
                        },
                        saveDialog: function(event) {
                            //event.preventDefault();

                            $.ajax({
                                type: "POST",
                                url: componentPath,
                                data: {
                                    ':operation': 'import',
                                    ':contentType': 'json',
                                    ':content': JSON.stringify(dlg.raw),
                                    ':replace': true,
                                    ':replaceProperties': true
                                }

                            })
                                .done(function(msg){
                                    console.log("data saved");
                                });
                        },
                        addColumn: function() {
                            var newColumn = {
                                data: {
                                    'jcr:primaryType': 'nt:unstructured',
                                    lrgOn: true,
                                    lrgWidth: 0,
                                    lrgOffset: 0,
                                    medOn: false,
                                    medWidth: 0,
                                    medOffset: 0,
                                    smlOn: false,
                                    smlWidth: 0,
                                    smlOffset: 0,
                                    end: false,
                                    lrgCentered:'default',
                                    medCentered:'default',
                                    smlCentered:'default'
                                },
                                name: 'col-'+new String(columns.length + 1),
                                active: false
                            }

                            columns.push(newColumn);
                            dlg.raw[newColumn.name] = newColumn.data;
                            dlg.methods.clickTab(columns.length - 1);
                        }
                    }
                });


            });



    });
}) ($, $(document));
