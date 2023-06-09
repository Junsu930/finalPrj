package edu.kh.fin.band.login.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.login.model.dao.LoginDAO;
import edu.kh.fin.band.login.model.vo.User;

@Service 
public class LoginServiceImpl implements LoginService{
	
	@Autowired 
	private LoginDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	private Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Override
	public User login(User inputUser) {
		
		// 평문과 암호화 비번이 일치 하는지 확인
		logger.debug( inputUser.getUserPw() + " / " +  bcrypt.encode(inputUser.getUserPw()) );
		
		User loginUser = dao.login(inputUser);
		
		if(loginUser !=null) { // 이메일이 일치
			
			// 비밀번호가 일치
			if( bcrypt.matches(  inputUser.getUserPw()   ,  loginUser.getUserPw() ) ) {
				
				// 비교후 삭제
				loginUser.setUserPw(null);
				
			} else { // 비밀번호 불일치
				
			}
		}
		
		
		return loginUser;
		
	}

}
