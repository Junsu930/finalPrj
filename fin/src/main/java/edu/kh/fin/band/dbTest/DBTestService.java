package edu.kh.fin.band.dbTest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DBTestService {

	@Autowired
	DBTestDAO dao;
	
	public DBTestVO dbTest(int userNo) {
		
		return dao.dbTest(userNo);
	}

	public int leaderCheck(int loginUserNo) {
		return dao.leaderCheck(loginUserNo);
	}

	public int inBandCheck(int userNo) {
		return dao.inBandCheck(userNo);
	}

}
