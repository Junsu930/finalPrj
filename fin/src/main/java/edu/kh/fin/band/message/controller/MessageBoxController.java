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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		int receiverUserNo = loginUser.getUserNo();
		
		msgList = service.selectMsgList(receiverUserNo);
		
		
		model.addAttribute("msgList", msgList);
		
		return "msgBox/msgBoxPage";
		
		
	}
	
	
	/**
	 * 쪽지 답장컨트롤러
	 * @author lee
	 * @param msgInput
	 * @param loginUser
	 * @return
	 */
	@PostMapping("/replyMsg")
	@ResponseBody
	public String sendMsg(@RequestParam("replyMsgText") String replyMsgText,
			@RequestParam("receiverUserNo") int receiverUserNo,
			@ModelAttribute("loginUser") User loginUser) {
		
		
		// 디비수정 해야함
		MessageBox msg = new MessageBox();
		
		System.out.println("sendMsg controller");
		
		
		// 보내는 사람의 유저 넘버
		msg.setSendUserNo(loginUser.getUserNo()); // 보내는 사람 유저 넘버
		msg.setReceiverUserNo(receiverUserNo); // 받는 사람 닉네임 
		msg.setMsgContent(replyMsgText);
		
		System.out.println("sendMsg controller 보내는ㄴ사람 " + msg.getSendUserNo()); // 로그인되어있는 사람 
		System.out.println("sendMsg controller 받는사람" + msg.getReceiverUserNo()); // 받는 사람 즉 2번
		System.out.println("sendMsg controller내용" + msg.getMsgContent());
		
		int result = service.sendMsg(msg);
		
		if(result > 0) {
			  return new Gson().toJson("쪽지 전송 성공!");
		  } else {
			  return new Gson().toJson("쪽지 전송 실패 ㅠㅠ");
		  }
		
	}
	
	
	/**
	 * 쪽지 삭제 컨트롤러
	 * @author lee
	 * @param msgNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteMsg")
	public String deleteMsg(@RequestParam("msgNo") int msgNo) {
		
		
		
		int result = service.deleteMsg(msgNo);
		
		if(result > 0) {
			  return new Gson().toJson("쪽지 삭제 성공!");
		  } else {
			  return new Gson().toJson("쪽지 삭제 실패 ㅠㅠ");
		  }
		
	}
	
}
