package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ofss.main.domain.Customer;
import com.ofss.main.services.CustomerService;

@RequestMapping("customerOperations")
@RestController
public class CustomerController {
	
    @Autowired
    private CustomerService customerservice;
    
    @CrossOrigin
    @GetMapping("getCustomerById/{customerId}")
    public Customer getCustomerById(@PathVariable int customerId) {
        return customerservice.getCustomerByCustomerId(customerId);
    }

    @CrossOrigin
    @GetMapping("getCustomerByUsername/{username}")
    public Customer getCustomerByUsername(@PathVariable String username) {
        return customerservice.getCustomerByUsername(username);
    }

    @CrossOrigin
    @GetMapping("getAllCustomers")
    public List<Customer> getAllCustomers() {
        return customerservice.getAllCustomers();
    }

    @CrossOrigin
    @PutMapping("updateCustomer")
    public Customer updateCustomer(@RequestBody Customer customer) {
        return customerservice.updateCustomer(customer);
    }

    @CrossOrigin
    @PostMapping("/addCustomer")
    public Customer addCustomer(@RequestBody Customer customer) {
        return customerservice.addNewCustomer(customer);
    }

    
    
    @CrossOrigin
    @PostMapping("/loginCustomerService")
    public ResponseEntity<String> validate(@RequestParam String username, @RequestParam String password) {
        System.out.println("Authentication Started!");
        
        boolean isAuthenticated = customerservice.authenticateUser(username, password);
        
        if (isAuthenticated) {
            System.out.println("Authentication Successful");
            return ResponseEntity.ok("Authentication Successful");
        } else {
            System.out.println("Authentication Failed");
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Authentication Failed");
        }
    }
    
    @CrossOrigin
    @DeleteMapping("deleteCustomer")
    public boolean deleteCustomer(@RequestParam int customerId) {
        return customerservice.deleteCustomerById(customerId);
    }
}
