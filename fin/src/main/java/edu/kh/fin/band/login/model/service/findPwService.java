package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface findPwService {

	/** 이메일 검사
	 * @param userEmail
	 * @return
	 */
	int emailCheck(String userEmail);

	/** 비밀번호 변경
	 * @param inputUser
	 * @return
	 */
	int findPw(User inputUser);

	int checkEmail(String inputEmail);

}
