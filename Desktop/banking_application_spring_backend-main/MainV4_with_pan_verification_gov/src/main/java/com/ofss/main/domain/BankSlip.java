package com.ofss.main.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;


import com.fasterxml.jackson.annotation.JsonManagedReference;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

//@ManyToOne
//@JsonBackReference
//@JoinColumn(name = "slip_id", nullable = false)
//private BankSlip bankSlip;
@Entity
@Table(name = "bank_slip_details")
public class BankSlip {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	@Column(name = "bank_slip_id")
	private int bankSlipId;
	
	@Column(name = "bank_slip_status")
	private String bankSlipStatus;
	@Column(name = "bank_slip_date")
	private Timestamp bankSlipDate;

	@Column(name = "account_id")
	private int accountId;
	
	@JsonManagedReference
	@OneToMany(mappedBy="bankSlip",cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private List<Cheque> cheques= new ArrayList<>();
	public BankSlip() {
		
	}

	public BankSlip(int bankSlipId, String bankSlipStatus, Timestamp bankSlipDate, int accountId) {
		super();
		this.bankSlipId = bankSlipId;
		this.bankSlipStatus = bankSlipStatus;
		this.bankSlipDate = bankSlipDate;
		this.accountId = accountId;
	}

	public int getBankSlipId() {
		return bankSlipId;
	}

	public void setBankSlipId(int bankSlipId) {
		this.bankSlipId = bankSlipId;
	}

	public String getBankSlipStatus() {
		return bankSlipStatus;
	}

	public void setBankSlipStatus(String bankSlipStatus) {
		bankSlipStatus = "active";
		this.bankSlipStatus = bankSlipStatus;
	}

	public Timestamp getBankSlipDate() {
		return bankSlipDate;
	}

	public void setBankSlipDate(Timestamp bankSlipDate) {
		  this.bankSlipDate = bankSlipDate;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	@Override
	public String toString() {
		return "BankSlip [bankSlipId=" + bankSlipId + ", bankSlipStatus=" + bankSlipStatus + ", bankSlipDate="
				+ bankSlipDate + ", accountId=" + accountId + "]";
	}
	
	
	
	
}
