package com.ofss.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public Customer updateCustomer(@PathVariable Customer customer) {
		return customerservice.updateCustomer(customer);
	}

	@CrossOrigin
	@PostMapping("addCustomer")
	public Customer addCustomer(@PathVariable Customer customer) {
		return customerservice.addNewCustomer(customer);
	}

	@CrossOrigin
	@DeleteMapping("deleteCustomer")
	public boolean deleteCustomer(int employeeId) {
		return customerservice.deleteCustomerById(employeeId);
	}

}
