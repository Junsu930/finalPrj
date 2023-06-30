package edu.kh.fin.band.login.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.login.model.dao.findPwDAO;
import edu.kh.fin.band.login.model.vo.User;

@Service 
public class findPwServiceImpl implements findPwService{
	
	@Autowired
	private findPwDAO dao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	// 암호화를 위한 bcrypt 객체 의존성 주입(DI)
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public int emailCheck(String userEmail) {
		
		return dao.emailCheck(userEmail);
	}

	@Override
	public int findPw(User inputUser) {
		
		String encPw = bcrypt.encode( inputUser.getUserPw() );
		
		inputUser.setUserPw(encPw);
		
		int result = dao.findPw(inputUser);

		return result;
	}
	
	

}
