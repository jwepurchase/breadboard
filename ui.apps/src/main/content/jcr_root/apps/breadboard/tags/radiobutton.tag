<%@ tag body-content="scriptless" %>
<%@ attribute name="value" required="true" rtexprvalue="false" type="java.lang.String"%>

<label class="coral-Radio">
    <input type="radio" name="${_radiogroup_controlName}" class="coral-Radio-input" v-model="${_radiogroup_property}" value="${value}">
    <span class="coral-Radio-checkmark"></span>
    <span class="coral-Radio-description"><jsp:doBody/></span>
</label>
