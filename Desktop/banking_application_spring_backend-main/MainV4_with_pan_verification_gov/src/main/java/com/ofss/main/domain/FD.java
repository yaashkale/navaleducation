package com.ofss.main.domain;

import java.sql.Timestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "fd_storage")
public class FD {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="fd_id")
	private int FdId;
	
	@Column(name="account_id")
	private int accountId;
	
	@Column(name="account_type")
	private String accountType;
	
	@Column(name="fd_amount")
	private int fdAmount;
	
	@Column(name="roi_id")
	private int roiId;
	
	@Column(name="opening_date")
	private Timestamp openingDate;
	
	public FD() {
		
	}

	public FD(int fdId, int accountId, String accountType, int roiId, Timestamp openingDate) {
		super();
		FdId = fdId;
		this.accountId = accountId;
		this.accountType = accountType;
		this.roiId = roiId;
		this.openingDate = openingDate;
	}

	public int getFdId() {
		return FdId;
	}

	public void setFdId(int fdId) {
		FdId = fdId;
	}

	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	

	public int getFdAmount() {
		return fdAmount;
	}

	public void setFdAmount(int fdAmount) {
		this.fdAmount = fdAmount;
	}

	public int getRoiId() {
		return roiId;
	}

	public void setRoiId(int roiId) {
		this.roiId = roiId;
	}

	public Timestamp getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Timestamp openingDate) {
		this.openingDate = openingDate;
	}

	@Override
	public String toString() {
		return "FD [FdId=" + FdId + ", accountId=" + accountId + ", accountType=" + accountType + ", roiId=" + roiId
				+ ", openingDate=" + openingDate + "]";
	}
	
	
	
	
	
}
