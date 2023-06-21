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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.login.model.service.LoginService;
import edu.kh.fin.band.login.model.vo.User;

@Controller

@SessionAttributes({"loginUser"})
public class LoginRegisterController {
	
	private Logger logger = LoggerFactory.getLogger(LoginRegisterController.class);
	
	@Autowired 
	private LoginService service;
	
	
	@GetMapping("/login")
	public String loginController() {
		
		return "user/LoginRegister";
		
	}
	
	@PostMapping("fin/login")
	public String login(@ModelAttribute User inputUser
						, Model model
						, RedirectAttributes ra
						, HttpServletResponse resp 
						, HttpServletRequest req
						, @RequestParam(value="saveId", required = false) String saveId ) {
		
		logger.info("로그인 수행됨");
		
		User loginUser = service.login(inputUser);
		
		String message = null;
		String path = null;
		
		if(loginUser !=null) { // 로그인 성공시
			model.addAttribute("loginUser", loginUser);

			System.out.println("로그인 성공" + loginUser.getUserNo());
			
			//쿠키 생성
			Cookie cookie = new Cookie("saveId", loginUser.getUserEmail());
			
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
			path = "redirect:/login";
			
		}
		
		return path;
		
	}
	
	//  로그아웃
		@GetMapping("/logout")
		public String logout( /*HttpSession session,*/
							SessionStatus status) {
			
			
			logger.info("로그아웃 수행됨");
			
			
			
			status.setComplete(); 
			
			return "redirect:/main"; 
			
		}
		
		
	//이메일 중복 검사
	@ResponseBody
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(String userEmail) {
		
		logger.info("이메일 중복검사 수행됨");
		
		int result = service.emailDupCheck(userEmail);
		
		return result;
	}
	
	// 닉네임 중복 검사
	@ResponseBody  
	@GetMapping("/nicknameDupCheck")
	public int nicknameDupCheck(String userNickname) {
		
		logger.info("닉네임 중복 검사 수행됨");
		
		int result = service.nicknameDupCheck(userNickname);
		System.out.println(result);
			
		return result;
		
			
		}
	
	//회원가입
	@PostMapping("fin/signUp")
	public String signUp( User inputUser
						, Model model
						, RedirectAttributes ra
						, HttpServletResponse resp 
						, HttpServletRequest req) {
		
		logger.info("회원가입 수행됨");
		
		System.out.println(inputUser);
		
		int result = service.signUp(inputUser);
		
		System.out.println(inputUser);
		
		String message = null;
		String path = null;
		
		if(result > 0) {
			message = "회원가입 완료 로그인을 해주세요";
			path = "redirect:/login";
			
		}else { 
			message = "회원가입 실패";
			path = "redirect:/login"; 
		}
		
		ra.addFlashAttribute("msg", message);
		return path;
	
		
	}
	
	
	//이메일 인증
	@ResponseBody
	@GetMapping("/checkEmail")
	public String checkEmail(@RequestParam String inputEmail) {
		
		logger.info("이메일 인증 수행됨");
			
		System.out.println(inputEmail);
		int ranNum = service.checkEmail(inputEmail);
		
		System.out.println(ranNum);
		
		if(ranNum > 0) {
			  return new Gson().toJson(ranNum);
		  } else {
			  return new Gson().toJson("메일 전송 실패");
		  }
			
	}
	
	
	
	
	
	
	
	
	
		
	

}