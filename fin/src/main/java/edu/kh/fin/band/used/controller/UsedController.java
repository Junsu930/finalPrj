package edu.kh.fin.band.used.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UsedController {

	
	@GetMapping("/used")
	public String UsedController() {
		
		return "used/usedMain";
		
		
	}
	
	
		@GetMapping("/usedDetail")
		public String useDetail() {
			
			return "used/usedDetail";
		}
	}

