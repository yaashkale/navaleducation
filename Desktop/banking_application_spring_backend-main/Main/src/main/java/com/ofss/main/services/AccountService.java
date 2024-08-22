package com.ofss.main.services;

import java.util.List;

import com.ofss.main.domain.Account;

public interface AccountService {
    Account createAccount(Account account);

    List<Account> getAllAccounts();

    List<Account> getAccountsByCustomerId(int searchCustomerId);

    Account getAccountById(int accountId);

    Account updateAccount(int accountId, Account accountDetails);
}
