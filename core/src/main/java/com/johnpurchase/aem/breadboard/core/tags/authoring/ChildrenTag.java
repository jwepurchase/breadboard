package com.johnpurchase.aem.breadboard.core.tags.authoring;

import com.johnpurchase.aem.breadboard.core.tags.SlingTag;
import org.apache.sling.api.resource.Resource;
import tldgen.BodyContentType;
import tldgen.Tag;
import tldgen.TagAttribute;

import javax.servlet.jsp.JspException;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created by john on 3/28/17.
 */
@Tag(bodyContentType = BodyContentType.SCRIPTLESS)
public class ChildrenTag extends SlingTag{

    private Resource resource;
    private String var = "child";
    private String varStatus = "status";

    @Override
    public void doTag() throws JspException, IOException {

        LoopStatus loopStatus = new LoopStatus();
        Iterator<Resource> iter = resource.listChildren();
        while(iter.hasNext()) {
            Resource child = iter.next();
            getPageContext().setAttribute(var, child);

            if(! iter.hasNext()) {
                loopStatus.last = true;
            }

            getPageContext().setAttribute(varStatus, loopStatus);
            getJspBody().invoke(getJspContext().getOut());
            loopStatus.first = false;
            loopStatus.index++;

        }

    }

    @TagAttribute(required = true, runtimeValueAllowed = true)
    public final void setResource(Resource resource) {
        this.resource = resource;
    }

    @TagAttribute(required = false)
    public final void setVar(String var) {
        this.var = var;
    }

    @TagAttribute(required = false)
    public final void setVarStatus(String varStatus) {
        this.varStatus = varStatus;
    }

    public final class LoopStatus {
        private boolean first = true;
        private boolean last = false;
        private int index = 0;

        public final boolean isFirst() { return first;}
        public final boolean isLast() { return last;}
        public final int getIndex() { return index;}
        public final int getCount() { return index + 1;}
    }
}
