package edu.kh.fin.band.lesson.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.lesson.model.dao.LessonDAO;
import edu.kh.fin.band.lesson.model.vo.Lesson;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;

	public List<Lesson> lessonList() {
		return dao.lessonList();
	}
		
}
