package tech.stabnashiamunashe.eprocurement.Controllers;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tech.stabnashiamunashe.eprocurement.Models.Tender;
import tech.stabnashiamunashe.eprocurement.Models.TenderRequest;
import tech.stabnashiamunashe.eprocurement.Models.TenderStatus;
import tech.stabnashiamunashe.eprocurement.Services.ProcurementDepartmentService;
import tech.stabnashiamunashe.eprocurement.Services.TenderService;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/tenders")
@RequiredArgsConstructor
public class TenderController {


    private final TenderService tenderService;

    private final ProcurementDepartmentService procurementDepartmentService;

    // List all tenders
    @GetMapping
    public String listTenders(Model model) {
        model.addAttribute("tenders", tenderService.findAll());
        return "pages/government/tenders";
    }

    @GetMapping("/create")
    public String createTenderForm(Model model, Authentication authentication, HttpServletRequest request) {
        model.addAttribute("tender", new Tender());

        CsrfToken csrf = (CsrfToken) request.getAttribute(CsrfToken.class.getName());
        if (csrf != null) {
            System.out.println(csrf.getToken());
            model.addAttribute("csrf", csrf);
        }

        model.addAttribute("email", authentication.getName());

        return "pages/government/create-tender";
    }

    @PostMapping("/save")
    public String saveTender(
            @Valid @ModelAttribute TenderRequest tenderRequest,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes,
            Authentication authentication) {

        // use the builder to build the tender object

        Tender tender = Tender.builder()
                .title(tenderRequest.getTitle())
                .description(tenderRequest.getDescription())
                .releaseDate(tenderRequest.getReleaseDate())
                .closingDate(tenderRequest.getClosingDate())
                .status(tenderRequest.getStatus())
                .tenderReferenceNumber(tenderRequest.getTenderReferenceNumber())
                .lotType(tenderRequest.getLotType())
                .procurementMethod(tenderRequest.getProcurementMethod())
                .classOfProcurement(tenderRequest.getClassOfProcurement())
                .fundingSource(tenderRequest.getFundingSource())
                .location(tenderRequest.getLocation())
                .deliveryPeriod(tenderRequest.getDeliveryPeriod())
                .projectName(tenderRequest.getProjectName())
                .projectDescription(tenderRequest.getProjectDescription())
                .bidValidityPeriod(tenderRequest.getBidValidityPeriod())
                .build();

        if (tenderRequest.getDocuments() != null) {

            // Handle documents
            for (MultipartFile document : tenderRequest.getDocuments()) {
                System.out.println("Document: " + document.getOriginalFilename());
            }
        }

        if (bindingResult.hasErrors()) {
            // Add error messages to redirect attributes for feedback
            redirectAttributes.addFlashAttribute("error", "There were errors in the form submission.");
            redirectAttributes.addFlashAttribute("message", bindingResult.getAllErrors());
            return "redirect:/tenders/create";
        }

        try {
//            tender.setStatus(TenderStatus.DRAFT); // Set a default status

           // tender.setProcurementDepartment(procurementDepartmentService.getDepartmentFromEmail(authentication.getName()));

            System.out.println("Tender: " + tender);
            tenderService.register(tender);

            redirectAttributes.addFlashAttribute("message", "Tender saved successfully.");
            return "redirect:/tenders/create";
        } catch (Exception ex) {
            redirectAttributes.addFlashAttribute("error", "Failed to save the tender. Please try again.");
            return "redirect:/tenders/create";
        }
    }

    @GetMapping("/1")
    public String tenderPage(Authentication authentication, Model model) {

        // Get the currently authenticated user;
//        System.out.println("User: " + authentication.getName());
        model.addAttribute("tender", new Tender());
        return "pages/government/tender-page";
    }

    @GetMapping("/2")


    @PostMapping("/save")
    public String saveTender(@ModelAttribute Tender tender,BindingResult result, Model model) {

        System.out.println("Tender: " + tender );
        if (tender == null) {
            model.addAttribute("error", true);
            model.addAttribute("message", "An error occurred while creating the tender. Please try again.");

            return "pages/government/create-tender";
        }

        tender.setReleaseDate(LocalDate.now());
        tender.setStatus(TenderStatus.OPEN);
        Tender savedTender = tenderService.register(tender);

        model.addAttribute("message", "Tender created successfully.");
        model.addAttribute("tender", savedTender);
        return "pages/government/tender-page";
    }

    @GetMapping("/vendor")
    public String tenders(Model model) {
        model.addAttribute("tenders", tenderService.findAll());
        return "pages/tenders";
    }

    @GetMapping("/items")
    public String getTenders(Model model,
                            @RequestParam(defaultValue = "1") int page,
                             @RequestParam(defaultValue = "10") int size) {

        Pageable pageable = PageRequest.of(page, size);

        Page<Tender> tenderPage = tenderService.findAllPaged(pageable);

        // Add data to the model
        model.addAttribute("tenders", tenderPage.getContent());
        model.addAttribute("totalPages", tenderPage.getTotalPages());
        model.addAttribute("currentPage", page);


        return "pages/tenders";
    }


    //tenders page for vendors
    @GetMapping("/pages/vendor")
    public String vendorTenders(Model model) {
        model.addAttribute("tenders", tenderService.findAll());
        return "pages/tenders";
    }

    @GetMapping("/cards")
    public String vendorTendersX(Model model) {
        System.out.println("Tenders");
        model.addAttribute("tenders", tenderService.findAll());
        return "pages/vendors/cards";
    }

    // View tender details
    @GetMapping("/{id}")
    public String viewTender(@PathVariable Long id, Model model) {
        Tender tender = tenderService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid tender Id:" + id));
        model.addAttribute("tender", tender);
        return "tenders/view";
    }

    // Show form to edit a tender
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Tender tender = tenderService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid tender Id:" + id));
        model.addAttribute("tender", tender);
        model.addAttribute("procurementDepartments", procurementDepartmentService.findAll());
        return "tenders/edit";
    }

    // Handle tender update
    @PostMapping("/edit/{id}")
    public String updateTender(@PathVariable Long id, @ModelAttribute Tender tender, BindingResult result, Model model) {
        if (result.hasErrors()) {
            tender.setId(id);
            model.addAttribute("procurementDepartments", procurementDepartmentService.findAll());
            return "tenders/edit";
        }

        Tender existingTender = tenderService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid tender Id:" + id));

        existingTender.setTitle(tender.getTitle());
        existingTender.setDescription(tender.getDescription());
        existingTender.setClosingDate(tender.getClosingDate());
        existingTender.setProcurementDepartment(tender.getProcurementDepartment());
        existingTender.setStatus(tender.getStatus());

        tenderService.register(existingTender);
        return "redirect:/tenders";
    }

    // Handle tender deletion
    @GetMapping("/delete/{id}")
    public String deleteTender(@PathVariable Long id, Model model) {
        tenderService.deleteById(id);
        return "redirect:/tenders";
    }
}
