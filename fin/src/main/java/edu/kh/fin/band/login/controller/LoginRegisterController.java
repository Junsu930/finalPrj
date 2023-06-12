package edu.kh.fin.band.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		System.out.println("컨트롤" +inputUser);
		
		logger.info("로그인 수행");
		
		User loginUser = service.login(inputUser);
		
		System.out.println("컨트롤2"+ loginUser);
		
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
	
	// 로그아웃
		@GetMapping("/logout")
		public String logout( /*HttpSession session,*/
							SessionStatus status) {
			
			// 로그아웃 == 세션을 없애는 것
			
			// * @SessionAttributes을 이용해서 session scope에 배치된 데이터는
			//   SessionStatus라는 별도 객체를 이용해야만 없앨 수 있다.
			logger.info("로그아웃 수행됨");
			
			// session.invalidate(); // 기존 세션 무효화 방식으로는 안된다!
			
			status.setComplete(); // 세센이 할 일이 완료됨 -> 없앰
			
			return "redirect:/"; // 메인페이지 리다이렉트
			
		}
		
		
	//이메일 중복 검사
	@GetMapping("/emailDupCheck")
	public int emailDupCheck(String userEmail) {
		
		int result = service.emailDupCheck(userEmail);
		
		return result;
	}
		
	

}