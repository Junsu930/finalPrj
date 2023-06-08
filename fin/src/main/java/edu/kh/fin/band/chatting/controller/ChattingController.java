package edu.kh.fin.band.chatting.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChattingController {
	
	@RequestMapping("/chat")
	public ModelAndView chat(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting/chatting");
		
		
		return mv;
	}
	
	
}
