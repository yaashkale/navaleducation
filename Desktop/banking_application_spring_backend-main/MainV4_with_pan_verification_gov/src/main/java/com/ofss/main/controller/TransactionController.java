package com.ofss.main.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.controller_type.DepositWithdraw;
import com.ofss.main.domain.Account;
import com.ofss.main.domain.Transaction;
import com.ofss.main.services.AccountService;
import com.ofss.main.services.TransactionService;

@RequestMapping("transactionService")
@RestController
class TransactionController {
	
	@Autowired
	TransactionService transactionservice;
	
	@Autowired
	AccountService accountservice;
	
	
	@GetMapping("/getAllCustomerTransactions/{accountId}")
	@CrossOrigin
	public List<Transaction> getAllCustomerTransactionByCustomerId(@PathVariable int accountId) {
	    try {
	        // Combine the lists from both methods
	        List<Transaction> transactions = new ArrayList<>();
	        transactions.addAll(transactionservice.getTransactionByCustomerIdPayer(accountId));
	        transactions.addAll(transactionservice.getTransactionByCustomerIdPayee(accountId));
	        return transactions;
	    } catch (Exception e) {
	        // Handle the exception and return an appropriate response or throw a custom exception
	        e.printStackTrace();
	        return new ArrayList<>(); // Returning an empty list in case of error
	    }
	}
	
	@GetMapping("getTransaction/{transactionId}")
	@CrossOrigin
	public Transaction getTransaction(@PathVariable int transactionId) {
		return transactionservice.getTransactionByTransactionId(transactionId);
	}

	
	@PostMapping("deposit")
	@CrossOrigin
	public boolean deposit(@RequestBody DepositWithdraw info) {
		Account useraccount = accountservice.getAccountById(info.getAccountId());
		return transactionservice.deposit(useraccount, info.getAmount());
	}
	
	@PostMapping("withdraw")
	@CrossOrigin
	public boolean withdraw(@RequestBody DepositWithdraw info) {
		Account useraccount = accountservice.getAccountById(info.getAccountId());
		return transactionservice.withdraw(useraccount, info.getAmount());
	}
	
	@PostMapping("transact/{payeeId}")
	@CrossOrigin
	public boolean transact(@PathVariable int payeeId ,@RequestBody DepositWithdraw info) {
		Account useraccount = accountservice.getAccountById(info.getAccountId());
		return transactionservice.transact(useraccount, info.getAmount(), payeeId);
	}
}
