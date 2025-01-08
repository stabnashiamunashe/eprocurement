package tech.stabnashiamunashe.eprocurement.Models;

import lombok.Getter;

@Getter
public enum ClassOfProcurement {
    GOODS("Goods"),
    WORKS("Works"),
    CONSULTING_SERVICES("Consulting Services"),
    NON_CONSULTING_SERVICES("Non-Consulting Services");

    private final String displayName;

    ClassOfProcurement(String displayName) {
        this.displayName = displayName;
    }

}
