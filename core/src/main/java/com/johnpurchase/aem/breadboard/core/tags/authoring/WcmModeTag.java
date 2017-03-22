package com.johnpurchase.aem.breadboard.core.tags.authoring;

import com.day.cq.wcm.api.WCMMode;
import com.johnpurchase.aem.breadboard.core.tags.SlingTag;
import tldgen.BodyContentType;
import tldgen.Tag;
import tldgen.TagAttribute;

import javax.servlet.jsp.JspException;
import java.io.IOException;

/**
 * Created by john on 3/21/17.
 */
@Tag(bodyContentType = BodyContentType.SCRIPTLESS)
public class WcmModeTag extends SlingTag {

    private String modes;

    @Override
    public void doTag() throws JspException, IOException {

        WCMMode mode = WCMMode.fromRequest(getRequest());

        String[] modeList = modes.split(",");

        for(String aMode : modeList) {
            if (aMode.trim().toLowerCase().equals(mode.name().toLowerCase())){
                getJspBody().invoke(getPageContext().getOut());
                break;
            }

        }


    }

    @TagAttribute(required = true, description = "comma-separated, case-insensitive list of modes to show")
    public final void setModes(String modes) {
        this.modes = modes;
    }
}
