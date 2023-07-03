package edu.kh.fin.band.chatting.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import edu.kh.fin.band.chatting.model.service.ChatService;
import edu.kh.fin.band.chatting.model.service.TempUserService;
import edu.kh.fin.band.chatting.model.vo.ChatMessageVo;
import edu.kh.fin.band.chatting.model.vo.ChatVo;
import edu.kh.fin.band.chatting.model.vo.TempUserVo;
import edu.kh.fin.band.login.model.vo.User;

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
	
	@PostMapping("/loadMessage")
	@ResponseBody
	public String loadMessage(@RequestParam(value="chatRoomNo", required=false) String chatRoomNo, HttpServletRequest req) {
		
		List<ChatMessageVo> chatList = new ArrayList<>();
		
		
		HttpSession session = req.getSession();
		
		int loginUserNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		Map<String, Object> cMap = new HashMap<>();
		
		cMap.put("chatRoomNo", chatRoomNo);
		
		cMap.put("loginUserNo", loginUserNo);
		
		chatList = service.loadMessage(cMap);
		
	
		
		return new Gson().toJson(chatList);
				
	}
	
	
	@PostMapping("/deleteChatRoom")
	@ResponseBody
	public int deleteChatRoom(@RequestParam("chatRoomNo") String chatRoomNo) {	
		
		return service.deleteChatRoom(chatRoomNo); 
	}
	
	
	// 임시로 유저 정보 세션에 담는 로직
	@PostMapping("/tempUserSession")
	public String tempUser(@RequestParam int nowUser, Model model) {
		
		
		TempUserVo tempUser = tempService.tempUser(nowUser);
		
		
		List<ChatVo> onChatRoom = new ArrayList<ChatVo>();
		
		onChatRoom = service.onChatRoom(nowUser);
		
		
		model.addAttribute("tempUser",tempUser);
		
		model.addAttribute("chatRoomList", onChatRoom);
				
		
		return "main";
	}
	
	@PostMapping("/chatStart")
	@ResponseBody
	public int chatStart(@RequestParam("withUser") int withUser, @RequestParam("userNo") int userNo, 
			@RequestParam("userName") String userName) {
		
		String roomNo = userNo + "_" + withUser;
		String roomNoSub = withUser +  "_" + userNo;
	   
		String withUserName = service.withUserName(withUser);
		
		String roomTitle = userName + "&" + withUserName +"의 채팅방";
		
		
		Map<String, Object> roomNoMap = new HashMap<>();
		
		roomNoMap.put("roomNo", roomNo);
		roomNoMap.put("roomNoSub", roomNoSub);
		roomNoMap.put("userNo", userNo);
		roomNoMap.put("withUser", withUser);
		roomNoMap.put("userName", userName);
		roomNoMap.put("roomTitle", roomTitle);
		
		
		int check = service.dupCheck(roomNoMap);
		
		// 이미 방이 존재
		if(check > 0) {
			return 0;
		}else {
			int result = service.chatStart(roomNoMap);
			if(result>0) {
				// 성공한 경우
				return 1;
			}else {
				// 중복방은 없는데 실패한 경우
				return -1;
			}
		}
		
	}
	
	/** 방번호로 상대 닉 알아내기
	 * @param chatRoomNo
	 * @return
	 */
	@RequestMapping(value="/withUserName", produces = "application/text; charset=utf8")
	@ResponseBody
	public String withUserName(@RequestParam("chatRoomNo") String chatRoomNo) {

		return service.withUserName(chatRoomNo);
	}
	
	@PostMapping("/chattingCheckImg")
	@ResponseBody
	public String chattingCheckImg(@RequestParam("userNo") int userNo) {
		
		return service.chattingCheckImg(userNo);
		
		
	}
	
	// 임시 코드 새로운 채팅방 가기
	@GetMapping("/newChat")
	public String newChat() {
		
		
		return "chatting/newChatRoom";
				
				
	}
	
	@PostMapping("/chatExit")
	@ResponseBody
	public int chatExit(@RequestParam Map<String, Object> chatMap) {
		
		int result = service.chatExit(chatMap);
		
		return result;
	}
	
	
	
	
	
	
}
