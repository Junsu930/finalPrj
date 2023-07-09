package edu.kh.fin.band.socialLogin.model.service;

import java.util.HashMap;
import java.util.Map;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.vo.SocialInfo;

public interface SocialLoginService {

	public int checkNaverFl(String email);

	public int naverSignUp(Map<String, Object> map);

	public User getUser(int userNo);

	public int changeToken(Map<String, Object> map);

	/**
	 * 카카오 인증 코드 가져오기 서비스
	 * @author lee
	 * @param code
	 * @return
	 */
	public String getToken(String code);

	/**
	 * 카카오 인증 코드를 바탕으로 액세스 토큰 가져오기 서비스
	 * @author lee
	 * @param accessToken
	 * @return
	 */
	public HashMap<String, Object> getUserInfo(String accessToken);

	/**
	 * kakaoSignUp + 액세스 토큰을 바탕으로 카카오 유저 정보를 가져와서 + 정보 디비 저장 + 유저넘버 가져오기 + 기존 회원이면 토큰 교체 서비스
	 * @author lee
	 * @param getUserInfoMap
	 * @return
	 */
	public int kakaoSignUp(HashMap<String, Object> getUserInfoMap);

	public int emailCheckForNaver(String email);

	public int nickCheckForNaver(String nick);



}
