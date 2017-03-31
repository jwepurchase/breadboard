<%@ tag body-content="scriptless" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>

<section class="u-columnMedium">
    <h4 class="coral-Heading coral-Heading--4">${label}</h4>
    <div class="coral-Well">
        <jsp:doBody/>
    </div>
</section>
