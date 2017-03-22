package com.johnpurchase.aem.breadboard.core.tags.authoring;

import com.day.cq.wcm.api.Page;
import org.apache.sling.api.adapter.Adaptable;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ValueMap;
import tldgen.Function;

/**
 * Created by john on 3/21/17.
 */
public class Functions {

    @Function
    public static final String getLanguage(Page page) {
        String result = "en";
        if (page != null) {
            result = page.getLanguage(false).getLanguage();
        }
        return result;
    }

    @Function
    public static final ValueMap toValueMap(final Adaptable adaptable) {
        return adaptable.adaptTo(ValueMap.class);
    }

    @Function
    public static final Resource toResource(final Adaptable adaptable) {
        return adaptable.adaptTo(Resource.class);
    }

    @Function
    public static final Page toPage(final Adaptable adaptable) {
        return adaptable.adaptTo(Page.class);
    }

    @Function
    public static final Resource resourceAtPath(final String path, final ResourceResolver resolver) {
        return resolver.getResource(path);
    }
}
