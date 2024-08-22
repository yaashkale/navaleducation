package com.ofss.main.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ofss.main.domain.Customer;
import com.ofss.main.repository.*;

@Service
public class CustomerServiceImp implements CustomerService {
	@Autowired
	private CustomerRepository customerrepository;

	@Override
	public List<Customer> getAllCustomers() {
		// TODO Auto-generated method stub
		List<Customer> customerList = (List<Customer>) customerrepository.findAll();
		return customerList;
	}

	@Override
	public Customer getCustomerByCustomerId(int customerId) {
		return customerrepository.findById(customerId).orElse(null);
		// TODO Auto-generated method stub

	}

	@Override
	public Customer addNewCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerrepository.save(customer);

	}

	@Override
	public Customer updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return customerrepository.save(customer);
	}

	@Override
	public Customer getCustomerByUsername(String username) {

		// TODO Auto-generated method stub
		return customerrepository.findByUsername(username);
	}

	@Override
	public boolean deleteCustomerById(int customerId) {
		// TODO Auto-generated method stub
		Optional<Customer> optionalEmployee = customerrepository.findById(customerId);
		if (optionalEmployee.isPresent()) {
			Customer cus = optionalEmployee.get();
			customerrepository.delete(cus);
			return true;
		}
		return false;
	}

}
