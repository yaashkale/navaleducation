package com.ofss.main.domain;

import java.sql.Timestamp;
import java.time.Instant;
import java.util.List;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity

@Table(name = "customer_details")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerId;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "username")
	private String username;

	@Column(name = "passwrd")
	private String password; // Fixed typo

	@Column(name = "address_line_1")
	private String addressLine1;
	@Column(name = "address_line_2")
	private String addressLine2;
	@Column(name = "address_line_3")
	private String addressLine3;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "zip")
	private int zip;

	@Column(name = "email")
	private String email;

	@Column(name = "account_status")
	private String accountStatus = "inactive";

	@Column(name = "last_login_attempt")
	private Timestamp lastLoginAttempt = Timestamp.from(Instant.now());

	@Column(name = "account_locked")
	private char accountLocked = 'N';

	@Column(name = "login_attempts")
	private int loginAttempts = 0;

	@Column(name = "last_activity_time")
	private Timestamp lastActivityTime = Timestamp.from(Instant.now());
	
	
	@OneToMany(mappedBy = "customer")
	private Set<Account> accounts;
	
	@OneToMany(mappedBy = "customer")
	private List<Transaction> transactions;

	public Customer() {
	}

	public Customer(String firstName, String lastName, String username, String password, String addressLine1,
			String addressLine2, String addressLine3, String city, String state, int zip, String email,
			String accountStatus, Timestamp lastLoginAttempt, char accountLocked, int loginAttempts,
			Timestamp lastActivityTime) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.email = email;
		this.accountStatus = accountStatus;
		this.lastLoginAttempt = lastLoginAttempt;
		this.accountLocked = accountLocked;
		this.loginAttempts = loginAttempts;
		this.lastActivityTime = lastActivityTime;
	}

	// Getters and setters...

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public Timestamp getLastLoginAttempt() {
		return lastLoginAttempt;
	}

	public void setLastLoginAttempt(Timestamp lastLoginAttempt) {
		this.lastLoginAttempt = lastLoginAttempt;
	}

	public char getAccountLocked() {
		return accountLocked;
	}

	public void setAccountLocked(char accountLocked) {
		this.accountLocked = accountLocked;
	}

	public int getLoginAttempts() {
		return loginAttempts;
	}

	public void setLoginAttempts(int loginAttempts) {
		this.loginAttempts = loginAttempts;
	}

	public Timestamp getLastActivityTime() {
		return lastActivityTime;
	}

	public void setLastActivityTime(Timestamp lastActivityTime) {
		this.lastActivityTime = lastActivityTime;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
}
