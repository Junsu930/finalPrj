package edu.kh.fin.band.chatting.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ModelAndViewMethodReturnValueHandler;

import com.google.gson.Gson;

import edu.kh.fin.band.chatting.model.service.ChatService;
import edu.kh.fin.band.chatting.model.service.TempUserService;
import edu.kh.fin.band.chatting.model.vo.ChatVo;
import edu.kh.fin.band.chatting.model.vo.TempUserVo;

@Controller
@SessionAttributes({"tempUser", "chatRoomList"})
public class ChattingController {
	
	List<ChatVo> roomList = new ArrayList<ChatVo>();
	static int roomNumber = 0;
	
	@Autowired
	TempUserService tempService;
	
	@Autowired
	ChatService service;
	
	
	
	/** 채팅방 이동 컨트롤러
	 * @return
	 */
	@RequestMapping("/chatRoom")
	public ModelAndView room() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatting/chatRoomList");
		return mv;
	}
	
	
	/** 채팅방 생성 로직
	 * @param params
	 * @return
	 */
	@RequestMapping("/createRoom")
	@ResponseBody
	public List<ChatVo> createRoom(@RequestParam HashMap<Object, Object> params){
		System.out.println(params);
		String roomName = (String)params.get("roomName"); // 1_2 , 2_3 이런 형태
		if(roomName != null && !roomName.trim().equals("")){
			ChatVo chatRoom = new ChatVo();
			chatRoom.setChatRoomNo(roomName);
			chatRoom.setChatTitle(roomName + "번채팅방");
			roomList.add(chatRoom);
			
		}
		return roomList;
	}

	/*
	@RequestMapping("/moveChatting")
	public ModelAndView chatting(@RequestParam HashMap<Object, Object> params) {
		ModelAndView mv =  new ModelAndView();
		
		String roomNumber = (String)params.get("roomNumber");
		

		mv.setViewName("chatting/chatting");
	
		
		return mv;
	
	}
	*/
	
	@RequestMapping("/checkRoom")
	@ResponseBody
	public String checkRoom(@RequestParam(value="userNo", required=false) int userNo){

		
		roomList = service.onChatRoom(userNo);
		
		
		return new Gson().toJson(roomList);
		
	}
	
	
	
	
	
	// 임시로 유저 정보 세션에 담는 로직
	@PostMapping("/tempUserSession")
	public String tempUser(@RequestParam int nowUser, Model model) {
		
		System.out.println(nowUser);
		
		TempUserVo tempUser = tempService.tempUser(nowUser);
		
		System.out.println(tempUser);
		
		List<ChatVo> onChatRoom = new ArrayList<ChatVo>();
		
		onChatRoom = service.onChatRoom(nowUser);
		
		
		model.addAttribute("tempUser",tempUser);
		
		model.addAttribute("chatRoomList", onChatRoom);
				
		
		return "room/roomMain";
	}
	
	
}
