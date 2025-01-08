package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class ProcurementDepartment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String headOfDepartment;

    @OneToMany(mappedBy = "procurementDepartment", cascade = CascadeType.ALL)
    private List<Tender> tenders;

    @OneToOne
    @JoinColumn(name = "department_id")
    private GovernmentMinistry ministry;

    @OneToMany(mappedBy = "procurementDepartment", cascade = CascadeType.ALL)
    private List<GovernmentProcurementOfficer> governmentProcurementOfficers;
}
