<%@ page session="false" %>
<%@ taglib prefix="auth" uri="http://www.johnpurchase.com/breadboard/tags/authoring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@ taglib prefix="crl" tagdir="/WEB-INF/tags/apps/breadboard/tags" %>

<cq:defineObjects/>
<html>
<head>
</head>
<body class="coral--light">
<crl:dialogform label="Foundation Row Editor"
                componentPath="${slingRequest.requestPathInfo.suffix}"
                submitMethod="saveDialog">
    <div class="cq-dialog-content coral-FixedColumn foundation-layout-util-vmargin">
        <div class="coral-FixedColumn-column">
            <div class="u-coral-clearFix">
                <button type="button" class="coral-Button u-coral-pullRight" v-on:click="addColumn()">Add Column
                </button>
            </div>
            <crl:indextabs items="columns" item="column">
                <crl:fieldset label="Large Screens" size="4">
                    <crl:checkbox label="Use Large Configuration" property="column.data.lrgOn"/>
                    <template v-if="column.data.lrgOn">
                        <crl:numberfield label="Width" property="column.data.lrgWidth"/>
                        <crl:numberfield label="Offset" property="column.data.lrgOffset"/>
                        <crl:fieldset label="Source Ordering" size="6">
                                <crl:radiogroup property="column.data.lrgOrdering"
                                                controlName="lrgOrdering">
                                    <crl:radiobutton value="none">None</crl:radiobutton>
                                    <crl:radiobutton value="push">Push</crl:radiobutton>
                                    <crl:radiobutton value="pull">Pull</crl:radiobutton>
                                </crl:radiogroup>
                            <template v-if="column.data.lrgOrdering != 'none'">
                                <crl:numberfield label="Amount" property="column.data.lrgOrderingAmount"/>
                            </template>
                        </crl:fieldset>
                        <crl:fieldset label="Centred" size="6">
                            <crl:radiogroup property="column.data.lrgCentered"
                                            controlName="lrgCentered">
                                <crl:radiobutton value="default">Default</crl:radiobutton>
                                <crl:radiobutton value="centered">Centred</crl:radiobutton>
                                <crl:radiobutton value="uncentered">Uncentred</crl:radiobutton>
                            </crl:radiogroup>
                        </crl:fieldset>
                    </template>
                </crl:fieldset>
                <crl:fieldset label="Medium Screens">
                    <crl:checkbox label="Use Medium Configuration" property="column.data.medOn"/>
                    <template v-if="column.data.medOn">
                        <crl:numberfield label="Width" property="column.data.medWidth"/>
                        <crl:numberfield label="Offset" property="column.data.medOffset"/>
                        <crl:fieldset label="Source Ordering" size="6">
                            <crl:radiogroup property="column.data.medOrdering"
                                            controlName="medOrdering">
                                <crl:radiobutton value="none">None</crl:radiobutton>
                                <crl:radiobutton value="push">Push</crl:radiobutton>
                                <crl:radiobutton value="pull">Pull</crl:radiobutton>
                            </crl:radiogroup>
                            <template v-if="column.data.medOrdering != 'none'">
                                <crl:numberfield label="Amount" property="column.data.medOrderingAmount"/>
                            </template>
                        </crl:fieldset>
                        <crl:fieldset label="Centred" size="6">
                            <crl:radiogroup property="column.data.medCentered"
                                            controlName="medCentered">
                                <crl:radiobutton value="default">Default</crl:radiobutton>
                                <crl:radiobutton value="centered">Centred</crl:radiobutton>
                                <crl:radiobutton value="uncentered">Uncentred</crl:radiobutton>
                            </crl:radiogroup>
                        </crl:fieldset>
                    </template>
                </crl:fieldset>
                <crl:fieldset label="Small Screens">
                    <crl:checkbox label="Use Small Configuration" property="column.data.smlOn"/>
                    <template v-if="column.data.smlOn">
                        <crl:numberfield label="Width" property="column.data.smlWidth"/>
                        <crl:numberfield label="Offset" property="column.data.smlOffset"/>
                        <crl:fieldset label="Source Ordering" size="6">
                            <crl:radiogroup property="column.data.smlOrdering"
                                            controlName="smlOrdering">
                                <crl:radiobutton value="none">None</crl:radiobutton>
                                <crl:radiobutton value="push">Push</crl:radiobutton>
                                <crl:radiobutton value="pull">Pull</crl:radiobutton>
                            </crl:radiogroup>
                            <template v-if="column.data.smlOrdering != 'none'">
                                <crl:numberfield label="Amount" property="column.data.smlOrderingAmount"/>
                            </template>
                        </crl:fieldset>
                        <crl:fieldset label="Centred" size="6">
                            <crl:radiogroup property="column.data.smlCentered"
                                            controlName="smlCentered">
                                <crl:radiobutton value="default">Default</crl:radiobutton>
                                <crl:radiobutton value="centered">Centred</crl:radiobutton>
                                <crl:radiobutton value="uncentered">Uncentred</crl:radiobutton>
                            </crl:radiogroup>
                        </crl:fieldset>
                    </template>
                    <crl:checkbox label="End row" property="column.data.end"/>
                </crl:fieldset>
                <button type="buton" class="coral-Button coral-Button--secondary coral-Button--square coral-pullRight"
                        title="Delete column">
                    <i class="coral-Icon coral-Icon--sizeS coral-Icon--delete"></i>
                </button>
            </crl:indextabs>

            <crl:well label="Gutters">
                <crl:fieldset label="Large" size="6">
                    <crl:radiogroup property="raw.lrgCollapse" controlName="lCollapse">
                        <crl:radiobutton value="default">Default</crl:radiobutton>
                        <crl:radiobutton value="collapse">Collapse</crl:radiobutton>
                        <crl:radiobutton value="uncollapse">Uncollapse</crl:radiobutton>
                    </crl:radiogroup>
                </crl:fieldset>

                <crl:fieldset label="Medium" size="6">
                    <crl:radiogroup property="raw.medCollapse" controlName="mCollapse">
                        <crl:radiobutton value="default">Default</crl:radiobutton>
                        <crl:radiobutton value="collapse">Collapse</crl:radiobutton>
                        <crl:radiobutton value="uncollapse">Uncollapse</crl:radiobutton>
                    </crl:radiogroup>
                </crl:fieldset>

                <crl:fieldset label="Small" size="6">
                    <crl:radiogroup property="raw.smlCollapse" controlName="sCollapse">
                        <crl:radiobutton value="default">Default</crl:radiobutton>
                        <crl:radiobutton value="collapse">Collapse</crl:radiobutton>
                        <crl:radiobutton value="uncollapse">Uncollapse</crl:radiobutton>
                    </crl:radiogroup>
                </crl:fieldset>
            </crl:well>

            <%--
                <crl:well label="JSON">
                    {{ JSON.stringify(raw) }}
                </crl:well>
                --%>

        </div>
    </div>
</crl:dialogform>
</body>
</html>

