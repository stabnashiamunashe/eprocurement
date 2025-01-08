package tech.stabnashiamunashe.eprocurement.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tech.stabnashiamunashe.eprocurement.Models.ProcurementDepartment;

public interface ProcurementDepartmentRepository extends JpaRepository<ProcurementDepartment, Long> {
    ProcurementDepartment findByGovernmentProcurementOfficers_Email(String email);
}