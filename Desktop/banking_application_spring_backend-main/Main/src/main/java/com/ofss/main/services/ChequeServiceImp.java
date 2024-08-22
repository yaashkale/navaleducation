package com.ofss.main.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofss.main.domain.Cheque;
import com.ofss.main.repository.ChequeRepository;

import jakarta.transaction.Transactional;

@Service
public class ChequeServiceImp implements ChequeService {

    @Autowired
    private ChequeRepository chequeRepository;

    @Override
    @Transactional
    public boolean generateCheques(int accountId) {
        try {
            chequeRepository.generateCheques(accountId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Cheque getChequeById(int chequeId) {
        return chequeRepository.findById(chequeId).orElse(null);
    }

    public List<Cheque> getChequesBySenderAccountId(int senderAccountId) {
        return chequeRepository.findBySenderAccountId(senderAccountId);
    }

    public List<Cheque> getChequesByReceiverAccountId(int receiverAccountId) {
        return chequeRepository.findByReceiverAccountId(receiverAccountId);
    }
}
