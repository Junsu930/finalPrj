package edu.kh.fin.band.login.model.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.login.model.dao.findPwDAO;
import edu.kh.fin.band.login.model.vo.User;

@Service 
public class findPwServiceImpl implements findPwService{
	
	@Autowired
	private findPwDAO dao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	private String fromEmail = "gosrod05@gmail.com";
	
	// 암호화를 위한 bcrypt 객체 의존성 주입(DI)
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public int emailCheck(String userEmail) {
		
		return dao.emailCheck(userEmail);
	}

	@Override
	public int findPw(User inputUser) {
		
		String encPw = bcrypt.encode( inputUser.getUserPw() );
		
		inputUser.setUserPw(encPw);
		
		int result = dao.findPw(inputUser);

		return result;
	}

	@Override
	public int checkEmail(String inputEmail) {
		Random random = new Random();
		int ranNum = random.nextInt(888888) + 111111;
		
		
		
		MimeMessage mmsg = mailSender.createMimeMessage();
		
		String toEmail = inputEmail;
		
		
		
		// 문자 인코딩
        String charset = "UTF-8";
		
		String subject = "기타치는 오리 비밀번호 변경 이메일";
		String mailContent = "인증번호 : " + ranNum;
		
		try {
			
			
			// 송신자 (보내는 사람)
            mmsg.setFrom(new InternetAddress(fromEmail));
            
            // 수신자 (받는 사람)
            mmsg.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            
            // 메일 제목 
            mmsg.setSubject(subject, charset);
            // 메일 내용
            mmsg.setText(mailContent,charset, "html" ); // html 추가시 html 해석 됨
            
            
            mailSender.send(mmsg);
            
			
			
		} catch(Exception e) {
			e.printStackTrace();
			ranNum  = 0;
		}
		
		
		return ranNum;
	}
	
	

}
