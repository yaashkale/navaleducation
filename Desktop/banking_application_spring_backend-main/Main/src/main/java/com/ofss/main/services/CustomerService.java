package com.ofss.main.services;

import java.util.List;

import com.ofss.main.domain.Customer;

public interface CustomerService {
	List<Customer> getAllCustomers();

    Customer getCustomerByCustomerId(int customerId);
    
    Customer getCustomerByUsername(String username);
   
    Customer addNewCustomer(Customer customer);
    
    Customer updateCustomer(Customer customer);
    
    boolean deleteCustomerById(int customerId);
}
