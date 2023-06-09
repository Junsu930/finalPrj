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
		
		// �򹮰� ��ȣȭ ����� ��ġ �ϴ��� Ȯ��
		logger.debug( inputUser.getUserPw() + " / " +  bcrypt.encode(inputUser.getUserPw()) );
		
		User loginUser = dao.login(inputUser);
		
		if(loginUser !=null) { // �̸����� ��ġ
			
			// ��й�ȣ�� ��ġ
			if( bcrypt.matches(  inputUser.getUserPw()   ,  loginUser.getUserPw() ) ) {
				
				// ���� ����
				loginUser.setUserPw(null);
				
			} else { // ��й�ȣ ����ġ
				
			}
		}
		
		
		return loginUser;
		
	}

}
