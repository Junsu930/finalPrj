package edu.kh.fin.band.checkPw.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.checkPw.model.service.CheckPwService;
import edu.kh.fin.band.login.model.vo.User;

@Controller
@SessionAttributes({"loginUser"})
public class CheckPwController {
	
	@Autowired
	private CheckPwService service;

	@GetMapping("/checkPw")
	public String checkPwController(@ModelAttribute("loginUser") User loginUser) {
		
		String path = null;
		
		if(loginUser.getUserType().equals("NORMAL")) {
			
			path = "checkPw/checkPw";
		} else {
			
			path = "redirect:/myPage";
		}
		
		return path;
	}
	
	@PostMapping("fin/checkPw")
	public String checkPw(@ModelAttribute("loginUser") User loginUser
							, Model model
							, @ModelAttribute User inputUser
							,@RequestParam Map<String, Object> paramMap
							, RedirectAttributes ra
							, HttpServletResponse resp 
							, HttpServletRequest req) {
		
		
		
		
		int result = service.checkPw(inputUser, loginUser.getUserNo());
		
		String message = null;
		String path = null;
		
		if(result > 0) {
			message = "";
			path = "/myPage";
		} else {
			message = "비밀번호가 일치하지 않습니다.";
			path = "/checkPw";
		}
		
		ra.addFlashAttribute("msg", message);
		
		return "redirect:" + path;
		
	}
}
