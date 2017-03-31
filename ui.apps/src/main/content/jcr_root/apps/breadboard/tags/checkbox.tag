<%@ tag body-content="empty" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="property" required="true" rtexprvalue="false" type="java.lang.String"%>

<div>
    <label class="coral-Checkbox">
        <input class="coral-Checkbox-input" type="checkbox" v-model="${property}">
        <span class="coral-Checkbox-checkmark"></span>
        <span class="coral-Checkbox-description">${label}</span>
    </label>
</div>
