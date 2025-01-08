package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class GovernmentMinistry {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;

    @OneToOne(mappedBy = "ministry", cascade = CascadeType.ALL)
    private ProcurementDepartment procurementDepartment;

}