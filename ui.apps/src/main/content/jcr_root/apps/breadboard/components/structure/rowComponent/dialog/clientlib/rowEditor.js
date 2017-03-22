function RowEditor(contentPath, dialogPath) {
    var self = this;
    self.contentPath = contentPath;
    self.dialogPath = dialogPath;
    self.model = {};

    $.get(action.path + '.infinity.json', function(data){
        self.model = data;
        self.createFormFields();
    });

    var createFormFields = function() {
        console.log("creating form fields");
        var fields = $("#foundation_row_editor_fields");
        fields.append('<div id="myFirstAlert"></div>');
        new CUI.Alert({

            element: '#myFirstAlert',
            heading: 'HOORAY',
            content: 'Three cheers for Coral',
            closeable: true
        });
    }
}
