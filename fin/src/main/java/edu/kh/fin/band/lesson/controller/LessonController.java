package edu.kh.fin.band.lesson.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import edu.kh.fin.band.lesson.model.service.LessonService;

@Controller
public class LessonController {
		
	@Autowired 
	private LessonService service;

		@GetMapping("/list/{LessonCode}")
		public String LessonList(@PathVariable("LessonCode") int lessonCode
				,@RequestParam(value = "cp", required = false, defaultValue = "1" )  int cp      
				,Model model,
				@RequestParam Map<String, Object> paramMap) {	
				// 검색 요청인 경우 : key, query, cp(있거나 없거나)

			// 게시글 목록 조회 서비스 호출
			// 1) 게시판 이름 조회 -> 인터셉터로 application에 올려둔 boardTypeList 쓸 수 있을듯?
			// 2) 페이지네이션 객체 생성(listCount)
			// 3) 게시글 목록 조회
			
			Map<String, Object> map = null;
			
			
			if(paramMap.get("key") == null) { // 검색이 아닌 경우
			map = service.selectlessonList(cp, lessonCode);
			
			}else { // 검색인 경우
			
			// 검색에 필요한 데이터를 paramMap에 모두 담아서 서비스 호출
			// -> key, query, cp, boardCode
			
			paramMap.put("cp", cp);  // 있으면 같으면 값으로 덮어쓰기, 없으면 추가
			paramMap.put("lessonCode", lessonCode);
			
			map = service.searchlessonList(paramMap);
			
			}
			
			
			model.addAttribute("map", map);
			
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
