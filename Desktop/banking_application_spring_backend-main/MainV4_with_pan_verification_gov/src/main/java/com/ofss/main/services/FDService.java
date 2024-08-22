package com.ofss.main.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ofss.main.domain.FD;
@Service
public interface FDService {

	FD createfd(int accountId, FD fd, int amount, int roi_id);

	List<FD> getAllFd(int accountId);

	

}
