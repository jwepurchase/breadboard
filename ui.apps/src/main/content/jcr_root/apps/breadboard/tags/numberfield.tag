<%@ tag body-content="empty" %>
<%@ attribute name="label" required="true" rtexprvalue="true" type="java.lang.String"%>
<%@ attribute name="dataRef" required="true" rtexprvalue="false" type="java.lang.String"%>

<label class="coral-Form-fieldlabel">${label}</label>
<div class="coral-InputGroup" >
                                <span class="coral-InputGroup-button">
                                   <button type="button"
                                           v-on:click="${dataRef}--"
                                           class="coral-Button coral-Button--secondary coral-Button--square"
                                           title="Decrement">
                                       <i class="coral-Icon coral-Icon--sizeS coral-Icon--minus"></i>
                                   </button>
                                </span>
    <input v-model.number="${dataRef}"
           class="coral-InputGroup-input coral-Textfield"
           type="number" placeholder="number"/>
    <span class="coral-InputGroup-button">
                                   <button type="button"
                                           v-on:click="${dataRef}++"
                                           class="coral-Button coral-Button--secondary coral-Button--square"
                                           title="Increment">
                                       <i class="coral-Icon coral-Icon--sizeS coral-Icon--add"></i>
                                   </button>
                                </span>
</div>


