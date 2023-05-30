package edu.kh.fin.band.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RoomController {
	
	@GetMapping("/room")
	public String roomController() {
		
		return "room/roomMain";
		
	}
	
	@GetMapping("/roomDetail")
	public String roomDetail() {
		
		return "room/roomDetail";
	}
	

}
