<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cq" uri="http://www.day.com/taglibs/cq/1.0" %>
<%@taglib prefix="sling" uri="http://sling.apache.org/taglibs/sling" %>
<%@ taglib prefix="auth" uri="http://www.johnpurchase.com/breadboard/tags/authoring" %>

<cq:defineObjects/>

<auth:wcmMode modes="edit">
    <div  class="cq-placeholder" data-emptytext="Foundation Row"> </div>
</auth:wcmMode>

<div class="row">
    <auth:children resource="${resource}" var="col" adaptTo="com.johnpurchase.aem.breadboard.core.models.FoundationColumnModel">
        <div class="${col.htmlClass}">
            <cq:include path="${col.path}/par" resourceType="foundation/components/parsys"/>
        </div>
    </auth:children>
</div>

