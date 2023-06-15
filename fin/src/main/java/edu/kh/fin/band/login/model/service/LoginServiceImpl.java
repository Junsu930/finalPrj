package edu.kh.fin.band.login.model.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.fin.band.login.model.dao.LoginDAO;
import edu.kh.fin.band.login.model.vo.User;

@Service 
public class LoginServiceImpl implements LoginService{
	
	@Autowired 
	private LoginDAO dao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	
	private Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	private String fromEmail = "gosrod05@gmail.com";
	
	@Override
	public User login(User inputUser) {
		
		System.out.println("컨트롤"+ inputUser);
		
		User loginUser = dao.login(inputUser);
		
		
		return loginUser;
		
	}
	
	// 이메일 중복 검사
		@Override
		public int emailDupCheck(String userEmail) {
			return dao.emailDupCheck(userEmail);
		}
		
	// 닉네임 중복 검사
	@Override
	public int nicknameDupCheck(String userNickname) {
		return dao.nicknameDupCheck(userNickname);
	}
	
	//회원가입
	@Override
	public int signUp(User inputUser) {
			
		int result = dao.signUp(inputUser);
		
		return result;
	}
	
	
	@Override
	public int checkEmail(String inputEmail) {
		
		Random random = new Random();
		int ranNum = random.nextInt(888888) + 111111;
		
		int result = 0;
		
		MimeMessage mmsg = mailSender.createMimeMessage();
		
		String toEmail = inputEmail;
		
		
		
		// 문자 인코딩
        String charset = "UTF-8";
		
		String subject = "기타치는 오리 회원가입 인증 이메일";
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
            result = 1;
			
			
		} catch(Exception e) {
			e.printStackTrace();
			result = 0;
		}
		
		
		return result;
	}
	
}
