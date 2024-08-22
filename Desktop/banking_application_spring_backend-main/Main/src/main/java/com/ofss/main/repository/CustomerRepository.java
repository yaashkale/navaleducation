package com.ofss.main.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ofss.main.domain.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {

	Customer findByUsername(String username);
}
