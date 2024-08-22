package com.ofss.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofss.main.domain.Account;
import com.ofss.main.domain.Transaction;
import com.ofss.main.repository.TransactionRepository;

import jakarta.transaction.Transactional;

@Service
public class TransactionServiceImp implements TransactionService {
    private final TransactionRepository transactionrepository;

    @Autowired
    public TransactionServiceImp(TransactionRepository transactionrepository) {
        this.transactionrepository = transactionrepository;
    }

    @Override
    public List<Transaction> getTransactionByCustomerIdPayer(int customerId) {
        return transactionrepository.findByPayerId(customerId);
    }

    @Override
    public List<Transaction> getTransactionByCustomerIdPayee(int customerId) {
        return transactionrepository.findByPayeeId(customerId);
    }

    @Override
    public Transaction getTransactionByTransactionId(int transactionId) {
        return transactionrepository.findById(transactionId).orElse(null);
    }

    @Override
    @Transactional
    public boolean deposit(Account accountDetails, int amount) {
        try {
            transactionrepository.calldepositProcedure(
                accountDetails.getAccountId(), 
                accountDetails.getAccountId(), 
                amount, 
                "deposit", 
                accountDetails.getOverdraftBalance(), 
                accountDetails.getAccountType(), 
                accountDetails.getWithdrawalLimit()
            );
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    @Transactional
    public boolean withdraw(Account accountDetails, int amount) {
        try {
            transactionrepository.callwithdrawProcedure(
                accountDetails.getAccountId(), 
                accountDetails.getAccountId(), 
                amount, 
                "withdraw", 
                accountDetails.getOverdraftBalance(), 
                accountDetails.getAccountType(), 
                accountDetails.getWithdrawalLimit()
            );
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

	@Override
	@Transactional
	public boolean transact(Account accountDetails, int amount, int payeeId) {
		 try {
	            transactionrepository.calltransactProcedure(
	                payeeId,
	                accountDetails.getAccountId(), 
	                amount, 
	                "transact", 
	                accountDetails.getOverdraftBalance(), 
	                accountDetails.getAccountType(), 
	                accountDetails.getWithdrawalLimit()
	            );
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace();
	            return false;
	        }
	}
}
