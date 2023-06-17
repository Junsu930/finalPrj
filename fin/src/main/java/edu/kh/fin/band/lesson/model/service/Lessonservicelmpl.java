package edu.kh.fin.band.lesson.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.lesson.model.dao.LessonDAO;
import edu.kh.fin.band.lesson.model.vo.Lesson;


@Service
public class Lessonservicelmpl  implements LessonService{

	@Autowired
	private LessonDAO dao;
	
	@Override
	public List<Lesson> selectlesson(){
		
		return dao.selectlesson();
		
	}

	@Override
	public List<Lesson> selectLessonType() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> selectlessonList(int cp, int lessonCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> searchlessonList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return null;
	}




	
	
}
