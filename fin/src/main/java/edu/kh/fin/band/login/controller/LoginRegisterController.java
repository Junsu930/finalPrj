package edu.kh.fin.band.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginRegisterController {
	
	@GetMapping("/LoginRegister")
	public String roomController() {
		
		return "user/LoginRegister";
		
	}

}