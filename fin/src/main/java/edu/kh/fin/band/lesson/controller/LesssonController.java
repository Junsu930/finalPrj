package edu.kh.fin.band.lesson.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LesssonController {
	
	@GetMapping("/lesson")
	public String lessonController() {
		
		return "lesson/lessonMain";
	}
	
	@GetMapping("/lessonDetail")
	public String lessonDetailController() {
		
		return "lesson/lessonDetail";
	}
	
	@GetMapping("/lessonWriting")
	public String lessonWritingController() {
		
		return "lesson/lessonWriting";
	}
	
	
	

}
