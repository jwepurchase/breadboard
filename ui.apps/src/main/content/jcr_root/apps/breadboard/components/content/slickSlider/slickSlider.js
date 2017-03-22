"use strict";

var global = this;

use(["list.js"], function(List){

    return List.then(function(ListObject){

        ListObject.listId = ListObject.listId.replace("/","__");
        return ListObject;
    });

});