package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter
@Setter
public class LineItem {
    private Integer itemNo;
    private String unspsc;
    private String lotName;
    private String lotDescription;
    private Integer quantity;
    private String unitOfMeasure;
}
