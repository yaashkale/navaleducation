package com.ofss.main.services;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ofss.main.domain.FD;
import com.ofss.main.repository.FDRepository;

@Service
public class FDServiceImp implements FDService {

    @Autowired
    FDRepository fdrepository;

    @Override
    public FD createfd(int accountId, FD fd, int amount, int roi_id) {
        fd.setAccountId(accountId);
        fd.setFdAmount(amount);
        fd.setRoiId(roi_id);
        fd.setAccountType("FD");
        fd.setOpeningDate(new Timestamp(System.currentTimeMillis()));
        return fdrepository.save(fd);  // Save and return the FD object
    }

	@Override
	public List<FD> getAllFd(int accountId) {
		return fdrepository.findAllByAccountId(accountId);
		// TODO Auto-generated method stub
		
	}
}
