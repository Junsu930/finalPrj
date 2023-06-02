package edu.kh.fin.band.finding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindingController {
	
	@GetMapping("/findingMember")
	public String findingController() {
		
		return "finding/findingMember";
		
	}
	
	@GetMapping("/memberList")
	public String memberListController() {
		
		return "finding/memberList";
		
	}

}
