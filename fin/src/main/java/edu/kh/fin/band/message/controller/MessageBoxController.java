package edu.kh.fin.band.message.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.message.model.service.MessageBoxService;
import edu.kh.fin.band.message.model.vo.MessageBox;

@SessionAttributes({"loginUser"})
@Controller
public class MessageBoxController {
	
	@Autowired
	private MessageBoxService service;
	
	
	/**
	 * 쪽지 리스트 조회
	 * @author lee
	 * @param model
	 * @param loginUser
	 * @return msgList
	 */
	@GetMapping("/msgBoxPage")
	public String messageBoxPageController(@ModelAttribute("loginUser") User loginUser,
			Model model) {
		
		List<MessageBox> msgList = new ArrayList<>();
		
		String receiverNickName = loginUser.getUserNick();
		
		
		
		msgList = service.selectMsgList(receiverNickName);
		
		model.addAttribute("msgList", msgList);
		
		return "msgBox/msgBoxPage";
	}
	
	
	/**
	 * 쪽지보내기
	 * @author lee
	 * @param msgInput
	 * @param loginUser
	 * @return
	 */
	@PostMapping("/sendMsg")
	public String sendMsg(@RequestParam("msgInput") String msgInput,
			@RequestParam("receiverNickName") String receiverNickName,
			@ModelAttribute("loginUser") User loginUser,
			Model model) {
		
		
		// 디비수정 해야함
		MessageBox msg = new MessageBox();
		
		// 보내는 사람의 유저 넘버
		msg.setSendUserNickName(loginUser.getUserNick()); // 보내는 사람 유저 넘버
		msg.setMsgContent(msgInput);
		msg.setReceiverNickName(receiverNickName); // 받는 사람 닉네임 
		
		int result = service.sendMsg(msg);
		
		if(result > 0) {
			  return new Gson().toJson("쪽지 전송 성공!");
		  } else {
			  return new Gson().toJson("쪽지 전송 실패 ㅠㅠ");
		  }
		
	}
	
	
}
