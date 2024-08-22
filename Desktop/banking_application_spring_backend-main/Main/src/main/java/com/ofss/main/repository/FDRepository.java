package com.ofss.main.repository;



import java.util.List;

import org.springframework.data.repository.CrudRepository;
import com.ofss.main.domain.FD;

public interface FDRepository extends CrudRepository<FD, Integer> {
	List<FD> findAllByAccountId(int accountId);
    // No additional methods needed; CrudRepository provides save, findById, etc.
}
