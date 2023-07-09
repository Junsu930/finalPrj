package edu.kh.fin.band.mail.model.service;

import java.util.HashMap;


/** 
 * 문의 메일 보내기 서비스
 * @author lee
 */
public interface MailService {
	

	public int sendEmail(HashMap<String, String> map);

}
