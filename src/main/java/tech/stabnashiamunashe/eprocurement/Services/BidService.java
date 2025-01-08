package tech.stabnashiamunashe.eprocurement.Services;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import tech.stabnashiamunashe.eprocurement.Repositories.BidRepository;

@Service
@RequiredArgsConstructor
public class BidService {

    private final BidRepository bidRepository;
}
