package edu.kh.fin.band.msgAlarm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.msgAlarm.model.service.MsgAlarmService;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;


@Controller
@SessionAttributes({"loginUser"})
public class MsgAlarmController {
	
	@Autowired
	private MsgAlarmService service;
	
	/**
	 * 알람을 가져오기 위해서 loginMemberNo 가져오는 컨트롤
	 * @author lee
	 * @param loginUser
	 * @return userNo
	 */
	@GetMapping("/getUserNo")
	@ResponseBody
	public String getUserNo(@ModelAttribute("loginUser") User loginUser) {
		
		int userNo = loginUser.getUserNo();
		
		System.out.println(userNo);
		
		return new Gson().toJson(userNo);
	}
	
	
	
	/**
	 * 쪽지 알람 갯수 가져오는 컨트롤러
	 * @author lee
	 * @return count
	 */
	@GetMapping("/getAlarmCount")
	@ResponseBody
	public String getAlarmCount(@RequestParam("loginUserNo") int loginUserNo) {
		
		int count = service.getAlarmCount(loginUserNo);
		if(count != 0) {
			return new Gson().toJson(count);
		}else {
			count = 0;
			return new Gson().toJson(count);
		}
	}
	
	
	/**
	 * 쪽지를 보낸 유저 닉네임 가져오는 컨트롤러
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	@GetMapping("/getUserNicks")
	@ResponseBody
	public String getUserNicks(@RequestParam("loginUserNo") int loginUserNo) {
		List<MsgAlarm> getUserNicks = new ArrayList<>();
		
		getUserNicks = service.getUserNicks(loginUserNo);
		
		if(!getUserNicks.isEmpty()) {
			return new Gson().toJson(getUserNicks);
		}else {
			return new Gson().toJson("none");
		}
		
	}
	
	
	/**
	 * 클릭 하고 count 갯수 사라지게 하는 컨트롤러
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	@GetMapping("/disappearCount")
	@ResponseBody
	public String disappearCount(@RequestParam("loginUserNo") int loginUserNo) {
		
		String success = "성공!";
		String fail = "실패!";
		
		int result = service.disappearCount(loginUserNo);
		
		if(result > 0) {
			return new Gson().toJson(success);
		}else {
			return new Gson().toJson(fail);
		}
	}
	
	
	
	

}
