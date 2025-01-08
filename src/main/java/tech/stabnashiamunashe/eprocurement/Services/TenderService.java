package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tech.stabnashiamunashe.eprocurement.Models.Tender;
import tech.stabnashiamunashe.eprocurement.Repositories.TenderRepository;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TenderService {

    private final TenderRepository tenderRepository;

    public List<Tender> findAll() {
        return tenderRepository.findAll();
    }

    public Page<Tender> findAllPaged(Pageable pageable) {
        return tenderRepository.findAll(pageable);
    }

    public Optional<Tender> findById(Long id) {
        return tenderRepository.findById(id);
    }

    public Tender register(Tender tender) {
        return tenderRepository.save(tender);
    }

    public void deleteById(Long id) {
        tenderRepository.deleteById(id);
    }

    public List<Tender> findByProcurementDepartmentId(Long procurementDepartmentId) {
        return tenderRepository.findByProcurementDepartment_Id(procurementDepartmentId);
    }

}