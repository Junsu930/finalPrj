package edu.kh.fin.band.finding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindingController {
	
	@GetMapping("/findingMember")
	public String findingMemberController() {
		
		return "finding/findingMember";
		
	}
	
	@GetMapping("/findingLoder")
	public String findingLoderController() {
		
		return "finding/findingLoder";
		
	}
	

	@GetMapping("/memberList")
	public String memberListController() {
		
		return "finding/memberList";
		
	}

}
