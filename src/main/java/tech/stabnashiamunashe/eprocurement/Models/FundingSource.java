package tech.stabnashiamunashe.eprocurement.Models;

import lombok.Getter;

@Getter
public enum FundingSource {
    INTERNALLY_GENERATED_FUNDS("Internally Generated Funds"),
    GOVERNMENT_FUNDS("Government Funds"),
    DONOR_FUNDS("Donor Funds"),
    PUBLIC_PRIVATE_PARTNERSHIP("Public-Private Partnership");

    private final String displayName;
    
    FundingSource(String displayName) {
        this.displayName = displayName;
    }
}
