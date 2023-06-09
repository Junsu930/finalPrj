package edu.kh.fin.band.chatting.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.fin.band.chatting.model.service.ChatService;
import edu.kh.fin.band.chatting.model.service.TempUserService;
import edu.kh.fin.band.chatting.model.vo.ChatVo;
import edu.kh.fin.band.chatting.model.vo.TempUserVo;

@Controller
@SessionAttributes({"tempUser", "chatRoomList"})
public class ChattingController {
	
	@Autowired
	TempUserService tempService;
	
	@Autowired
	ChatService service;
	
	@RequestMapping("/chat")
	public ModelAndView chat(Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting/chatting");
		
		
		return mv;
	}
	
	@PostMapping("/tempUserSession")
	public String tempUser(@RequestParam int nowUser, Model model) {
		
		
		TempUserVo tempUser = tempService.tempUser(nowUser);

		List<ChatVo> onChatRoom = new ArrayList<ChatVo>();
		
		onChatRoom = service.onChatRoom(nowUser);
		
		
		model.addAttribute("tempUser",tempUser);
		
		model.addAttribute("chatRoomList", onChatRoom);
				
		return "room/roomMain";
	}
	
	
	
}
