package com.ofss.main.services;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofss.main.domain.BankSlip;
import com.ofss.main.domain.Cheque;
import com.ofss.main.repository.BankingSlipRepository;

import jakarta.transaction.Transactional;

@Service
public class BankingSlipServiceImp implements BankingSlipService {

	@Autowired
	BankingSlipRepository bankingsliprepository;

	@Override

	public List<BankSlip> getAllSlipsById(int accountId) {
		try {
			return bankingsliprepository.findByAccountId(accountId);
		} catch (Exception e) {
			e.printStackTrace(); // Print stack trace for debugging
			throw e; // Rethrow exception to be handled by the global exception handler
		}
	}
//    public List<BankSlip> getAllSlipsById(int accountId) {
//        return bankingsliprepository.findByAccountId(accountId);
//    }

	@Override
	@Transactional
	public BankSlip createBankingSlip(BankSlip bankslip) {
		try {
			bankingsliprepository.createBankSlip(bankslip.getBankSlipId(), bankslip.getAccountId(),
					bankslip.getBankSlipDate(), bankslip.getBankSlipStatus());
			return bankslip;
//        	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	@Transactional

	public void addCheque(int bankSlipId, int chequeId, int chequeAmount, String chequeStatus, int receiverAccountId,
			Timestamp chequeDate) {
		bankingsliprepository.addCheque(bankSlipId, chequeId, chequeAmount, chequeStatus, receiverAccountId,
				chequeDate);
	}
	// TODO Auto-generated method stub

}
