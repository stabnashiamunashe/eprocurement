package tech.stabnashiamunashe.eprocurement.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tech.stabnashiamunashe.eprocurement.Models.Bid;

public interface BidRepository extends JpaRepository<Bid, Long> {
}