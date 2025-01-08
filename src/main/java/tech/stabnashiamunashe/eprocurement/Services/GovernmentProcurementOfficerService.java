package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import tech.stabnashiamunashe.eprocurement.Repositories.GovernmentProcurementOfficerRepository;

@Service
@RequiredArgsConstructor
public class GovernmentProcurementOfficerService {

    private final GovernmentProcurementOfficerRepository governmentProcurementOfficerRepository;
}
