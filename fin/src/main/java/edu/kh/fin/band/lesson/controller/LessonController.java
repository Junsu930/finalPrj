package edu.kh.fin.band.lesson.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.lesson.model.service.LessonService;
import edu.kh.fin.band.lesson.model.vo.Lesson;
import edu.kh.fin.band.lesson.model.vo.LessonImage;
import edu.kh.fin.band.login.model.vo.User;

@Controller
@SessionAttributes({"loginUser"})
public class LessonController {
	
		
	@Autowired
	LessonService service;
	
				
	@GetMapping("/lesson")
	public String lessonController(Model model) {
		
		return "lesson/lessonMain";
	}
	
	
	/**
	 * 레슨 무한 스크롤 컨트롤러
	 * @author lee
	 * @return lessonList
	 */
	@GetMapping("/lessonScroll")
	@ResponseBody
	public String lessonScrollController() {
		
		List<Lesson> lessonList = new ArrayList<>();
		
		lessonList = service.lessonList();
		
		return new Gson().toJson(lessonList);
	}
	
	
	/**
	 * 레슨 필터 리스트 조회 컨트롤러
	 * @author lee
	 * @param lessonText
	 * @param locText
	 * @return filterList
	 */ 
	@GetMapping("/filterLesson")
	@ResponseBody
	public String lessonFilterController(
			@RequestParam("lessonBtnTitleText") String lessonText,
			@RequestParam("locBtnTitleText") String locText) {
		
		List<Lesson> filterList = new ArrayList<>();
		
		filterList = service.lessonFilter(lessonText,locText);
		
		
		return new Gson().toJson(filterList);
		
	}
	
	/**
	 * 레슨 디테일, 이미지 가져오기 컨트롤러
	 * @author lee
	 * @param lessonNo
	 * @param model
	 * @return
	 */
	@GetMapping("/lessonDetail")
	public String lessonDetailController( @RequestParam("lessonNo") int lessonNo,
			Model model) {
		
		Lesson lesson = new Lesson();
		
		
		lesson = service.selectDetail(lessonNo);
		LessonImage lessonImg = service.selectLessonImg(lessonNo);
		
		// 아래쪽 사진 리스크 보여주기 랜덤으로 보여줄거임
		List<Lesson> lessonList = new ArrayList<>();
		lessonList = service.lessonListRandom();
		
		
		model.addAttribute("lessonList",lessonList);
		model.addAttribute("lessonImg", lessonImg);
		model.addAttribute("lesson", lesson);
		
		return "lesson/lessonDetail";
	}
	
	@GetMapping("/lessonWriting")
	public String lessonWritingController() {
		
		return "lesson/lessonWriting";
	}
	
	@PostMapping("/writeLessonForm")
	public String writeLessonForm(
			@RequestParam HashMap<String,Object> map,
			@RequestParam(value = "images", required = false) List<MultipartFile> images,
			@RequestParam("loginUserNo") int userNo,
			HttpServletRequest req, RedirectAttributes ra, HttpSession session) {
	
		String webPath = "/resources/images/lesson/";
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		map.put("userNo", userNo);
		

		
		
		
		int writeResult = service.writeLessonForm(map, images, webPath, folderPath);
		// 이미지 까지 삽입되면 여기로 반환 
		
		if(writeResult > 0) {
			ra.addFlashAttribute("message", "게시글이 등록되었습니다");
			return "redirect:lesson";
		}else {
			ra.addFlashAttribute("failMsg", "게시글 등록을 실패했습니다.");
			return "redirect:lesson";
		}
		
	}
	
	/**
	 * 레슨 글 삭제 컨트롤러
	 * @author lee
	 * @param lessonNo
	 * @param ra
	 * @return
	 */
	@PostMapping("/deleteLesson")
	@ResponseBody
	public String deleteLesson(@RequestParam("lessonNo") int lessonNo,
			RedirectAttributes ra) {
		
		int deleteResult = service.deleteLesson(lessonNo);
		
		
		if(deleteResult > 0) {
			  return new Gson().toJson("게시글 삭제 완료!");
		  } else {
			  return new Gson().toJson("게시글 삭제 실패!");
		  }
	}
}


