<%@ tag body-content="scriptless" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="size" required="false" rtexprvalue="false" type="java.lang.Long"%>

<section class="coral-Form-fieldset">
    <c:choose>
        <c:when test="${size eq 1}">
            <h1 class="coral-Form-fieldset-legend coral-Heading coral-Heading--1">${label}</h1>
        </c:when>
        <c:when test="${size eq 2}">
            <h2 class="coral-Form-fieldset-legend coral-Heading coral-Heading--2">${label}</h2>
        </c:when>
        <c:when test="${size eq 3}">
            <h3 class="coral-Form-fieldset-legend coral-Heading coral-Heading--3">${label}</h3>
        </c:when>
        <c:when test="${size eq 5}">
            <h5 class="coral-Form-fieldset-legend coral-Heading coral-Heading--5">${label}</h5>
        </c:when>
        <c:when test="${size eq 6}">
            <h6 class="coral-Form-fieldset-legend coral-Heading coral-Heading--6">${label}</h6>
        </c:when>
        <c:otherwise>
            <h4 class="coral-Form-fieldset-legend coral-Heading coral-Heading--4">${label}</h4>
        </c:otherwise>
    </c:choose>
    <jsp:doBody/>
</section>

