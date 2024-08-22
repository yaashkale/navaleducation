package com.ofss.main.domain_pan;


	

	import javax.crypto.Mac;
	import javax.crypto.spec.SecretKeySpec;
	import java.util.Base64;

	public class SignatureGenerator {

	    public static String generateHMACSignature(String data, String secretKey) {
	        try {
	            // Specify the HMAC algorithm
	            String algorithm = "HmacSHA256";
	            // Create a new Mac instance
	            Mac mac = Mac.getInstance(algorithm);
	            // Create a SecretKeySpec with the secret key
	            SecretKeySpec keySpec = new SecretKeySpec(secretKey.getBytes(), algorithm);
	            // Initialize the Mac instance with the key
	            mac.init(keySpec);
	            // Compute the HMAC signature
	            byte[] rawHmac = mac.doFinal(data.getBytes());
	            // Encode the result to Base64 for easy representation
	            return Base64.getEncoder().encodeToString(rawHmac);
	        } catch (Exception e) {
	            throw new RuntimeException("Failed to generate HMAC signature", e);
	        }
	    }
	}
