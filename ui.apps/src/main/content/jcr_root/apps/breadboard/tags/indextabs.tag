<%@ tag body-content="scriptless" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="items" required="true" rtexprvalue="false" type="java.lang.String"%>
<%@ attribute name="item" required="false" rtexprvalue="false" type="java.lang.String"%>
<%@ attribute name="activeFlag" required="false" rtexprvalue="false" type="java.lang.String"%>

<c:if test="${empty items}"><c:set var="items" value="items"/></c:if>
<c:if test="${empty item}"><c:set var="item" value="item"/></c:if>
<c:if test="${empty activeFlag}"><c:set var="activeFlag" value="active"/></c:if>

<div class="coral-TabPanel" data-init="tabs">
    <nav class="coral-TabPanel-navigation">
        <a data-toggle="tab"
           href="#"
           v-bind:class="{'coral-TabPanel-tab': true, 'is-active': ${item}.${activeFlag}}"
           v-for="(${item}, index) in ${items}"
           v-on:click="clickTab(index)">
            <span v-if="${item}.name != undefined">{{${item}.name}}</span>
            <span v-else>Tab {{index}}</span>
        </a>
    </nav>
    <div class="coral-TabPanel-content">
        <section v-bind:id="${item} + '-tab-' + String(index)"
                 v-bind:class="{'coral-TabPanel-pane': true, 'is-active': ${item}.${activeFlag}}"
                 v-for="(${item}, index) in ${items}"
                 role="tabpanel">
            <jsp:doBody/>
        </section>
    </div>
</div>