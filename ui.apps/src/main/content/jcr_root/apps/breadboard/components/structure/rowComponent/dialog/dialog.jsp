<%@ page session="false" %>
<%@ taglib prefix="auth" uri="http://www.johnpurchase.com/breadboard/tags/authoring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@ taglib prefix ="crl" tagdir="/WEB-INF/tags/apps/breadboard/tags" %>

<cq:defineObjects/>
<html>
<head>
</head>
<body class="coral--light">
<form id="rowDlg"
      v-on:submit="saveDialog"
      data-component-path="${slingRequest.requestPathInfo.suffix}"
      class="coral-Form coral-Text cq-dialog foundation-form content foundation-layout-form cq-dialog-floating coral-Form--aligned coral--dark">
    <nav class="cq-dialog-header u-coral-clearFix cq-dialog-dragging">
        <h2 class="coral-Heading coral-Heading--2 u-coral-pullLeft">Foundation Row Editor</h2>
        <div class="cq-dialog-actions u-coral-pullRight">
            <button type="button" class="coral-MinimalButton cq-dialog-header-action cq-dialog-cancel" title="Cancel">
                <i class="coral-Icon coral-Icon--close"></i>
            </button>
            <button class="coral-MinimalButton cq-dialog-header-action cq-dialog-submit" title="Done">
                <i class="coral-Icon coral-Icon--check"></i>
            </button>
        </div>
    </nav>
    <div class="cq-dialog-content coral-FixedColumn foundation-layout-util-vmargin">
        <div class="coral-FixedColumn-column" >
            <div class="u-coral-clearFix">
                <button type="button" class="coral-Button u-coral-pullRight" v-on:click="addColumn()">Add Column</button>
            </div>
            <div class="coral-TabPanal" data-init="tabs">
                <nav class="coral-TabPanel-navigation">
                    <a data-toggle="tab"
                       href="#"
                       v-bind:class="{'coral-TabPanel-tab': true, 'is-active': column.active}"
                       v-for="(column, index) in columns"
                       v-on:click="clickTab(index)">
                        {{column.name}}
                    </a>
                </nav>
                <div class="coral-TabPanel-content">
                    <section v-bind:id="column.name"
                             v-bind:class="{'coral-TabPanel-pane': true, 'is-active': column.active}"
                             v-for="column in columns"
                             role="tabpanel">
                        <crl:fieldset label="Large Media Config">
                            <crl:numberfield label="Width" dataRef="column.data.lrgWidth"/>
                            <crl:numberfield label="Offset" dataRef="column.data.lrgOffset"/>
                        </crl:fieldset>
                        <crl:fieldset label="Medium Media Config">
                            <crl:numberfield label="Width" dataRef="column.data.medWidth"/>
                            <crl:numberfield label="Offset" dataRef="column.data.medOffset"/>
                        </crl:fieldset>
                        <crl:fieldset label="Small Media Config">
                            <crl:numberfield label="Width" dataRef="column.data.smlWidth"/>
                            <crl:numberfield label="Offset" dataRef="column.data.smlOffset"/>
                        </crl:fieldset>
                    </section>
                </div>
            </div>

            <%--
            <section class="u-columnMedium">
                <h4 class="coral-Heading coral-Heading--4">JSON</h4>
                <div class="coral-Well">
                    {{ JSON.stringify(raw) }}
                </div>
            </section>
            --%>

        </div>
    </div>
</form>
</body>
</html>

