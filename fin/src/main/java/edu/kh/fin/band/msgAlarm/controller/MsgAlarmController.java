package edu.kh.fin.band.msgAlarm.controller;

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
import edu.kh.fin.band.msgAlarm.model.service.MsgAlarmService;
import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
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
		List<Invitation> inviList = new ArrayList<>();
		List<MsgAlarm> alarmList = new ArrayList<>();
		
		getUserNicks = service.getUserNicksFromRoom(loginUserNo);
		
		inviList = service.getInviList(loginUserNo);
		
		// 현재 로그인된 유저넘버 바탕으로 댓글 단 사람 목록, 날짜 출력할거임
		alarmList = service.getUserNicksFromReply(loginUserNo);
		
		if(!getUserNicks.isEmpty()) {
			return new Gson().toJson(getUserNicks);
		}else {
			if(!inviList.isEmpty()) { // 이걸 안해놓으면 같은 알람창이니까 "none"이 실행되어 inviList와 "none"일 때, 화면이 동시에 출력됨
				return "false";
			}else if(!alarmList.isEmpty()) {
				return "false";
			}
			return new Gson().toJson("none");
		}
	}
	
	
	
	
	
	/**
	 * alarmPage 이동 + 초대장목록 출력 컨트롤러
	 * @author lee
	 * @param loginUser
	 * @return
	 */
	@GetMapping("/alarmPage")
	public String showAlarmPage(@ModelAttribute("loginUser") User loginUser, Model model) {
		
		
		int loginUserNo = loginUser.getUserNo();
		
		List<Invitation> inviList = new ArrayList<>();
		
		inviList = service.selectInviAlarmPage(loginUserNo);
		
		
		model.addAttribute("inviList", inviList);
		
		return "alarm/alarmPage";
	}
	
	
	/**
	 * 초대장 중복으로보내는지 체크 컨트롤러
	 * @author lee
	 * @param loginUser
	 * @param toUserNo
	 * @return
	 */
	@GetMapping("/dupCheckInvi")
	@ResponseBody
	public String dupCheckInvi(
			@ModelAttribute("loginUser") User loginUser, 
			@RequestParam("toUserNo") int toUserNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("fromUserNo", loginUser.getUserNo());
		map.put("toUserNo", toUserNo);
		
		
		int result = service.dupCheckInvi(map);
		
		if(result == 999) {
			return new Gson().toJson("초대장을 이미 보냈습니다!");
		}else {
			return new Gson().toJson(result);
		}
	}
	
	
	/**
	 * 초대장을 보내서 초대장 테이블에 데이터 넣어두기 컨트롤러 + fromUserNo을 바탕으로 DAO에서 밴드 NO도 가져와서 초대장 테이블에 삽입 
	 * + totalAlarm테이블에도 데이터 삽입
	 * @author lee
	 * @param loginUser
	 * @param toUserNo
	 * @return GSON
	 */
	@PostMapping("/sendInvitate")
	@ResponseBody
	public String sendInvitate(
			@ModelAttribute("loginUser") User loginUser, 
			@RequestParam("toUserNo") int toUserNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("fromUserNo", loginUser.getUserNo());
		map.put("toUserNo", toUserNo);
		
		int result = service.sendInvitate(map);
		
		if(result >0) {
			return new Gson().toJson("초대장을 보냈습니다!");
		}
		else {
			return new Gson().toJson("초대장을 발송 실패 ㅠㅠ");
		}
	}
	
	
	/**
	 * 알람(초대장 + 댓글 + 좋아요) 갯수 가져오는 컨트롤러
	 * @author lee
	 * @param userNo
	 * @return count
	 */
	@GetMapping("/totalAlarmGet")
	@ResponseBody
	public String totalAlarmGet(@RequestParam("loginUserNo")int userNo) {
		
		
		int count = service.totalAlarmGet(userNo);
		
		if(count >0) {
			return new Gson().toJson(count);
		}else {
			return new Gson().toJson(count);
		}
	}
	
	
	/**
	 * 초대장 알람 목록 출력하기 컨트롤러 + 가져올 거, 밴드 리더닉네임, 밴드네임
	 * @author lee
	 * @param userNo
	 * @return 
	 */
	@GetMapping("/alarmGetFromInvi")
	@ResponseBody
	public String alarmGetFromInvi(@RequestParam("loginUserNo") int userNo) {
		
		List<Invitation> inviList = new ArrayList<>();
		
		inviList = service.getInviList(userNo);
		
		
		
		if(!inviList.isEmpty()) {
			return new Gson().toJson(inviList);
		}else {
			return new Gson().toJson("none");
		}
	}
	
	
	/**
	 * 읽으면 알람 카운트 삭제 컨트롤러
	 * @author lee
	 * @param userNo
	 * @return
	 */
	@GetMapping("/changeAlarmStatus")
	@ResponseBody
	public String changeAlarmStatus(@RequestParam("loginUserNo") int userNo) {
		
		int result = service.changeAlarmStatus(userNo);
		
		if(result > 0) {
			return new Gson().toJson(result);
		}else {
			return new Gson().toJson(0);
		}
	}
	
	
	
	/**
	 * 현재 로그인된 유저넘버 바탕으로 댓글 단 사람 목록, 날짜 출력해주는 알람 컨트롤러
	 * @author lee
	 * @param userNo
	 * @return
	 */
	@GetMapping("/getUserNicksFromReply")
	@ResponseBody
	public String getUserNicksFromReply(@RequestParam("loginUserNo") int userNo) {
		
		List<MsgAlarm> alarmList = new ArrayList<>();
		
		// 현재 로그인된 유저넘버 바탕으로 댓글 단 사람 목록, 날짜 출력할거임
		alarmList = service.getUserNicksFromReply(userNo);
		
		if(!alarmList.isEmpty()) {
			return new Gson().toJson(alarmList);
		}else {
			return new Gson().toJson("none");
		}
	}
	
	
	
	/**
	 * 현재 로그인된 유저넘버 바탕으로 좋아요 한 사람 목록, 날짜 출력해주는 알람 컨트롤러
	 * @author lee
	 * @param userNo
	 * @return
	 */
	@GetMapping("/getUserNicksFromLike")
	@ResponseBody
	public String getUserNicksFromLike(@RequestParam("loginUserNo") int userNo) {
		List<MsgAlarm> alarmList = new ArrayList<>();
		
		// 현재 로그인된 유저넘버 바탕으로 댓글 단 사람 목록, 날짜 출력할거임
		alarmList = service.getUserNicksFromLike(userNo);
		
		
		
		
		if(!alarmList.isEmpty()) {
			return new Gson().toJson(alarmList);
		}else {
			return new Gson().toJson("none");
		}
		
	}
	
	
	
	
	
	
	
}
