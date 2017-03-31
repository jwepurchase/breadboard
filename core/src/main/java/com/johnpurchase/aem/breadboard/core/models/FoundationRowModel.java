package com.johnpurchase.aem.breadboard.core.models;

import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.models.annotations.Model;

import javax.inject.Inject;

/**
 * Created by john on 3/31/17.
 */
@Model(adaptables = Resource.class)
public class FoundationRowModel {

    public static final String DEFAULT_COLLAPSE = "default";
    @Inject
    private String lrgCollapse;

    @Inject
    private String medCollapse;

    @Inject
    private String smlCollapse;

    public final String getHtmlClass() {
        StringBuffer buffer = new StringBuffer("row");

        if (isNotDefault(lrgCollapse)){
            buffer.append(" large-").append(lrgCollapse);
        }

        if (isNotDefault(medCollapse)){
            buffer.append(" medium-").append(medCollapse);
        }

        if (isNotDefault(smlCollapse)){
            buffer.append(" small-").append(smlCollapse);
        }

        return buffer.toString();
    }

    private boolean isNotDefault(String test) {
        return StringUtils.isNotEmpty(test) && !DEFAULT_COLLAPSE.equals(test);
    }

}
