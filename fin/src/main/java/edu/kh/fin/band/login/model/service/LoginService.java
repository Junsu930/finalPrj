package edu.kh.fin.band.login.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface LoginService {

	/** �α��� ����
	 * @param inputUser
	 * @return loginUser
	 */
	public abstract User login(User inputUser);
		
	
	

}
