package tech.stabnashiamunashe.eprocurement.Models;

import jakarta.persistence.*;
import lombok.Data;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.List;

@Data
public class TenderRequest {
    String title;
    String description;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate releaseDate;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    LocalDate closingDate;

    private TenderStatus status;
    private String tenderReferenceNumber;

    private LotType lotType;

    private ProcurementMethod procurementMethod;

    private ClassOfProcurement classOfProcurement;

    private FundingSource fundingSource;

    private Location location;

    private String deliveryPeriod;

    private String projectName;
    private String projectDescription;

    private Integer bidValidityPeriod;

    private List<LineItem> lineItems;
    private List<MultipartFile> documents;
}