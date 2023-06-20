package edu.kh.fin.band.checkPw.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.checkPw.model.DAO.CheckPwDAO;
import edu.kh.fin.band.login.model.vo.User;

@Service 
public class CheckServiceimpl implements CheckPwService{
	
	@Autowired 
	private CheckPwDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public int checkPw(User inputUser, int userNo) {
		
		String encPw = dao.selectEncPw(userNo);
		
		
		if( bcrypt.matches(inputUser.getUserPw(), encPw)) {
			
			return 1;
			
		} else {
			
			return 0;
		}
		

	}

	
	
}
