package com.ofss.main.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.ofss.main.domain.Account;
import com.ofss.main.domain.Transaction;

public interface TransactionRepository extends CrudRepository<Transaction, Integer> {
    List<Transaction> findByPayerId(int customerId);
    List<Transaction> findByPayeeId(int customerId);
    
    @Modifying
	@Query(value = "CALL update_transact(:p_payee_id, :p_payer_id, :p_transaction_amount, :p_transaction_type, :p_overdraftbalance, :p_account_type, :p_withdrawal_limit)", nativeQuery = true)
	void calldepositProcedure(
	    @Param("p_payee_id") int payee_id, 
	    @Param("p_payer_id") int payer_id, 
	    @Param("p_transaction_amount") int transaction_amount, 
	    @Param("p_transaction_type") String transaction_type,
	    @Param("p_overdraftbalance") int overdraft_balance, 
	    @Param("p_account_type") String account_type, 
	    @Param("p_withdrawal_limit") int withdrawal_limit
	);
	
    @Modifying
	@Query(value = "CALL update_transact(:p_payee_id, :p_payer_id, :p_transaction_amount, :p_transaction_type, :p_overdraftbalance, :p_account_type, :p_withdrawal_limit)", nativeQuery = true)
	void callwithdrawProcedure(
	    @Param("p_payee_id") int payee_id, 
	    @Param("p_payer_id") int payer_id, 
	    @Param("p_transaction_amount") int transaction_amount, 
	    @Param("p_transaction_type") String transaction_type,
	    @Param("p_overdraftbalance") int overdraft_balance, 
	    @Param("p_account_type") String account_type, 
	    @Param("p_withdrawal_limit") int withdrawal_limit
	);
	
    
    @Modifying
	@Query(value = "CALL update_transact(:p_payee_id, :p_payer_id, :p_transaction_amount, :p_transaction_type, :p_overdraftbalance, :p_account_type, :p_withdrawal_limit)", nativeQuery = true)
	void calltransactProcedure(
	    @Param("p_payee_id") int payee_id, 
	    @Param("p_payer_id") int payer_id, 
	    @Param("p_transaction_amount") int transaction_amount, 
	    @Param("p_transaction_type") String transaction_type,
	    @Param("p_overdraftbalance") int overdraft_balance, 
	    @Param("p_account_type") String account_type, 
	    @Param("p_withdrawal_limit") int withdrawal_limit
	);

    
    
}
