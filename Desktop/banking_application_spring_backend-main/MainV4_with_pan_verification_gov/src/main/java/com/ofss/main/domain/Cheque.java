package com.ofss.main.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "cheque_details")
public class Cheque {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cheque_id")
    private Integer chequeId;

    @Column(name = "sender_account_id", nullable = false)
    private Integer senderAccountId;

    @Column(name = "receiver_account_id")
    private Integer receiverAccountId;

    @Column(name = "cheque_amount", nullable = false)
    private Integer chequeAmount;

    @Column(name = "cheque_date", nullable = false)
    private Timestamp chequeDate;

    @Column(name = "cheque_status", nullable = false)
    private String chequeStatus;

//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "sender_account_id", insertable = false, updatable = false)
//    private Account senderAccount;
//
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "receiver_account_id", insertable = false, updatable = false)
//    private Account receiverAccount;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sender_account_id", insertable = false, updatable = false)
    @JsonIgnore
    private Account senderAccount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receiver_account_id", insertable = false, updatable = false)
    @JsonIgnore
    private Account receiverAccount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JsonBackReference
    @JoinColumn(name = "bank_slip_id", nullable = false)
    private BankSlip bankSlip;

    public Cheque() {
    }

    public Cheque(Integer chequeId, Integer senderAccountId, Integer receiverAccountId, Integer chequeAmount,
                  Timestamp chequeDate, String chequeStatus, Account senderAccount, Account receiverAccount,
                  BankSlip bankSlip) {
        this.chequeId = chequeId;
        this.senderAccountId = senderAccountId;
        this.receiverAccountId = receiverAccountId;
        this.chequeAmount = chequeAmount;
        this.chequeDate = chequeDate;
        this.chequeStatus = chequeStatus;
        this.senderAccount = senderAccount;
        this.receiverAccount = receiverAccount;
        this.bankSlip = bankSlip;
    }

    // Getters and Setters

    public Integer getChequeId() {
        return chequeId;
    }

    public void setChequeId(Integer chequeId) {
        this.chequeId = chequeId;
    }

    public Integer getSenderAccountId() {
        return senderAccountId;
    }

    public void setSenderAccountId(Integer senderAccountId) {
        this.senderAccountId = senderAccountId;
    }

    public Integer getReceiverAccountId() {
        return receiverAccountId;
    }

    public void setReceiverAccountId(Integer receiverAccountId) {
        this.receiverAccountId = receiverAccountId;
    }

    public Integer getChequeAmount() {
        return chequeAmount;
    }

    public void setChequeAmount(Integer chequeAmount) {
        this.chequeAmount = chequeAmount;
    }

    public Timestamp getChequeDate() {
        return chequeDate;
    }

    public void setChequeDate(Timestamp chequeDate) {
        this.chequeDate = chequeDate;
    }

    public String getChequeStatus() {
        return chequeStatus;
    }

    public void setChequeStatus(String chequeStatus) {
        this.chequeStatus = chequeStatus;
    }

    public Account getSenderAccount() {
        return senderAccount;
    }

    public void setSenderAccount(Account senderAccount) {
        this.senderAccount = senderAccount;
    }

    public Account getReceiverAccount() {
        return receiverAccount;
    }

    public void setReceiverAccount(Account receiverAccount) {
        this.receiverAccount = receiverAccount;
    }

    public BankSlip getBankSlip() {
        return bankSlip;
    }

    public void setBankSlip(BankSlip bankSlip) {
        this.bankSlip = bankSlip;
    }

    @Override
    public String toString() {
        return "Cheque [chequeId=" + chequeId + ", senderAccountId=" + senderAccountId + ", receiverAccountId="
                + receiverAccountId + ", chequeAmount=" + chequeAmount + ", chequeDate=" + chequeDate
                + ", chequeStatus=" + chequeStatus + ", senderAccount=" + senderAccount + ", receiverAccount="
                + receiverAccount + ", bankSlip=" + bankSlip + "]";
    }
}

