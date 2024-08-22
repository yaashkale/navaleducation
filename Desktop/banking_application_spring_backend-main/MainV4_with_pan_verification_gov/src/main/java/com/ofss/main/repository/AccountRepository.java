package com.ofss.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ofss.main.domain.Account;

@Repository
public interface AccountRepository extends CrudRepository<Account, Integer> {

    // Follow Spring Data JPA naming conventions
    List<Account> findAccountsByCustomer_CustomerId(int customerId);

    // Option 1: Using @Query for calling the stored procedure
    @Query(value = "CALL account_creation(:p_account_id, :p_account_type, :p_overdraft_availed)", nativeQuery = true)
    void callAccountCreationProcedure(
            @Param("p_account_id") int accountId,
            @Param("p_account_type") String accountType,
            @Param("p_overdraft_availed") boolean overdraftAvailed
    );

   
}
