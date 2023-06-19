package edu.kh.fin.band.lesson.controller;

import java.util.ArrayList;
import java.util.List;


import org.springframework.ui.Model;


import edu.kh.fin.band.lesson.model.service.LessonService;
import edu.kh.fin.band.lesson.model.vo.Lesson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;

@Controller
public class LessonController {
		
		@Autowired
		LessonService service;
			
				
		@GetMapping("/lesson")
		public String lessonController(Model model) {
			
			List<Lesson> lessonList = new ArrayList<>();
			
			lessonList = service.lessonList();
			
			model.addAttribute("lessonList", lessonList);
			
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
