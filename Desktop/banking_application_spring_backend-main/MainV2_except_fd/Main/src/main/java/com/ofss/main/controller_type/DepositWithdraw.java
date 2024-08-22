package com.ofss.main.controller_type;

import com.ofss.main.domain.Account;

public class DepositWithdraw {
	private int accountId;
	private int amount;
	
	public DepositWithdraw() {
		
	}
	public DepositWithdraw(int accountId, int amount) {
		super();
		this.accountId = accountId;
		this.amount = amount;
	}
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "DepositWithdraw [accountId=" + accountId + ", amount=" + amount + "]";
	}
	
	
	
	
	
	
}
