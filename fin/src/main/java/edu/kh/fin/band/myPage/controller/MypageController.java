package edu.kh.fin.band.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("/myPage")
	public String myPageController() {
		
		return "myPage/myPage";
	}
	
	

}
