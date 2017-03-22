<%@ page session="false" %>
<%@ taglib prefix="auth" uri="http://www.johnpurchase.com/breadboard/tags/authoring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@taglib prefix="ui" uri="http://www.adobe.com/taglibs/granite/ui/1.0" %>

<cq:defineObjects/>

<ui:includeClientLib categories="breadboard.row.editor"/>

<div id="foundation_row_editor_fields"></div>
<script type="text/javascript">
    $(document).ready(function(){
        window._rowComponentEditor = new RowEditor('${slingRequest.requestPathInfo.suffix}', '${resource.path}');
    });
</script>
<%--
<cq:defineObjects/>

<c:set var="contentResource" value="${auth:resourceAtPath(slingRequest.requestPathInfo.suffix, resourceResolver)}"/>
<c:set var="contentProps" value="${auth:toValueMap(contentResource)}"/>

<div class='coral-FixedColumn-column'>
    <div class='coral-Form-fieldwrapper'><label class="coral-Form-fieldlabel">Number Of Columns</label>
        <div class='coral-Form-field field-slidesToShow coral-InputGroup' data-init='numberinput' data-default-value='1'>
            <span class="coral-InputGroup-button">
                <button class="js-coral-NumberInput-decrementButton coral-Button coral-Button--square" type="button"
                        title="Decrement">
                    <i class="coral-Icon coral-Icon--sizeXS coral-Icon--minus"></i>
                </button>
            </span>

            <input type='text' name='./numberOfColumns' value='${contentProps.numberOfColumns}'
                   class='js-coral-NumberInput-input coral-InputGroup-input coral-Textfield'/>

            <span class="coral-InputGroup-button">
                <button class="js-coral-NumberInput-incrementButton coral-Button coral-Button--square" type="button"
                        title="Increment">
                    <i class="coral-Icon coral-Icon--sizeXS coral-Icon--add"></i>
                </button>
            </span>
        </div>
    </div>
</div>

<div class="coral-TabPanel" data-init="tabs">
    <nav class="coral-TabPanel-navigation">
        <a class="coral-TabPanel-tab is-active" data-toggle="tab">Column 1</a>
        <a class="coral-TabPanel-tab" data-toggle="tab">Column 2</a>
    </nav>
    <div class="coral-TabPanel-content">
        <section class="coral-TabPanel-pane is-active">Column 1 controls</section>
        <section class="coral-TabPanel-pane">Column 2 controls</section>
    </div>
</div>
--%>
