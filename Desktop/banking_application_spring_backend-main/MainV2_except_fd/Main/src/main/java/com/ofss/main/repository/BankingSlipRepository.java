package com.ofss.main.repository;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ofss.main.domain.BankSlip;

@Repository
public interface BankingSlipRepository extends CrudRepository<BankSlip, Integer> {

    @Modifying
    @Query(value = "CALL slip_creation(:p_bank_slip_id, :p_account_id, :p_bank_slip_date, :p_bank_slip_status)", nativeQuery = true)
    void createBankSlip(
        @Param("p_bank_slip_id") int bankSlipId, 
        @Param("p_account_id") int accountId, 
        @Param("p_bank_slip_date") Timestamp bankSlipDate, 
        @Param("p_bank_slip_status") String bankSlipStatus
    );

    @Query(value = "SELECT * FROM bank_slip_details WHERE account_id = :accountId", nativeQuery = true)
    List<BankSlip> findByAccountId(int accountId);
    
//    @Modifying
//    @Query(value = "CALL add_cheque_to_slip(:p_cheque_id)",nativeQuery = true)
//	void addCheque( @Param("p_bank_slip_id") int BankSlipId,  @Param("p_cheque_id") int chequeId);
	

    @Modifying
    @Query(value = "CALL add_cheque_to_slip(:p_bank_slip_id, :p_cheque_id, :p_cheque_amount, :p_cheque_status, :p_receiver_account_id, :p_cheque_date)", nativeQuery = true)
    void addCheque(
        @Param("p_bank_slip_id") int bankSlipId,
        @Param("p_cheque_id") int chequeId,
        @Param("p_cheque_amount") int chequeAmount,
        @Param("p_cheque_status") String chequeStatus,
        @Param("p_receiver_account_id") int receiverAccountId,
        @Param("p_cheque_date") Timestamp chequeDate
    );
	

}



