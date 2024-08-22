package com.ofss.main.Main;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.ofss.main.domain.BankSlip;
import com.ofss.main.repository.BankingSlipRepository;

@SpringBootTest
class MainApplicationTests {

	
	 @Autowired
	    private BankingSlipRepository bankSlipRepository;

	    @Test
	    public void testFindByAccountId() {
	        List<BankSlip> slips = bankSlipRepository.findByAccountId(93);
	        slips.forEach(System.out::println);
	    }

}
