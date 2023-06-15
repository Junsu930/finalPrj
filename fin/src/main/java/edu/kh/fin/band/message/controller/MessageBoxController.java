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
		
		int userNo = loginUser.getUserNo();
		
		msgList = service.selectMsgList(userNo);
		
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
	public int sendMsg(@RequestParam("msgInput") String msgInput,
			@ModelAttribute("loginUser") User loginUser,
			Model model) {
		
		//받는사람의 정보를 어떻게 가져와야할까....
		
		MessageBox msg = new MessageBox();
		
		// 보내는 사람의 유저 넘버
		msg.setSendUserNo(loginUser.getUserNo());
		msg.setMsgContent(msgInput);
		
		int result = service.sendMsg(msg);
		
		
		
		return result;
	}
	
	
}
