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
	
		
	
	

}
