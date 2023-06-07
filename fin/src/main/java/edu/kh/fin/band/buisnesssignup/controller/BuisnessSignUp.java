package edu.kh.fin.band.buisnesssignup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BuisnessSignUp {
		
		@GetMapping("/buisnessSignUp")
		public String roomController() {
			
			return "user/buisnessSignUp";
			
		}

	}