package io.swagger.client.model

import com.fasterxml.jackson.annotation.JsonProperty;
import io.swagger.annotations.ApiModelProperty;

class Fee {
    private Map<String, HalLink> links = new HashMap();
    private Amount amount = null;

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

}
