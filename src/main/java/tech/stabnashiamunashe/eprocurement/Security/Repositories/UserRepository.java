package tech.stabnashiamunashe.eprocurement.Security.Repositories;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import tech.stabnashiamunashe.eprocurement.Security.Models.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<Users, Long> {

    @Transactional(propagation = Propagation.REQUIRES_NEW)
    Optional<Users> findByEmail(String email);

    boolean existsByEmail(String email);

}


