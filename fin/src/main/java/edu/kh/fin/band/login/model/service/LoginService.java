package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface LoginService {

	/** 로그인 서비스
	 * @param inputUser
	 * @return loginUser
	 */
	public abstract User login(User inputUser);

	
	
	/** 이메일 중복 검사 서비스
	 * @param userEmail
	 * @return result
	 */ 
	public abstract int emailDupCheck(String userEmail);
	
		
	
	

}
