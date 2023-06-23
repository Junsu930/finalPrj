package edu.kh.fin.band.lesson.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;


import edu.kh.fin.band.lesson.model.service.LessonService;
import edu.kh.fin.band.lesson.model.vo.Lesson;
import edu.kh.fin.band.login.model.vo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
	
	@PostMapping("/writeLessonForm")
	public String writeLessonForm(@RequestParam Map<String,Object> map, 
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			@ModelAttribute("loginUser") User loginUser,
			@RequestParam("lessonNameInput") String name,
			HttpServletRequest req, RedirectAttributes ra) {
	
		String webPath = "/resources/images/lesson/";
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		// c:\workspace\~~
		
		System.out.println(map.entrySet());
		System.out.println(map.get("introment"));
		
		map.put("userNo", loginUser.getUserNo() );
		
		int writeResult = service.writeLessonForm(map, images, webPath,folderPath);
		
		if(writeResult > 0) {
			ra.addFlashAttribute("message", "게시글이 등록되었습니다");
			return "redirect:/lesson/";
		}else {
			ra.addFlashAttribute("message", "게시글 등록이 실패했습니다.");
			return "redirect:/lessonWriting/";
		}
		
}
}


