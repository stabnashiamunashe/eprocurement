package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;

@Getter
@Setter
@Entity
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Tender {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String description;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate releaseDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate closingDate;

    @Enumerated(EnumType.STRING)
    private TenderStatus status;

    @ManyToOne
    @JoinColumn(name = "procurement_department_id")
    private ProcurementDepartment procurementDepartment;

    @ToString.Exclude
    @OneToMany(mappedBy = "tender", cascade = CascadeType.ALL)
    private List<Bid> bids;

    private String tenderReferenceNumber;

    @Enumerated(EnumType.STRING)
    private LotType lotType;

    @Enumerated(EnumType.STRING)
    private ProcurementMethod procurementMethod;

    @Enumerated(EnumType.STRING)
    private ClassOfProcurement classOfProcurement;

    @Enumerated(EnumType.STRING)
    private FundingSource fundingSource;

    private Location location;

    private String deliveryPeriod;

    private String projectName;
    private String projectDescription;

    private Integer bidValidityPeriod;

    @ElementCollection
    private List<LineItem> lineItems;

    @OneToMany(mappedBy = "tender", cascade = CascadeType.ALL)
    private List<Documents> tenderDocuments;
}
