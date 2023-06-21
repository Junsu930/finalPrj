package edu.kh.fin.band.socialLogin.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.dao.SocialLoginDAO;
import edu.kh.fin.band.socialLogin.model.vo.SocialInfo;

@Service
public class SocialLoginServiceImpl implements SocialLoginService {
	
	@Autowired
	private SocialLoginDAO dao;

	@Override
	public int checkNaverFl(String email) {
		return dao.checkNaverFl(email);
	}

	@Override
	public int naverSignUp(Map<String, Object> map) {
		return dao.naverSignUp(map);
	}

	@Override
	public User getUser(int userNo) {
		return dao.getUser(userNo);
	}

	@Override
	public int changeToken(Map<String, Object> map) {
		return dao.changeToken(map);
	}
}
