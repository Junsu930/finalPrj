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
		if(loginUser == null) {
			return "no loginUser";
		}
		int userNo = loginUser.getUserNo();
		return new Gson().toJson(userNo);
	}
	
	
	
	/**
	 * 쪽지 알람 갯수 가져오는 컨트롤러
	 * @author lee
	 * @return count
	 */
	@GetMapping("/getMsgAlarmCount")
	@ResponseBody
	public String getMsgAlarmCount(@RequestParam("loginUserNo") int loginUserNo) {
		
		int count = service.getMsgAlarmCount(loginUserNo);
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
	 * @return getUserNicks, "none"
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
	 * @return success, fail
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
	
	
	
	/**
	 * 유저의 알람 갯수를 가져오는 컨트롤러
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	@ResponseBody
	@GetMapping("/getAlarmCount")
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
	 * 알람 버튼을 클릭하면 알람 카운트를 지워주는 컨트롤
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	@ResponseBody
	@GetMapping("/alarmDisappearCount")
	public String alarmDisappearCount(@RequestParam("loginUserNo") int loginUserNo) {
		
		String success = "성공!";
		String fail = "실패!";
		
		int result = service.alarmDisappearCount(loginUserNo);
		
		if(result > 0) {
			return new Gson().toJson(success);
		}else {
			return new Gson().toJson(fail);
		}
	}
	
	
	
	/**
	 * 로그인 멤버가 오너인 경우 자신의 예약실 알람을 보여주는 컨트롤러
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	@ResponseBody
	@GetMapping("/getUserNicksFromRoom")
	public String getUserNicksFromRoom(@RequestParam("loginUserNo") int loginUserNo) {
		
		List<MsgAlarm> getUserNicks = new ArrayList<>();
		
		getUserNicks = service.getUserNicksFromRoom(loginUserNo);
		
		if(!getUserNicks.isEmpty()) {
			return new Gson().toJson(getUserNicks);
		}else {
			return new Gson().toJson("none");
		}
		
		
		
	}
	
	
	
	
	
	
	
	
}
