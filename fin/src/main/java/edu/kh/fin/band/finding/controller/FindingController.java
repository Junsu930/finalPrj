package edu.kh.fin.band.finding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindingController {
	
	@GetMapping("/findingMember")
	public String roomController() {
		
		return "finding/findingMember";
		
	}

}
