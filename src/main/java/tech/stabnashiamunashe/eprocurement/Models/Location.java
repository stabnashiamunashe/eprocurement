package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter
@Setter
public class Location {
    private String longitude;
    private String latitude;
}
