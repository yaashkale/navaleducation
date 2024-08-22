package com.ofss.main.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.controller_type.ChequeIdRequest;
import com.ofss.main.domain.Account;
import com.ofss.main.domain.BankSlip;
import com.ofss.main.domain.Cheque;
import com.ofss.main.domain.Transaction;
import com.ofss.main.services.AccountService;
import com.ofss.main.services.BankingSlipService;
import com.ofss.main.services.ChequeService;
import com.ofss.main.services.TransactionService;

@RequestMapping("bankingSlipService")
@RestController
public class BankingSlipController {

    @Autowired
    BankingSlipService bankingslipservice;

    @Autowired
    AccountService accountservice;
    
    @Autowired
    ChequeService chequeservice;
    
    @Autowired
    TransactionService transactionservice;

    
    @CrossOrigin
    @GetMapping("getAllBankingSlipsByAccountId/{accountId}")
    public List<BankSlip> getAllSlipsById(@PathVariable int accountId) {
        return bankingslipservice.getAllSlipsById(accountId);
    }

    @CrossOrigin
    @GetMapping("createSlip/{accountId}")
    public ResponseEntity<BankSlip> createSlip(@PathVariable int accountId, @RequestBody BankSlip bankslip) {
        Account useraccount = accountservice.getAccountById(accountId);
        if (useraccount != null) {
            bankslip.setAccountId(accountId);
            bankslip.setBankSlipStatus("active");
            bankslip.setBankSlipDate(new Timestamp(System.currentTimeMillis()));
            BankSlip createdBankSlip = bankingslipservice.createBankingSlip(bankslip);
            return ResponseEntity.ok(createdBankSlip);
        } else {
            return ResponseEntity.badRequest().build();  // Return a proper error response
        }
    }
    @PostMapping("/addChequeToBankSlip/{bankSlipId}")
    public ResponseEntity<String> addChequeToBankSlip(@PathVariable int bankSlipId, @RequestBody ChequeIdRequest request) {
        try {
            int chequeId = request.getChequeId();
            int chequeAmount = request.getChequeAmount();
            String chequeStatus = "deposited";
            int receiverAccountId = request.getReceiverAccountId();
            Timestamp chequeDate = request.getChequeDate();
            
            Cheque chq = chequeservice.getChequeById(chequeId);
            int accountId = chq.getSenderAccountId();
            
            Account accountDetails = accountservice.getAccountById(accountId);
            int amount = chequeAmount;
            boolean iswithdrawSuccessful = transactionservice.withdraw(accountDetails, amount);
            if (!iswithdrawSuccessful) {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Withdrawal failed due to insufficient funds");
            }

            bankingslipservice.addCheque(bankSlipId, chequeId, chequeAmount, chequeStatus, receiverAccountId, chequeDate);
            
            return ResponseEntity.ok("Cheque added to bank slip successfully");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("An error occurred while adding the cheque to the bank slip");
        }
    }



    
//    @CrossOrigin
//    @PostMapping("addChequeToBankSlip/{bankSlipId}")
//    public boolean addChequeToBankSlip(@PathVariable int bankSlipId, @RequestBody int chequeId ) {
////    	Cheque cheque = chequeservice.getChequeById(cheque_id);
//    	try {
//    		bankingslipservice.addCheque(bankSlipId, chequeId);
//    		return true;
//    	}
//    	catch(Exception e) {
//    		e.printStackTrace();
//    		return false;
//    	}
//    }
}
