package com.ofss.main.controller_type;

import java.sql.Timestamp;

public class ChequeIdRequest {
    private int chequeId;
    private int chequeAmount;
    private Timestamp chequeDate;
    private String chequeStatus;
    private int receiverAccountId;
    public ChequeIdRequest() {
		
	}
    
    
    public ChequeIdRequest(int chequeId, int chequeAmount, Timestamp chequeDate, String chequeStatus,
			int receiverAccountId) {
		super();
		this.chequeId = chequeId;
		this.chequeAmount = chequeAmount;
		this.chequeDate = chequeDate;
		this.chequeStatus = chequeStatus;
		this.receiverAccountId = receiverAccountId;
	}


	public ChequeIdRequest(int chequeId) {
		super();
		this.chequeId = chequeId;
	}

	// Getter and Setter
    public int getChequeId() {
        return chequeId;
    }

    public void setChequeId(int chequeId) {
        this.chequeId = chequeId;
    }


	public int getChequeAmount() {
		return chequeAmount;
	}


	public void setChequeAmount(int chequeAmount) {
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


	public int getReceiverAccountId() {
		return receiverAccountId;
	}


	public void setReceiverAccountId(int receiverAccountId) {
		this.receiverAccountId = receiverAccountId;
	}


	@Override
	public String toString() {
		return "ChequeIdRequest [chequeId=" + chequeId + ", chequeAmount=" + chequeAmount + ", chequeDate=" + chequeDate
				+ ", chequeStatus=" + chequeStatus + ", receiverAccountId=" + receiverAccountId + "]";
	}

	
    
    
    
}
