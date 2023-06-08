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

}
