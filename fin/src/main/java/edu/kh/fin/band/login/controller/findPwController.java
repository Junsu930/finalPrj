package edu.kh.fin.band.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.service.findPwService;
import edu.kh.fin.band.login.model.vo.User;

@Controller

@SessionAttributes({"loginUser"})
public class findPwController {
	
	@Autowired 
	private findPwService service;
	
	@GetMapping("/findPw")
	public String PwController() {
		
		
		return "user/findPw";
		
	}
	
		//이메일 검사
		@ResponseBody
		@GetMapping("/emailCheck")
		public int emailCheck(String userEmail) {
			

			
			int result = service.emailCheck(userEmail);
			
			return result;
		}
		
		@PostMapping("fin/findPassword")
		public String findPw( User inputUser
							, Model model
							, RedirectAttributes ra
							, HttpServletResponse resp 
							, HttpServletRequest req) {
			
			System.out.println("비밀번호 변경" +inputUser);
			
			int result = service.findPw(inputUser);
			
			String message = null;
			String path = null;
			
			if(result > 0) {
				message = "비밀번호 변경 완료 로그인을 해주세요";
				path = "redirect:/login";
				
			}else { 
				message = "변경실패 실패";
				path = "redirect:/findPw"; 
			}
			
			ra.addFlashAttribute("msg", message);
			return path;
				
			
		}

}
