package com.ofss.main.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ofss.main.domain.Cheque;

@Service
public interface ChequeService {

	boolean generateCheques(int accountId);

	Cheque getChequeById(int cheque_id);
	
	 List<Cheque> getChequesBySenderAccountId(int senderAccountId);
	 
	 List<Cheque> getChequesByReceiverAccountId(int receiverAccountId);
}
