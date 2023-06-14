package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface LoginService {

	/** �α��� ����
	 * @param inputUser
	 * @return loginUser
	 */
	public abstract User login(User inputUser);

	
	
	/** �̸��� �ߺ� �˻� ����
	 * @param userEmail
	 * @return result
	 */ 
	public abstract int emailDupCheck(String userEmail);



	/** �г��� �ߺ� �˻� ����
	 * @param memberNickname
	 * @return result
	 */
	public abstract int nicknameDupCheck(String userNickname);



	/** ȸ������ ����
	 * @param inputUser
	 * @return result
	 */
	public abstract int signUp(User inputUser);
	
		
	
	

}
