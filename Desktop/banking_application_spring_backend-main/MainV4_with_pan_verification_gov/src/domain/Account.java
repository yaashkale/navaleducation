package com.ofss.main.domain;

import java.sql.Timestamp;
import java.time.Instant;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Table;

@Entity
@Table(name = "account_details")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private int accountId;
    
    @Column(name = "account_type")
    private String accountType;
    
    @Column(name = "current_balance")
    private int currentBalance;
    
    @Column(name = "min_balance")
    private int minimumBalance;
    
    @Column(name = "account_status")
    private String accountStatus = "active";
    
    @Column(name = "opening_date")
    private Timestamp openingDate = Timestamp.from(Instant.now());
    
    @Column(name = "overdraftbalance")
    private int overdraftBalance;
    
    @Column(name = "withdrawal_limit")
    private int withdrawalLimit;
    
    @Column(name = "overdraft_availed")
    private boolean overdraftAvailed;
    
//    (fetch = FetchType.LAZY)
    @ManyToOne
    @JsonIgnore
    @JoinColumn(name = "customer_id", nullable = false)
    private Customer customer;

    public Account() {
    }

    public Account(int accountId, Customer customer, String accountType, int currentBalance, int minimumBalance, 
                   String accountStatus, Timestamp openingDate, int overdraftBalance, int withdrawalLimit) {
        this.accountId = accountId;
        this.customer = customer;
        this.accountType = accountType;
        this.currentBalance = currentBalance;
        this.minimumBalance = minimumBalance;
        this.accountStatus = accountStatus;
        this.openingDate = openingDate;
        this.overdraftBalance = overdraftBalance;
        this.withdrawalLimit = withdrawalLimit;
    }

    // Getters and setters...

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public int getCurrentBalance() {
        return currentBalance;
    }

    public void setCurrentBalance(int currentBalance) {
        this.currentBalance = currentBalance;
    }

    public int getMinimumBalance() {
        return minimumBalance;
    }

    public void setMinimumBalance(int minimumBalance) {
        this.minimumBalance = minimumBalance;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public Timestamp getOpeningDate() {
        return openingDate;
    }

    public void setOpeningDate(Timestamp openingDate) {
        this.openingDate = openingDate;
    }

    public int getOverdraftBalance() {
        return overdraftBalance;
    }

    public void setOverdraftBalance(int overdraftBalance) {
        this.overdraftBalance = overdraftBalance;
    }

    public int getWithdrawalLimit() {
        return withdrawalLimit;
    }

    public void setWithdrawalLimit(int withdrawalLimit) {
        this.withdrawalLimit = withdrawalLimit;
    }
}

