package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.Business;

public interface businessService {

	
	/** 사업자 로그인 서비스
	 * @param inputOwner
	 * @return
	 */
	public abstract Business login(Business inputOwner);
 
	 
	/** 사업자 이메일 체크
	 * @param ownerEmail
	 * @return
	 */
	public abstract int emailDupCheck(String ownerEmail);

	/** 사업자 비밀번호 체크
	 * @param ownerNickname
	 * @return
	 */
	public abstract int nicknameDupCheck(String ownerNickname);


	/** 사업자 회원 가입
	 * @param inputOwner
	 * @return
	 */
	public abstract int signUp(Business inputOwner);

}
