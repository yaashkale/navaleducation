package com.ofss.main.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ofss.main.domain.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {

    Customer findByUsername(String username);

    @Query(value = "CALL login_auth(:username, :password)", nativeQuery = true)
    Integer callLoginAuthProcedure(@Param("username") String username, @Param("password") String password);
}
