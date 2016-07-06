package io.swagger.client.model

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.client.model.Amount;
import io.swagger.client.model.HalLink;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@ApiModel(
        description = ""
)
class TransferRequestWithFeeBody {
    private Map<String, HalLink> links = new HashMap();
    private Amount amount = null;
    private Object metadata = null;
    private String locationHeader;
    List<Fee> fees = []

    public TransferRequestWithFeeBody() {
    }

    @ApiModelProperty("")
    @JsonProperty("_links")
    public Map<String, HalLink> getLinks() {
        return this.links;
    }

    public void setLinks(Map<String, HalLink> links) {
        this.links = links;
    }

    @ApiModelProperty("")
    @JsonProperty("amount")
    public Amount getAmount() {
        return this.amount;
    }

    public void setAmount(Amount amount) {
        this.amount = amount;
    }

    @ApiModelProperty("")
    @JsonProperty("metadata")
    public Object getMetadata() {
        return this.metadata;
    }

    public void setMetadata(Object metadata) {
        this.metadata = metadata;
    }

    @JsonProperty("Location")
    public String getLocationHeader() {
        return this.locationHeader;
    }

    public void setLocationHeader(ArrayList<String> locationHeader) {
        this.locationHeader = (String)locationHeader.get(0);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("class TransferRequestBody {\n");
        sb.append("  links: ").append(this.links).append("\n");
        sb.append("  amount: ").append(this.amount).append("\n");
        sb.append("  metadata: ").append(this.metadata).append("\n");
        this.fees.each {
            sb.append("  fees: ").append(it.amount).append("\n");
        }
        sb.append("}\n");
        return sb.toString();
    }
}
