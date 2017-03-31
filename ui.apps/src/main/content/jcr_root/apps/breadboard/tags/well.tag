<%@ tag body-content="scriptless" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>

<section class="u-columnMedium">
    <h3 class="coral-Heading coral-Heading--3">${label}</h3>
    <div class="coral-Well">
        <jsp:doBody/>
    </div>
</section>
