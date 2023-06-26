package edu.kh.fin.band.myBand.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.fin.band.myBand.model.service.MyBandService;
import edu.kh.fin.band.myBand.model.vo.MyBand;

@Controller
public class MyBandController {
	
	@Autowired
	MyBandService service;
	
	@GetMapping("/myBandBoard")
	public String myBandBoard(@RequestParam("bandNo") int bandNo, Model model) {
		
		List<MyBand> bandList = service.bandList(bandNo);
		
		model.addAttribute("bandList", bandList);
		
		return "myBand/myBand";
	}
	

}
