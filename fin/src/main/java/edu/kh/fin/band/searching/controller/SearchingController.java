package edu.kh.fin.band.searching.controller;

import java.util.HashMap;
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
	
	
	
	
	
	/** 
	 * 조건에 맞는 멤버 찾기 Controller
	 * @author lee
	 * @param gender
	 * @param region
	 * @param inst
	 * @param genre
	 * @param model
	 * @return
	 */
	@PostMapping("/checkSelect")
	public String showMemberList(
			@RequestParam("gender") char gender,
			@RequestParam("region") String region,
			@RequestParam("inst") String inst,
			@RequestParam("genre") String genre, Model model) {
		
		
		Searching searching = new Searching();
		
		searching.setGender(gender);
		searching.setGenre(genre);
		searching.setRegion(region);
		searching.setInst(inst);
		
		
		
		
		System.out.println(searching.toString() + "Controller");
		
		
		
		
		List<Searching> memberList = service.checkSelect(searching);
		
	
		System.out.println(memberList + "test Controller");
		
		model.addAttribute("memberList", memberList);
		
		return "finding/memberList";
	}
}
