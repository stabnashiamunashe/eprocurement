package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Documents {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String type;
    private String description;
    private String url;

    @ManyToOne
    @JoinColumn(name = "tender_id")
    private Tender tender;
}
