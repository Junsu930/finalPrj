package edu.kh.fin.main.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionContoriller {

	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		e.printStackTrace();
		
		model.addAttribute("errorMessage", "서비스 이용 중 문제가 발생했습니다.");
		
		model.addAttribute("e", e);
		
		return "common/error";
	}
}
