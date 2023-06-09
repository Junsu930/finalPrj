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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.service.LoginService;
import edu.kh.fin.band.login.model.vo.User;

@Controller
@RequestMapping("/login")
public class LoginRegisterController {
	
	private Logger logger = LoggerFactory.getLogger(LoginRegisterController.class);
	
	@Autowired 
	private LoginService service;
	
	
	@GetMapping("/login")
	public String loginController() {
		
		return "user/LoginRegister";
		
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute User inputUser
						, Model model
						, RedirectAttributes ra
						, HttpServletResponse resp 
						, HttpServletRequest req
						, @RequestParam(value="saveId", required = false) String saveId ) {
		
		logger.info("로그인 수행");
		
		User loginUser = service.login(inputUser);
		
		if(loginUser !=null) { // 로그인 성공시
			model.addAttribute("loginUser", loginUser);
			
			//쿠키 생성
			Cookie cookie = new Cookie("saveId", loginUser.getUserEmail());
			
			if(saveId !=null) { // 아이디 저장 체크시
				
				cookie.setMaxAge(60 * 60 * 24 * 365); // 1년
				
			} else { // 체크 안할 시
				cookie.setMaxAge(0); // 쿠키 삭제
			}
			
			// 쿠키 적용 경로 지정
			cookie.setPath(req.getContextPath());
			
			// 쿠키를 응답 시 클라이언트에게 전달
			resp.addCookie(cookie);
			
			
		} else { //로그인 실패 
			
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 틀림");
			
		}
		
		
		return"redirect:/";
		
	}

}