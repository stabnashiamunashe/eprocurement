package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import tech.stabnashiamunashe.eprocurement.Models.ProcurementDepartment;
import tech.stabnashiamunashe.eprocurement.Repositories.ProcurementDepartmentRepository;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProcurementDepartmentService {

    private final ProcurementDepartmentRepository repository;

    public ProcurementDepartment findById(Long id) {
        return repository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid Procurement Department Id:" + id));
    }

    public List<ProcurementDepartment> findAll() {
        return repository.findAll();
    }

    public ProcurementDepartment save(ProcurementDepartment procurementDepartment) {
        return repository.save(procurementDepartment);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    public ProcurementDepartment findBy(ProcurementDepartment procurementDepartment) {
        return repository.save(procurementDepartment);
    }

    public ProcurementDepartment getDepartmentFromEmail(String email) {
        return repository.findByGovernmentProcurementOfficers_Email(email);
    }
}