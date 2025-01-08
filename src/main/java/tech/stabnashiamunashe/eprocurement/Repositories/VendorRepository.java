package tech.stabnashiamunashe.eprocurement.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tech.stabnashiamunashe.eprocurement.Models.Vendor;

public interface VendorRepository extends JpaRepository<Vendor, Long> {
    Vendor findByCompanyRegistrationNumber(String companyRegistrationNumber);

    boolean existsByCompanyRegistrationNumber(String companyRegistrationNumber);
}