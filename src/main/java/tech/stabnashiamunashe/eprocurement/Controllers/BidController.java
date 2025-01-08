//package tech.stabnashiamunashe.eprocurement.Controllers;
//
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.multipart.MultipartFile;
//import tech.stabnashiamunashe.eprocurement.Models.Bid;
//import tech.stabnashiamunashe.eprocurement.Services.BidService;
//import tech.stabnashiamunashe.eprocurement.Services.TenderService;
//import tech.stabnashiamunashe.eprocurement.Services.VendorService;
//
//@Controller
//@RequiredArgsConstructor
//public class BidController {
//
//    private final BidService bidService;
//    private final TenderService tenderService;
//    private final VendorService vendorService;
//
//    @GetMapping("/bids/create")
//    public String createBidForm(Model model) {
//        model.addAttribute("bids", new Bid());
//        model.addAttribute("tenders", tenderService.getAllTenders());
//        model.addAttribute("vendors", vendorService.getAllVendors());
//        return "bid-form";
//    }
//
//    @PostMapping("/bids/save")
//    public String saveBid(@RequestParam("bidDocument") MultipartFile bidDocument,
//                          @RequestParam("tenderId") Long tenderId,
//                          @RequestParam("vendorId") Long vendorId,
//                          Bid bid) {
//        bidService.saveBid(bid, tenderId, vendorId, bidDocument);
//        return "redirect:/bids/create";
//    }
//}
