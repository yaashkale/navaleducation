package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.domain.Account;
import com.ofss.main.domain.Customer;
import com.ofss.main.services.AccountService;
import com.ofss.main.services.CustomerService;

@RequestMapping("accountOperations")
@RestController
public class AccountController {
    @Autowired
    private AccountService accountservice;

    @Autowired
    private CustomerService customerservice;
    @CrossOrigin
    @GetMapping("getAllAccounts")
    public List<Account> getAllAccounts() {
        return accountservice.getAllAccounts();
    }

    @CrossOrigin
    @GetMapping("getAccountById/{accountId}")
    public Account getAccountById(@PathVariable int accountId) {
        return accountservice.getAccountById(accountId);
    }

    @CrossOrigin
    @GetMapping("getAllAccountsByCustomerId/{customerId}")
    public List<Account> getAllAccountsByCustomerId(@PathVariable int customerId) {
        return accountservice.getAccountsByCustomerId(customerId);
    }

    @CrossOrigin
    @PostMapping("addAccount/{customerId}")
    public ResponseEntity<Account> addAccount(@PathVariable int customerId, @RequestBody Account account) {
        Customer customer = customerservice.getCustomerByCustomerId(customerId);
        if (customer != null) {
            // Set the customer reference in the account
            account.setCustomer(customer);
            account.setAccountType(account.getAccountType());
            // Create and save the account
            
            Account createdAccount = accountservice.createAccount(account);
            return ResponseEntity.ok(createdAccount);
        } else {
            // Return an error response if customer is not found
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
    }

    @CrossOrigin
    @PutMapping("updateAccount/{accountId}")
    public Account updateAccount(@PathVariable int accountId, @RequestBody Account accountDetails) {
        return accountservice.updateAccount(accountId, accountDetails);
    }
}
