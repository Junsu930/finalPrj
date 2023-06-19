package edu.kh.fin.band.login.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.login.model.dao.businessDAO;
import edu.kh.fin.band.login.model.vo.Business;




@Service 
public class businessServiceimpl implements businessService {
	
	@Autowired 
	private businessDAO dao;
	
	@Autowired
    private JavaMailSender mailSender;
	
	// 암호화를 위한 bcrypt 객체 의존성 주입(DI)
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	private String fromEmail = "gosrod05@gmail.com";

	//로그인
		@Override
		public Business login(Business inputOwner) {
			
			System.out.println("사업자컨트롤"+ inputOwner);
		
			
			Business loginOwner = dao.login(inputOwner);
			
			System.out.println(loginOwner.getOwnerPw());
			System.out.println(inputOwner.getOwnerPw());
			
			if(loginOwner != null) { // 일치하는 이메일을 가진 회원 정보가 있을 경우
				
				// 입력된 비밀번호(평문) , 조회된 비밀번호(암호화) 비교 (같으면 true)
								 		//평문                  ,   암호화
				if( bcrypt.matches( inputOwner.getOwnerPw()   ,  loginOwner.getOwnerPw() ) ) {
					// 비밀번호가 일치할 경우
					
					loginOwner.setOwnerPw(null); // 비교 끝났으면 비밀번호 지우기
					
				} else { // 비밀번호가 일치하지 않은 경우
					loginOwner = null; // 로그인을 실패한 형태로 바꿔줌
					
				}
			}
			
			
			return loginOwner;
			
		}

		// 이메일 중복 검사
		@Override
		public int emailDupCheck(String ownerEmail) {
			
			return dao.emailDupCheck(ownerEmail);
		}

		// 닉네임 중복 검사
		@Override
		public int nicknameDupCheck(String ownerNickname) {
			
			return dao.nicknameDupCheck(ownerNickname);
		}

		// 사업자 회원가입
		@Override
		public int signUp(Business inputOwner) {
			
			// 비밀번호 암호화(bcrypt)
			String encPw = bcrypt.encode( inputOwner.getOwnerPw() );
					
			// 암호화된 비밀번호로 다시 세팅
			inputOwner.setOwnerPw(encPw);
				
			int result = dao.signUp(inputOwner);
			
			return result;
		}

}
