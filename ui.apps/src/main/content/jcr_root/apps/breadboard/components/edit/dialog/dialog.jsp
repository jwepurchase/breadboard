<%@ page session="false" %>
<%@ taglib prefix="auth" uri="http://www.johnpurchase.com/breadboard/tags/authoring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@taglib prefix="ui" uri="http://www.adobe.com/taglibs/granite/ui/1.0" %>

<cq:defineObjects/>

<c:set var="pathSuffix" value="${slingRequest.requestPathInfo.suffix}"/>
<c:set var="editedPagePath" value="${fn:substring(pathSuffix, 0, fn:indexOf(pathSuffix, '/jcr:content'))}"/>
<c:set var="editedPage" value="${auth:toPage(auth:resourceAtPath(editedPagePath, resourceResolver))}"/>

<html class="cq-dialog-page coral-App" lang="${auth:getLanguage(editedPage)}"
      data-i18n-dictionary-src="/libs/cq/i18n/dict.{+locale}.json">

<head>
    <meta charset="utf-8">
    <title>${properties['jcr:title']}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no"/>
    <meta name="X-UA-Compatible" content="chrome=1"/>
    <link rel="shortcut icon" href="${slingRequest.contextPath}/libs/granite/core/content/login/favicon.ico">

    <ui:includeClientLib
            categories="coralui2, granite.ui.foundation, granite.ui.foundation.admin, cq.authoring.dialog"/>
    <auth:wcmMode modes="edit">
        <ui:includeClientLib categories="granite.ui.authoring, cq.authoring.page"/>
    </auth:wcmMode>
</head>

<body class="coral--light">

<form id="testForm" action='${slingRequest.requestPathInfo.suffix}' method='post'
      class='coral-Form coral-Form--vertical coral-Text cq-dialog cq-dialog-fullscreen foundation-form content foundation-layout-form'
      data-cq-dialog-pageeditor='/editor.html${editedPagePath}.html' data-foundation-form-ajax='true'>

    <!-- debug -->
    <script type="text/javascript">

        function RowEditor(contentPath, dialogPath) {
            var self = this;
            self.contentPath = contentPath;
            self.dialogPath = dialogPath;
            self.model = {};

            var createFormFields = function() {
            }

            $.get(contentPath + '.infinity.json', function(data){
                self.model = data;
                console.log("creating form fields");
                var fields = $("#foundation_row_editor_fields");
                fields.append('<div id="myFirstAlert"></div>');
                new CUI.Alert({
                    element: '#myFirstAlert',
                    heading: 'HOORAY',
                    content: 'Three cheers for Coral',
                    closeable: true
                });
            });

        }
    </script>
    <!-- debug -->

    <input type="hidden" name="_charset_" value="utf-8"/>

    <input type="hidden" name="./sling:resourceType" value="${resource.parent.path}"/>

    <input type="hidden" name="./jcr:lastModified"/>
    <input type="hidden" name="./jcr:lastModifiedBy"/>
    <nav class="cq-dialog-header coral--dark u-coral-clearFix">
        <h2 class="coral-Heading coral-Heading--2 u-coral-pullLeft">${properties['jcr:title']}</h2>
        <div class="cq-dialog-actions u-coral-pullRight">
            <button type='button' class='coral-MinimalButton cq-dialog-header-action cq-dialog-help'
                    data-href='https://www.adobe.com/go/aem6_1_docs' title='Help'>
                <i class="coral-Icon coral-Icon--helpCircle"></i>
            </button>
            <button type="button" class="coral-MinimalButton cq-dialog-header-action cq-dialog-cancel" title="Cancel">
                <i class="coral-Icon coral-Icon--close"></i>
            </button>
            <button class="coral-MinimalButton cq-dialog-header-action cq-dialog-submit" title="Done">
                <i class="coral-Icon coral-Icon--check"></i>
            </button>
        </div>
    </nav>

    <cq:include script="fields.jsp"/>

</form>
</body>
</html>
