package edu.kh.fin.band.checkPw.model.service;

import edu.kh.fin.band.login.model.vo.User;

public interface CheckPwService {

	int checkPw(User inputUser, int userNo);

	

}
