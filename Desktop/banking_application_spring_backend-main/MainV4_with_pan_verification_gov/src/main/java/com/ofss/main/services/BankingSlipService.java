package com.ofss.main.services;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ofss.main.domain.BankSlip;


@Service
public interface BankingSlipService {

	List<BankSlip> getAllSlipsById(int accountId);

	BankSlip createBankingSlip(BankSlip bankslip);

	void addCheque(int bankSlipId, int chequeId, int chequeAmount, String chequeStatus, int receiverAccountId,
			Timestamp chequeDate);

}
