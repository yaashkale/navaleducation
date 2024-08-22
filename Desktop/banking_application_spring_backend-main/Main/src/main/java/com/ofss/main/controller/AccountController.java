package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.domain.Account;
import com.ofss.main.services.AccountService;

@RequestMapping("accountOperations")
@RestController
public class AccountController {
    @Autowired
    private AccountService accountservice;

    @CrossOrigin
    @GetMapping("getAllAccounts")
    public List<Account> getAllAccounts() {
        return accountservice.getAllAccounts();
    }

    @CrossOrigin
    @GetMapping("getAccountById/{accountId}")
    public Account getAccountById(@PathVariable(value = "accountId") int accountId) {
        return accountservice.getAccountById(accountId);
    }

    @CrossOrigin
    @GetMapping("getAllAccountsByCustomerId/{customerId}")
    public List<Account> getAllAccountsByCustomerId(@PathVariable(value = "customerId") int customerId) {
        return accountservice.getAccountsByCustomerId(customerId);
    }

    @CrossOrigin
    @PostMapping("addAccount")
    public Account addAccount(@RequestBody Account account) {
        return accountservice.createAccount(account);
    }

    @CrossOrigin
    @PutMapping("updateAccount/{accountId}")
    public Account updateAccount(@PathVariable(value = "accountId") int accountId, @RequestBody Account accountDetails) {
        return accountservice.updateAccount(accountId, accountDetails);
    }
}
