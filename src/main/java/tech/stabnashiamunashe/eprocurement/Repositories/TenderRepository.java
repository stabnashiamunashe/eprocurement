package tech.stabnashiamunashe.eprocurement.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tech.stabnashiamunashe.eprocurement.Models.Tender;

import java.util.List;

public interface TenderRepository extends JpaRepository<Tender, Long> {
    List<Tender> findByProcurementDepartment_Id(Long id);
}