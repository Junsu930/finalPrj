package edu.kh.fin.band.socialLogin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.service.SocialLoginService;

@Controller
@SessionAttributes({"loginUser"})
public class SocialLoginController {
	
	@Autowired
	private SocialLoginService service;

	/** 가입여부 체크
	 * @param email
	 * @return
	 */
	@PostMapping("/checkNaverFl")
	@ResponseBody
	public int checkNaverFl(@RequestParam("email") String email) {
		

		int result = service.checkNaverFl(email);
		
		System.out.println("체크 실행");
		return result;
		
	}
	
	@PostMapping("/naverSignUp")
	@ResponseBody
	public int naverSignUp(@RequestParam Map<String,Object> map, Model model) {
		
		int result = service.naverSignUp(map);
		
		System.out.println("만들어진 유저넘 : " + result);
		
		User user = service.getUser(result);

		model.addAttribute("loginUser", user);
		System.out.println("사인업실행");
		
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
		System.out.println("토큰교체 실행");
		model.addAttribute("loginUser", user);
		
		return result;
	}
	
	@GetMapping("/callback")
	public String callback() {
		return "social/callback";
	}
	
}
