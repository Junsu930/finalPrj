package edu.kh.fin.band.socialLogin.model.service;

import java.util.Map;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.vo.SocialInfo;

public interface SocialLoginService {

	public int checkNaverFl(String email);

	public int naverSignUp(Map<String, Object> map);

	public User getUser(int userNo);

	public int changeToken(Map<String, Object> map);

}
