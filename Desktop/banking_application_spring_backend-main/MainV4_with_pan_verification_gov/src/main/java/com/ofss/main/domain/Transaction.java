package com.ofss.main.domain;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "transaction_details")
public class Transaction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "transaction_id")
    private int transactionId;
    
    @Column(name = "transaction_type")
    private String transactionType;
    
    @Column(name = "payee_id")
    private int payeeId;
    
    @Column(name = "payer_id")
    private int payerId;
    
    @Column(name = "transaction_amount")
    private int transactionAmount;
    
    @Column(name = "transaction_status")
    private String transactionStatus;
    
    @Column(name = "transaction_time")
    private Timestamp transactionTime;

    public Transaction() {
    }

    public Transaction(int transactionId, String transactionType, int payeeId, int payerId, 
                       int transactionAmount, String transactionStatus, Timestamp transactionTime) {
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

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    public int getTransactionAmount() {
        return transactionAmount;
    }

    public void setTransactionAmount(int transactionAmount) {
        this.transactionAmount = transactionAmount;
    }

    public int getPayeeId() {
        return payeeId;
    }

    public void setPayeeId(int payeeId) {
        this.payeeId = payeeId;
    }

    public int getPayerId() {
        return payerId;
    }

    public void setPayerId(int payerId) {
        this.payerId = payerId;
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

    @Override
    public String toString() {
        return "Transaction [transactionId=" + transactionId + ", transactionType=" + transactionType +
               ", payeeId=" + payeeId + ", payerId=" + payerId + ", transactionAmount=" + transactionAmount +
               ", transactionStatus=" + transactionStatus + ", transactionTime=" + transactionTime + "]";
    }
}
