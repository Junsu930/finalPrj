package edu.kh.fin.band.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

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
	 * 멤버리스트에서 처음으로 메세지 보내는 컨트롤러
	 * @author lee
	 * @param replyMsgText
	 * @param receiverUserNo
	 * @param loginUser
	 * @return result
	 */
	@PostMapping("/sendMsg")
	@ResponseBody
	public String firstMsg(
			@RequestParam("replyMsgText") String replyMsgText,
			@RequestParam("receiverUserNo") int receiverUserNo,
			@ModelAttribute("loginUser") User loginUser) {
		
		int msgNo = 0;
		
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("msgContent", replyMsgText);
		map.put("receiverUserNo", receiverUserNo);
		map.put("sendUserNo", loginUser.getUserNo());
		
		
		msgNo = service.firstSendMsg(map);
		
		// 받은 메세지 넘버 바탕으로 알람 등록
		int result = 0;
		MsgAlarm msgA = new MsgAlarm();
		msgA.setMsgNo(msgNo);
		msgA.setUserNo(receiverUserNo);
		result = service.insertAlarm(msgA); // 멤버리스트에서 처음으로 메세지 보내는 작업 이후 발생된 메세지 넘버를 바탕으로 알람등록 서비스
		
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
		
		int totalResult = 0;
		int dleteAlarmResult = service.deleteAlarm(msgNo); // 쪽지 알람 삭제
		int result = service.deleteMsg(msgNo); // 쪽지 삭제
		
		
		totalResult = dleteAlarmResult + result;
		
		if(totalResult == 2) {
			  return new Gson().toJson("쪽지 삭제 성공!");
		  } else {
			  return new Gson().toJson("쪽지 삭제 실패 ㅠㅠ");
		  }
		
	}
	
}
