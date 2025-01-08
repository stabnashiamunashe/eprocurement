package tech.stabnashiamunashe.eprocurement.Models;

import lombok.Getter;
import lombok.Setter;

@Getter
public enum LotType {
    SINGLE_LOT("Single Lot"),
    MULTIPLE_LOTS("Multiple Lots");

    private final String displayName;

    LotType(String displayName) {
        this.displayName = displayName;
    }
}
