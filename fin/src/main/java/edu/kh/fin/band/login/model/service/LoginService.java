package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface LoginService {

	/** 로그인 서비스
	 * @param inputUser
	 * @return loginUser
	 */
	public abstract User login(User inputUser);

	
	
	/** 이메일 중복검사 서비스
	 * @param userEmail
	 * @return result
	 */ 
	public abstract int emailDupCheck(String userEmail);



	/** 닉네임 중복검사 서비스
	 * @param memberNickname
	 * @return result
	 */
	public abstract int nicknameDupCheck(String userNickname);



	/** 회원가입 서비스
	 * @param inputUser
	 * @return result
	 */
	public abstract int signUp(User inputUser);



	/** 이메일 인증 서비스
	 * @param inputEmail
	 * @return result
	 */
	public abstract int checkEmail(String inputEmail);
	
		
	
	

}
