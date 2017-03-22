package apps.breadboard.components.structure.rowComponent;

import com.adobe.cq.sightly.WCMUse;
import com.adobe.granite.ui.components.ds.ResourceDataSource;
import org.apache.sling.api.resource.ResourceResolver;

public class ColumnDataSource extends WCMUse {
    private ResourceDataSource data;

    @Override
    public void activate() throws Exception {
        data = new ResourceDataSource(getResource());
    }

    public final ResourceDataSource getData() {
        return data;
    }
}