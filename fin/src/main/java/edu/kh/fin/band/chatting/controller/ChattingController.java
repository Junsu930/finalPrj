package edu.kh.fin.band.chatting.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

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
		
		String strIpAddress = "";

		try {
			InetAddress inetAddress = InetAddress.getLocalHost();
			strIpAddress = inetAddress.getHostAddress();
			
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		model.addAttribute("ipAddr", strIpAddress);
		
		
		return mv;
	}
	
	
}
