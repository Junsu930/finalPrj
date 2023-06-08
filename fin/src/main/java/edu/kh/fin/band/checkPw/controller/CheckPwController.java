package edu.kh.fin.band.checkPw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CheckPwController {

	@GetMapping("/checkPw")
	public String checkPwController() {
		
		return "checkPw/checkPw";
	}
}
