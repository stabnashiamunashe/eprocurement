package tech.stabnashiamunashe.eprocurement.Models;

import lombok.Getter;

@Getter
public enum ProcurementMethod {
    COMPETITIVE_BIDDING("Competitive Bidding"),
    DIRECT_PROCUREMENT("Direct Procurement"),
    REQUEST_FOR_QUOTATION("Request for Quotation");

    private final String displayName;

    ProcurementMethod(String displayName) {
        this.displayName = displayName;
    }
}
