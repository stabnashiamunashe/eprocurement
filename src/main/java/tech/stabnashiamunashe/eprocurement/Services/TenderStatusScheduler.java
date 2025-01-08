package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.scheduling.annotation.Scheduled;
import tech.stabnashiamunashe.eprocurement.Models.Tender;
import tech.stabnashiamunashe.eprocurement.Models.TenderStatus;

import java.time.LocalDate;
import java.util.List;

@RequiredArgsConstructor
public class TenderStatusScheduler {
    private final TenderService tenderService;

    // Runs every day at midnight
    @Scheduled(cron = "0 0 0 * * ?")
    public void closeExpiredTenders() {
        List<Tender> tenders = tenderService.findAll();
        LocalDate today = LocalDate.now();
        for (Tender tender : tenders) {
            if (tender.getStatus().equals(TenderStatus.OPEN) && tender.getClosingDate().isBefore(today)) {
                tender.setStatus(TenderStatus.CLOSED);
                tenderService.register(tender);
            }
        }
    }
}
