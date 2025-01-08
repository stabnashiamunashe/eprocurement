package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import tech.stabnashiamunashe.eprocurement.Security.Models.Users;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
public class Vendor extends Users {

    private String companyName;
    private String companyRegistrationNumber;
    private String companyAddress;
    private String taxClearanceCertificateHash;
    private String certificateOfIncorporationHash;
    private String vendorNumber;

}
