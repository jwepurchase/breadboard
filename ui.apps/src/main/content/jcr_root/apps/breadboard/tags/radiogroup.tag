<%@ tag body-content="scriptless" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="controlName" required="true" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="property" required="true" rtexprvalue="true" type="java.lang.String"%>
<div class="coral-RadioGroup">
    <c:set var="_radiogroup_controlName" value="${controlName}" scope="request" />
    <c:set var="_radiogroup_property" value="${property}" scope="request" />
    <jsp:doBody />
</div>
