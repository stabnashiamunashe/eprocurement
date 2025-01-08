package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import tech.stabnashiamunashe.eprocurement.Models.Vendor;
import tech.stabnashiamunashe.eprocurement.Repositories.VendorRepository;

@Service
@RequiredArgsConstructor
public class VendorService {

    private final VendorRepository vendorRepository;

    public Vendor registerVendor(Vendor vendor) {
        if (vendorRepository.existsByCompanyRegistrationNumber(vendor.getCompanyRegistrationNumber())) {
            throw new IllegalArgumentException("Vendor with registration number " + vendor.getCompanyRegistrationNumber() + " already exists");
        }
        return vendorRepository.save(vendor);
    }

    public Vendor findByCompanyRegistrationNumber(String companyRegistrationNumber) {
        return vendorRepository.findByCompanyRegistrationNumber(companyRegistrationNumber);
    }

    public Vendor findById(Long id) {
        return vendorRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Vendor Id:" + id));
    }

    public Vendor updateVendor(Vendor vendor) {
        return vendorRepository.save(vendor);
    }

    public void deleteById(Long id) {
        vendorRepository.deleteById(id);
    }

}
