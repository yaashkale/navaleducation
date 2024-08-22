package com.ofss.main.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ofss.main.domain.Account;
import com.ofss.main.domain.Transaction;

@Service
public interface TransactionService {
	List<Transaction> getTransactionByCustomerIdPayer(int accountId);
	List<Transaction> getTransactionByCustomerIdPayee(int accountId);
	Transaction getTransactionByTransactionId(int transactionId);
	boolean deposit(Account acccountDetails, int amount);
	boolean withdraw(Account accountDetails, int amount);
	boolean transact(Account useraccount, int amount, int payeeId);
	
}
 