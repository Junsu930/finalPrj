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
	
	private Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Override
	public User login(User inputUser) {
		
		System.out.println("����"+ inputUser);
		
		User loginUser = dao.login(inputUser);
		
	
		return loginUser;
		
	}
	
	// �̸��� �ߺ� �˻� ���� ����
		@Override
		public int emailDupCheck(String userEmail) {
			return dao.emailDupCheck(userEmail);
		}
		
	// �г��� �ߺ� �˻� ���� ����
	@Override
	public int nicknameDupCheck(String userNickname) {
		return dao.nicknameDupCheck(userNickname);
	}
	
	//ȸ������ ����
	@Override
	public int signUp(User inputUser) {
		
		int result = dao.signUp(inputUser);
		
		return result;
	}

}
