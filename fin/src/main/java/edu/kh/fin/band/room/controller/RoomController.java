package edu.kh.fin.band.room.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.fin.band.room.model.service.RoomService;
import edu.kh.fin.band.room.model.vo.Room;

@Controller
public class RoomController {
	
	@Autowired
	RoomService service;
	
	
	@GetMapping("/room")
	public String roomController(Model model) {
		
		List<Room> roomList = new ArrayList<>();
		
		roomList = service.roomList();
		
		model.addAttribute("roomList", roomList);
		
		return "room/roomMain";
		
	}
	
	@GetMapping("/roomDetail")
	public String roomDetail(@RequestParam("pracRoomNo") int pracRoomNo, Model model) {
		
		Room roomDetail = service.roomDetail(pracRoomNo);
		
		model.addAttribute("roomDetail", roomDetail);
		
		return "room/roomDetail";
	}
	
	@GetMapping("/roomScroll")
	@ResponseBody
	public String roomScroll() {
		
		List<Room> roomList = new ArrayList<>();
		roomList = service.roomList();
		
		return new Gson().toJson(roomList);
		
	}
	
	@GetMapping("/searchingRoomScroll")
	@ResponseBody
	public String searchingRoomScroll(@RequestParam("region") String region, @RequestParam("searchingText") String searchingText) {
		
		List<Room> roomList = new ArrayList<>();

		roomList = service.searchingRoomList(region, searchingText);
		
		return new Gson().toJson(roomList);
		
	}
	
	@PostMapping("/pracRoomBooking")
	@ResponseBody
	public int pracRoomBooking(@RequestParam("timeArr[]") ArrayList<Integer> timeArr, @RequestParam HashMap<String, Object> map) {
		
		System.out.println(timeArr);
		System.out.println(map);
		
		
		int result = service.pracRoomBooking(timeArr, map);
		
		int roomAlarmResult = service.roomAlarmResult(map); // 예약을 할 때, 오너에게 알람을 보내는 메서드
		
		if(result > 0){
			if (roomAlarmResult > 0) {
				return result;
				
			}else {
				return 0;
			}
		}else {
			return 0;
		}
	}
	
	@PostMapping("checkBookingTime")
	@ResponseBody
	public String checkBookingTime(@RequestParam HashMap<String, Object> dayMap) {
		
		List<Integer> bookTime = service.checkBookingTime(dayMap); 
		
		return new Gson().toJson(bookTime);
	}
	
/*	
	@GetMapping("/searchingPracRoom")
	public String searchingPracRoom(Model model, @RequestParam("regionSelector") String region,
			@RequestParam("searchingText")String searchingText) {
		
		List<Room> roomList = new ArrayList<>();
		
		
		roomList = service.searchingRoomList(region, searchingText);

		searchingRoomList = roomList;
		
		model.addAttribute("roomList", roomList);
		model.addAttribute("searchingFlag", "flagOn");

		return "room/roomMain";
	}
	
*/

}
