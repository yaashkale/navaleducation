package com.ofss.main.services;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.time.Instant;
import java.util.UUID;

import com.ofss.main.domain_pan.CertificateParameters;
import com.ofss.main.domain_pan.Consent;
import com.ofss.main.domain_pan.ConsentArtifact;
import com.ofss.main.domain_pan.DataConsumer;
import com.ofss.main.domain_pan.DataProvider;
import com.ofss.main.domain_pan.DateRange;
import com.ofss.main.domain_pan.Frequency;
import com.ofss.main.domain_pan.Permission;
import com.ofss.main.domain_pan.RequestBody;
import com.ofss.main.domain_pan.Signature;
import com.ofss.main.domain_pan.SignatureGenerator;
import com.ofss.main.domain_pan.User;

@Service
public class PanVerifactionServiceImp implements PanVerifcationService {

	private final RestTemplate restTemplate;

	public PanVerifactionServiceImp(RestTemplate restTemplate) {
		this.restTemplate = restTemplate;
	}

//	public ConsentArtifact createConsentArtifact(String panNumber, String aadhar, String fullName, String mobile,
//			String email) 

	@Override
	public void verifyPan(String panNumber, String aadhar, String fullName, String mobile, String email, String dob,
			String gender) {

		ConsentArtifact consentArtifact = new ConsentArtifact();

		Consent consent = new Consent();
		consent.setConsentId(UUID.randomUUID().toString());
		consent.setTimeStamp(Instant.now().toString());

		DataConsumer dataconsumer = new DataConsumer();
		dataconsumer.setId("123e4567-e89b-12d3-a456-426614174000yk");
		consent.setDataConsumer(dataconsumer);

		DataProvider dataprovider = new DataProvider();
		dataprovider.setId("550e8400-e29b-41d4-a716-446655440000yk");
		consent.setDataProvider(dataprovider);

		consent.setPurpose("Verify PAN for banking application");

		User user = new User();
		user.setIdType("Aadhar");
		user.setIdNumber(aadhar);
		user.setMobile(mobile);
		user.setEmail(email);

		Permission permission = new Permission();
		
		DateRange dateRange = new DateRange(Instant.now().toString(), Instant.now().plusSeconds(3600).toString()); // 1
																													// hour
																													// validity
		permission.setDateRange(dateRange);

		
		Frequency frequency = new Frequency("ONE_TIME", 1, 0);
		permission.setFrequency(frequency);

		
		consent.setPermission(permission);

		
		consentArtifact.setConsent(consent);

		
		Signature signature = new Signature();
		String dataToSign = consent.toString(); 
		String generatedSignature = SignatureGenerator.generateHMACSignature(dataToSign, "fuckthis");
		signature.setSignature(generatedSignature);
		consentArtifact.setSignature(signature);

		RequestBody requestBody = new RequestBody();
		requestBody.setTxnId(UUID.randomUUID().toString());
		requestBody.setFormat("xml");

		requestBody.setCertificateParameters(new CertificateParameters(panNumber, aadhar, fullName, dob, gender));
		requestBody.setConsentArtifact(consentArtifact);

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);

		HttpEntity<RequestBody> requestEntity = new HttpEntity<>(requestBody, headers);

		ResponseEntity<String> response = restTemplate.exchange("https://apisetu.gov.in/certificate/v3/pan",
				HttpMethod.POST, requestEntity, String.class);

		System.out.println(response.getBody());
	}

}

//	