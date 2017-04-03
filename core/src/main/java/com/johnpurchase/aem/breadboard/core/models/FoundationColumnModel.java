package com.johnpurchase.aem.breadboard.core.models;

import org.apache.commons.lang3.StringUtils;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.sling.models.annotations.Model;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

/**
 * Created by john on 3/30/17.
 */
@Model(adaptables = Resource.class)
public class FoundationColumnModel {

    private final Logger log = LoggerFactory.getLogger(getClass());
    private final Resource resource;

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

    @Inject
    private Boolean end;

    @Inject
    private String lrgCentered;

    @Inject
    private String medCentered;

    @Inject
    private String smlCentered;

    @Inject
    private String lrgOrdering;

    @Inject
    private Long lrgOrderingAmount;

    @Inject
    private String medOrdering;

    @Inject
    private Long medOrderingAmount;

    @Inject
    private String smlOrdering;

    @Inject
    private Long smlOrderingAmount;

    private String htmlClass;

    public FoundationColumnModel(Resource resource) {
        this.resource = resource;
    }

    @PostConstruct
    private void init() {
        StringBuffer buffer = new StringBuffer("columns");

        if (lrgOn) {
            if (lrgWidth != null && lrgWidth > 0) buffer.append(" large-").append(lrgWidth);
            if (lrgOffset != null && lrgOffset > 0) buffer.append(" large-offset-").append(lrgOffset);

            if (!StringUtils.equals(lrgOrdering, "none")){
                buffer.append( " large-").append(lrgOrdering).append("-").append(lrgOrderingAmount);
            }

            if(!StringUtils.equals(lrgCentered, "default")) {
                buffer.append( " large-").append(lrgCentered);
            }
        }

        if (medOn) {
            if (medWidth != null && medWidth > 0) buffer.append(" medium-").append(medWidth);
            if (medOffset != null && medOffset > 0) buffer.append(" medium-offset-").append(medOffset);

            if(!StringUtils.equals(medOrdering, "default")) {
                buffer.append( " medium-").append(medOrdering).append("-").append(medOrderingAmount);
            }

            if(!StringUtils.equals(medCentered, "default")) {
                buffer.append( " medium-").append(medCentered);
            }
        }

        if (smlOn) {
            if (smlWidth != null && smlWidth > 0) buffer.append(" small-").append(smlWidth);
            if (smlOffset != null && smlOffset > 0) buffer.append(" small-offset-").append(smlOffset);

            if (!StringUtils.equals(smlOrdering, "none")){
                buffer.append( " small-").append(smlOrdering).append("-").append(smlOrderingAmount);
            }

            if(!StringUtils.equals(smlCentered, "default")) {
                buffer.append( " small-").append(smlCentered);
            }
        }

        if (end) {
           buffer.append(" end");
        }

        htmlClass=buffer.toString();
    }

    public final String getHtmlClass() {
        return htmlClass;
    }

    public final String getPath() {
        return resource.getPath();
    }
}
