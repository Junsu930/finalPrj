package edu.kh.fin.band.socialLogin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.service.SocialLoginService;

@Controller
@SessionAttributes({"loginUser"})
public class SocialLoginController {
	
	@Autowired
	private SocialLoginService service;
	
	private Logger logger = LoggerFactory.getLogger(SocialLoginController.class);

	/** 가입여부 체크
	 * @param email
	 * @return
	 */
	@PostMapping("/checkNaverFl")
	@ResponseBody
	public int checkNaverFl(@RequestParam("email") String email) {
		

		int result = service.checkNaverFl(email);
		logger.info("체크 실행");
		return result;
		
	}
	
	@PostMapping("/naverSignUp")
	@ResponseBody
	public int naverSignUp(@RequestParam Map<String,Object> map, Model model) {
		
		int result = service.naverSignUp(map);
		
		logger.info("만들어진 유저넘 : " + result);
		
		User user = service.getUser(result);

		model.addAttribute("loginUser", user);
		logger.info("사인업실행");
		
		return result;
	}
	
	@PostMapping("/changeToken")
	@ResponseBody
	public int changeToken(@RequestParam Map<String,Object> map, Model model) {
		
		int result =service.changeToken(map);
		User user = null;
		if(result>0) {
			user = service.getUser((Integer)map.get("userNo"));
		}
		logger.info("토큰교체 실행");
		model.addAttribute("loginUser", user);
		
		return result;
	}
	
	@GetMapping("/callback")
	public String callback() {
		return "social/callback";
	}
	
	@PostMapping("/dupCheckForNaver")
	@ResponseBody
	public int dupCheckForNaver(@RequestParam("email") String email, @RequestParam("nick")String nick) {
		
		int result = -1;
		
		int emailCheck = service.emailCheckForNaver(email);
		
		if(emailCheck > 0) {
			// 네이버 가입이 아닌 메일 중복이 있으면
			result = 1;
		}else {
			// 메일 중복이 없으면 닉네임 중복 확인
			
			int nickCheck = service.nickCheckForNaver(nick);
			
			if(nickCheck > 0) {
				// 닉 중복이 있으면 
				result = 2;
			}else {
				// 이메일과 닉 중복 모두 없으면
				result = 0;
			}
		}
		
		logger.info("결과값" + result);
		
		return result;
	}
	
	/**
	 * 카카오 인증코드, 토큰, 
	 * kakaoSignUp + 액세스 토큰을 바탕으로 카카오 유저 정보를 가져와서 + 일반 회원과 중복 체크 + 정보 디비 저장 + 유저넘버 가져오기 + 기존 회원이면 토큰 교체 Controller
	 * @author lee
	 * @param code
	 * @param session
	 * @param model
	 * @param ra
	 * @return loginUser
	 */
	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session, 
			Model model , 
			RedirectAttributes ra ) {
		HashMap<String, Object> getUserInfoMap = new HashMap<>();
		
		String accessToken = service.getToken(code);

		
		getUserInfoMap = service.getUserInfo(accessToken);
		
//	    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (getUserInfoMap.get("email") != null) {
	    	
	    	// 유저넘버를 미리 발생시키서 가져오기
	    	int resultUserNo = service.kakaoSignUp(getUserInfoMap);
	    	// 만약 중복이 발생해서 resultUserNo 리턴이 -1이면
	    	
	    	if(resultUserNo != -1) {
	    		// 기본 회원가입과 중복이 아닌 회원
	    		// 세션에 등록할 카카오 유저 정보를 가져와서 유저 객체에 넣기
		    	User user = service.getUser(resultUserNo);
		    	model.addAttribute("loginUser", user);
		        ra.addFlashAttribute("msgKakao", "카카오 회원님 환영합니다!");
	    	}else {
	    		ra.addFlashAttribute("msgKakao", "아이디 또는 닉네임이 중복된 회원입니다!");
	    	}
	    }
		return "redirect:main";
	}
	
}
