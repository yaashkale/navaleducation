package com.ofss.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ofss.main.domain.Cheque;

@Repository
public interface ChequeRepository extends CrudRepository<Cheque, Integer> {

    @Query(value = "SELECT * FROM cheque_details WHERE sender_account_id = :accountId", nativeQuery = true)
    List<Cheque> findBySenderAccountId(@Param("accountId") int accountId);

    @Query(value = "SELECT * FROM cheque_details WHERE receiver_account_id = :accountId", nativeQuery = true)
    List<Cheque> findByReceiverAccountId(@Param("accountId") int accountId);

    @Modifying
    @Query(value = "CALL issue_checks_by_account_id(:p_account_id)", nativeQuery = true)
    void generateCheques(@Param("p_account_id") int accountId);
}
