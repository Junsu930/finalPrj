package edu.kh.fin.band.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.service.businessService;
import edu.kh.fin.band.login.model.vo.Business;
import edu.kh.fin.band.login.model.vo.User;


@Controller

@SessionAttributes({"loginOwner"})
public class businessRegiController {
	
	private Logger logger = LoggerFactory.getLogger(businessRegiController.class);
	
	@Autowired 
	private businessService service;
	
	@GetMapping("businessRegi")
	public String busRegiController() {
		
		return "user/businessRegi";
		
	}
	
	
	@PostMapping("fin/businessLogin")
	public String login(@ModelAttribute Business inputOwner
						, Model model
						, RedirectAttributes ra
						, HttpServletResponse resp 
						, HttpServletRequest req
						, @RequestParam(value="saveId", required = false) String saveId ) {
		
		logger.info("로그인 수행됨");
		
		Business loginOwner = service.login(inputOwner);
		
		String message = null;
		String path = null;
		
		if(loginOwner !=null) { // 로그인 성공시
			model.addAttribute("loginOwner", loginOwner);

			System.out.println("사업자 로그인 시작" +loginOwner.getOwnerNo());
			
			//쿠키 생성
			Cookie cookie = new Cookie("saveId", loginOwner.getOwnerEmail());
			
			if(saveId !=null) { // 아이디 저장 체크시
				
				cookie.setMaxAge(60 * 60 * 24 * 365); // 1년
				
			} else { // 체크 안했을시
				cookie.setMaxAge(0); // 0초 == 삭제
			}
			
			// 쿠키 경로 지정
			cookie.setPath(req.getContextPath());
			
			// 쿠키를 클라이언트에 전달
			resp.addCookie(cookie);
			
			path = "redirect:/main";
			
		} else { //실패 
			
			ra.addFlashAttribute("msg", "이메일또는 비밀번호가 틀립니다");
			path = "redirect:/businessRegi";
			
		}
		
		return path;
		
	}
	
	//이메일 중복 검사
		@ResponseBody
		@GetMapping("/ownerEmailDupCheck")
		public int emailDupCheck(String ownerEmail) {
			
			logger.info("이메일 중복검사 수행됨");
			
			int result = service.emailDupCheck(ownerEmail);
			
			return result;
		}
		
		// 닉네임 중복 검사
		@ResponseBody  
		@GetMapping("/ownerNicknameDupCheck")
		public int nicknameDupCheck(String ownerNickname) {
			
			logger.info("닉네임 중복 검사 수행됨");
			
			int result = service.nicknameDupCheck(ownerNickname);
			System.out.println(result);
				
			return result;
			
				
			}
		
		//회원가입
		@PostMapping("fin/businessSignUp")
		public String signUp(Business inputOwner
							, Model model
							, RedirectAttributes ra
							, HttpServletResponse resp 
							, HttpServletRequest req) {
			
			logger.info("회원가입 수행됨");
			
			System.out.println("사업자 회원가입 정보" +inputOwner);
			
			int result = service.signUp(inputOwner);
			
			System.out.println(inputOwner);
			
			String message = null;
			String path = null;
			
			if(result > 0) {
				message = "회원가입 완료 로그인을 해주세요";
				path = "redirect:/businessRegi";
				
			}else { 
				message = "회원가입 실패";
				path = "redirect:/businessRegi"; 
			}
			
			ra.addFlashAttribute("msg", message);
			return path;
		
			
		}

}
