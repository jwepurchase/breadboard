<%@ tag body-content="scriptless" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>

<section class="coral-Form-fieldset">
    <h3 class="coral-Form-fieldset-legend">${label}</h3>
    <jsp:doBody/>
</section>

