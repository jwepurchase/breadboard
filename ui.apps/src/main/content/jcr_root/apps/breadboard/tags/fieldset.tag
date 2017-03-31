<%@ tag body-content="scriptless" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>

<section class="coral-Form-fieldset">
    <h4 class="coral-Form-fieldset-legend">${label}</h4>
    <jsp:doBody/>
</section>

