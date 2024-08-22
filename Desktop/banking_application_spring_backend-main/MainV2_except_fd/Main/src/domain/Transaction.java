package com.ofss.main.domain;

import java.sql.Timestamp;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "transaction_details")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "transaction_id")
    private int transactionId;
    
    @Column(name = "account_id")
    private int accountId;
    
    @Column(name = "transaction_type")
    private String transactionType;
    
    @Column(name = "payee_id")
    private String payeeId;
    
    @Column(name = "payer_id")
    private String payerId;
    
    @Column(name = "transaction_amount")
    private int transactionAmount;
    
    @Column(name = "transaction_status")
    private String transactionStatus;
    
    @Column(name = "transaction_time")
    private Timestamp transactionTime;

    
    @ManyToOne
    Customer customer;
    
    public Transaction() {
    }

    public Transaction(int accountId, int transactionId, String transactionType, String payeeId, String payerId, 
                       int transactionAmount, String transactionStatus, Timestamp transactionTime) {
        this.accountId = accountId;
        this.transactionId = transactionId;
        this.transactionType = transactionType;
        this.payeeId = payeeId;
        this.payerId = payerId;
        this.transactionAmount = transactionAmount;
        this.transactionStatus = transactionStatus;
        this.transactionTime = transactionTime;
    }

    // Getters and setters...

    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public String getPayeeId() {
        return payeeId;
    }

    public void setPayeeId(String payeeId) {
        this.payeeId = payeeId;
    }

    public String getPayerId() {
        return payerId;
    }

    public void setPayerId(String payerId) {
        this.payerId = payerId;
    }

    public int getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(int transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public String getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(String transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public Timestamp getTransactionTime() {
        return transactionTime;
    }

    public void setTransactionTime(Timestamp transactionTime) {
        this.transactionTime = transactionTime;
    }
}
