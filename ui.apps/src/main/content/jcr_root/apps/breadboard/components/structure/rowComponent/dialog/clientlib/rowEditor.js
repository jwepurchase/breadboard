(function ($, $document) {
    "use strict"

    $document.on("dialog-ready", function(){




            $.getScript('/etc/designs/breadboard/clientlib-site/vue.js')
                .done(function( script, textStatus ) {

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
                                            lrgWidth: 0,
                                            lrgOffset: 0,
                                            medWidth: 0,
                                            medOffset: 0,
                                            smlWidth: 0,
                                            smlOffset: 0
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

                })
                .fail(function( jqxhr, settings, exception ) {
                    console.log("failed to load vue: " + exception);
                });


    });
}) ($, $(document));
