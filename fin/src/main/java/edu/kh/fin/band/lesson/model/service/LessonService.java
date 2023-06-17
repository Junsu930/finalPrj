package edu.kh.fin.band.lesson.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import edu.kh.fin.band.lesson.model.vo.Lesson;

public interface LessonService {

	
	//게시판 코드, 이름 조회
	List<Lesson> selectLessonType();

	Map<String, Object> selectlessonList(int cp, int lessonCode);

	Map<String, Object> searchlessonList(Map<String, Object> paramMap);


	List<Lesson> selectlesson();
	
		
}
