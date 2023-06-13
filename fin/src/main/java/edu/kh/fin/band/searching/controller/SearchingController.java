package edu.kh.fin.band.searching.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.fin.band.searching.model.service.SearchingService;
import edu.kh.fin.band.searching.model.vo.Searching;

@Controller
public class SearchingController {
	
	@Autowired
	private SearchingService service;
	
	
	
	
	@GetMapping("/findingMember")
	public String findingMemberController() {
		
		return "finding/findingMember";
		
	}
	
	
//	잠깐 페이지 거쳐가는 로더 페이지
	@GetMapping("/findingLoder")
	public String findingLoderController() {
		
		return "finding/findingLoder";
	}
	
	
	
	@PostMapping("/checkSelect")
	public String showMemberList(@RequestParam("gender")String gender,
			@RequestParam("location") String location,
			@RequestParam("GUITAR") String guitar,
			@RequestParam("BASS") String bass,
			@RequestParam("DRUM") String drum,
			@RequestParam("VOCAL") String vocal,
			@RequestParam("KEYBOARD") String keyboard,
			@RequestParam("HORN") String horn, Model model) {
		
		
		Searching searching = new Searching();
		
		searching.setGender(gender);
		searching.setLocation(location);
		searching.setGuitar(guitar);
		searching.setBass(bass);
		searching.setDrum(drum);
		searching.setVocal(vocal);
		searching.setKeyboard(keyboard);
		searching.setHorn(horn);
		
		
		
		List<Searching> resultList = service.checkSelect(searching);
		
		
		
		
		
		return "finding/memberList";
	}
	

	

}
