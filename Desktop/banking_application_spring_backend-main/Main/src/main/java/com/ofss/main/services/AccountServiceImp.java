package com.ofss.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofss.main.domain.Account;
import com.ofss.main.repository.AccountRepository;

@Service
public class AccountServiceImp implements AccountService {

    @Autowired
    private AccountRepository accountrepository;

    @Override
    public Account createAccount(Account account) {
        return accountrepository.save(account);
    }

    @Override
    public List<Account> getAllAccounts() {
        return (List<Account>) accountrepository.findAll();
    }

    @Override
    public List<Account> getAccountsByCustomerId(int searchCustomerId) {
        return accountrepository.getAccountsByCustomer_CustomerId(searchCustomerId);
    }

    @Override
    public Account getAccountById(int accountId) {
        return accountrepository.findById(accountId).orElse(null);
    }

    @Override
    public Account updateAccount(int accountId, Account accountDetails) {
        Account existingAccount = getAccountById(accountId);
        if (existingAccount != null) {
            existingAccount.setAccountType(accountDetails.getAccountType());
            existingAccount.setCurrentBalance(accountDetails.getCurrentBalance());
            existingAccount.setMinimumBalance(accountDetails.getMinimumBalance());
            existingAccount.setAccountStatus(accountDetails.getAccountStatus());
            existingAccount.setOpeningDate(accountDetails.getOpeningDate());
            existingAccount.setOverdraftBalance(accountDetails.getOverdraftBalance());
            existingAccount.setWithdrawalLimit(accountDetails.getWithdrawalLimit());
            return accountrepository.save(existingAccount);
        }
        return null;
    }
}

