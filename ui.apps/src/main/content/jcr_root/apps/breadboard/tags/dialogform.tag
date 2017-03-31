<%@ tag body-content="scriptless" %>
<%@ attribute name="label" required="true" rtexprvalue="false" type="java.lang.String"%>
<%@ attribute name="componentPath" required="true" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="submitMethod" required="true" rtexprvalue="false" type="java.lang.String"%>
<form id="rowDlg"
      v-on:submit="${submitMethod}"
      data-component-path="${componentPath}"
      class="coral-Form coral-Text cq-dialog foundation-form content foundation-layout-form cq-dialog-floating coral-Form--aligned coral--dark">
    <nav class="cq-dialog-header u-coral-clearFix cq-dialog-dragging">
        <h2 class="coral-Heading coral-Heading--2 u-coral-pullLeft">${label}</h2>
        <div class="cq-dialog-actions u-coral-pullRight">
            <button type="button" class="coral-MinimalButton cq-dialog-header-action cq-dialog-cancel" title="Cancel">
                <i class="coral-Icon coral-Icon--close"></i>
            </button>
            <button class="coral-MinimalButton cq-dialog-header-action cq-dialog-submit" title="Done">
                <i class="coral-Icon coral-Icon--check"></i>
            </button>
        </div>
    </nav>
    <jsp:doBody/>
</form>
