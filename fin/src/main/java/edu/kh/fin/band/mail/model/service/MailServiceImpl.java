package edu.kh.fin.band.mail.model.service;

import java.util.HashMap;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{
	
	@Autowired
    private JavaMailSender mailSender;
	
	
	
	
	private String toEmail = "gosrod05@gmail.com"; // 받는 사람 이메일
	 

	@Override
	public int sendEmail(HashMap<String, String> map) {
		
		int result = 0;
		try {
			
			String subject = map.get("subject");
			String fromName = map.get("fromName");
			String fromEmail = map.get("fromAddress");
			String mailContent = map.get("mailContent");
			
			
			
			MimeMessage mmsg = mailSender.createMimeMessage();
			
			// 문자 인코딩
            String charset = "UTF-8";
			
			
            // 송신자 (보내는 사람)
            mmsg.setFrom(new InternetAddress(fromEmail, fromName));
            
            // 수신자 (받는 사람)
            mmsg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            
            // 메일 제목 
            mmsg.setSubject(subject, charset);
            // 메일 내용
            mmsg.setText(mailContent,charset, "html" ); // html 추가시 html 해석 됨
            
           
           
            // 메일 보내기
            mailSender.send(mmsg);
            result = 1;
            
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		return result;
		
	}

}
