package tech.stabnashiamunashe.eprocurement.Models;

import lombok.Getter;

@Getter
public enum TenderStatus {

    OPEN("Open"),
    CLOSED("Closed"),
    AWARDED("Awarded"),
    DRAFT("Draft"),
    CANCELLED("Cancelled");

    private final String status;

    TenderStatus(String status) {
        this.status = status;
    }

}
