package com.ofss.main.controller;

import com.ofss.main.domain_pan.*;
import com.ofss.main.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/pan-verification")
public class PanVerificationController {
	
	@Autowired
	private final PanVerifcationService panVerificationService;
	
	public PanVerificationController(PanVerifcationService panVerificatoinService) {
		this.panVerificationService = panVerificatoinService;
	}
	
	@PostMapping
	public ResponseEntity<String> verifyPan(@RequestBody PanVerificationRequest request){
		try {
			
			panVerificationService.verifyPan(request.getPanNumber(), request.getAadhaar(), request.getFullName(), request.getMobile(), request.getEmail(), request.getDob(), request.getGender());
			return ResponseEntity.ok("Verification Request Submitted Successfully");
		}
		catch(Exception e) {
			return ResponseEntity.status(500).body("An error occured " + e.getMessage());
		}
	}
}
