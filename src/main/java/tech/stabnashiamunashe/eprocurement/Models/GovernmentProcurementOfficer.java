package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import tech.stabnashiamunashe.eprocurement.Security.Models.Users;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class GovernmentProcurementOfficer extends Users {

    @ManyToOne
    @JoinColumn(name = "procurement_department_id")
    private ProcurementDepartment procurementDepartment;

    private String officerNumber;
}
