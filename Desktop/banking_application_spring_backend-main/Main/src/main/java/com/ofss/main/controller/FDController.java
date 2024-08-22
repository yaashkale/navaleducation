package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.domain.Account;
import com.ofss.main.domain.FD;
import com.ofss.main.services.AccountService;
import com.ofss.main.services.FDService;



@RequestMapping("fdservice")
@RestController
public class FDController {

    @Autowired
    AccountService accountservice;

    @Autowired
    FDService fdservice;

    @CrossOrigin
    @PostMapping("createFD/{accountId}")
    public FD createFD(@PathVariable int accountId, @RequestBody FD fd) {
        Account acc = accountservice.getAccountById(accountId);
        if (acc != null) {
            int amount = fd.getFdAmount();
            int roi_id = fd.getRoiId();

            FD createdFD = fdservice.createfd(accountId, fd, amount, roi_id);
            if (createdFD != null) {
                return createdFD;
            } else {
                return null;
            }
        }
        return null;
    }
    @CrossOrigin
    @GetMapping("getAllFD/{accountId}")
    public List<FD> getAllfds(@PathVariable int accountId) {
        Account acc = accountservice.getAccountById(accountId);
        if (acc != null) {
            List<FD> listOfFds = fdservice.getAllFd(accountId);
            return listOfFds;
        } else {
            return null;
        }
    }
}
