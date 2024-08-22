package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.domain.Cheque;
import com.ofss.main.services.ChequeService;

@RequestMapping("chequeService")
@RestController
public class ChequeController {

    @Autowired
    private ChequeService chequeService;

    @GetMapping("generateCheque/{accountId}")
    public boolean generateCheques(@PathVariable int accountId) {
        return chequeService.generateCheques(accountId);
    }

    @GetMapping("getChequeById/{chequeId}")
    public Cheque getChequeById(@PathVariable int chequeId) {
        return chequeService.getChequeById(chequeId);
    }

    @GetMapping("getChequesBySender/{senderAccountId}")
    public List<Cheque> getChequesBySender(@PathVariable int senderAccountId) {
        return chequeService.getChequesBySenderAccountId(senderAccountId);
    }

    @GetMapping("getChequesByReceiver/{receiverAccountId}")
    public List<Cheque> getChequesByReceiver(@PathVariable int receiverAccountId) {
        return chequeService.getChequesByReceiverAccountId(receiverAccountId);
    }
}
