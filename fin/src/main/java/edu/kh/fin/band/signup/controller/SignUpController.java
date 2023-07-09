package edu.kh.fin.band.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {
	
	@GetMapping("/signUp")
	public String roomController() {
		
		return "user/signUp";
		
	}

}