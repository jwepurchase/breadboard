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
<crl:dialogform label="Foundation Row Editor"
                componentPath="${slingRequest.requestPathInfo.suffix}"
                submitMethod="saveDialog">
    <div class="cq-dialog-content coral-FixedColumn foundation-layout-util-vmargin">
        <div class="coral-FixedColumn-column" >
            <div class="u-coral-clearFix">
                <button type="button" class="coral-Button u-coral-pullRight" v-on:click="addColumn()">Add Column</button>
            </div>
            <div class="coral-TabPanel" data-init="tabs">
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
                            <crl:checkbox label="Use Large Config" property="column.data.lrgOn"/>
                            <template v-if="column.data.lrgOn">
                                <crl:numberfield label="Width" property="column.data.lrgWidth"/>
                                <crl:numberfield label="Offset" property="column.data.lrgOffset"/>
                            </template>
                        </crl:fieldset>
                        <crl:fieldset label="Medium Media Config">
                            <crl:checkbox label="Use Medium Config" property="column.data.medOn"/>
                            <template v-if="column.data.medOn">
                                <crl:numberfield label="Width" property="column.data.medWidth"/>
                                <crl:numberfield label="Offset" property="column.data.medOffset"/>
                            </template>
                        </crl:fieldset>
                        <crl:fieldset label="Small Media Config">
                            <crl:checkbox label="Use Small Config" property="column.data.smlOn"/>
                            <template v-if="column.data.smlOn">
                                <crl:numberfield label="Width" property="column.data.smlWidth"/>
                                <crl:numberfield label="Offset" property="column.data.smlOffset"/>
                            </template>
                        </crl:fieldset>
                    </section>
                </div>
            </div>

            <crl:well label="JSON">
                {{ JSON.stringify(raw) }}
            </crl:well>

        </div>
    </div>
</crl:dialogform>
</body>
</html>

