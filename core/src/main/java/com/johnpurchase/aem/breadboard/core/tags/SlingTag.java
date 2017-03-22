package com.johnpurchase.aem.breadboard.core.tags;

import com.adobe.granite.xss.XSSAPI;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.scripting.SlingBindings;
import org.apache.sling.api.scripting.SlingScriptHelper;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * Created by john on 3/20/17.
 */
public abstract class SlingTag extends SimpleTagSupport {

    public abstract void doTag() throws JspException, IOException;

    protected final PageContext getPageContext() {
        return (PageContext)getJspContext();
    }

    protected final SlingHttpServletRequest getRequest() {
        return (SlingHttpServletRequest)getPageContext().getRequest();
    }

    protected final String getRequestSuffix() {
        return getRequest().getRequestPathInfo().getSuffix();
    }

    protected final SlingScriptHelper getScriptHelper() {
        SlingBindings bindings = (SlingBindings) getRequest().getAttribute(SlingBindings.class.getName());
        return bindings.getSling();
    }

    protected final XSSAPI getXssApi() {
        return getScriptHelper().getService(XSSAPI.class);
    }
}
