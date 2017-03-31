package com.johnpurchase.aem.breadboard.core.models;

import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.models.annotations.Model;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

/**
 * Created by john on 3/30/17.
 */
@Model(adaptables = {Resource.class, ValueMap.class})
public class FoundationColumnModel {

    @Inject
    private Boolean lrgOn;

    @Inject
    private Long lrgWidth;

    @Inject
    private Long lrgOffset;

    @Inject
    private Boolean medOn;

    @Inject
    private Long medWidth;

    @Inject
    private Long medOffset;

    @Inject
    private Boolean smlOn;

    @Inject
    private Long smlWidth;

    @Inject
    private Long smlOffset;

    private String htmlClass;

    @PostConstruct
    private void init() {
        StringBuffer buffer = new StringBuffer("columns");

        if (lrgOn) {
            if (lrgWidth != null && lrgWidth > 0) buffer.append(" large-").append(lrgWidth);
            if (lrgOffset != null && lrgOffset > 0) buffer.append(" large-offset-").append(lrgOffset);
        }

        if (medOn) {
            if (medWidth != null && medWidth > 0) buffer.append(" medium-").append(medWidth);
            if (medOffset != null && medOffset > 0) buffer.append(" medium-offset-").append(medOffset);
        }

        if (smlOn) {
            if (smlWidth != null && smlWidth > 0) buffer.append(" small-").append(smlWidth);
            if (smlOffset != null && smlOffset > 0) buffer.append(" small-offset-").append(smlOffset);
        }

        htmlClass=buffer.toString();
    }

    public final String getHtmlClass() {
        return htmlClass;
    }
}
