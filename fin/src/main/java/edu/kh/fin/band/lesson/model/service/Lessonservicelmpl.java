package edu.kh.fin.band.lesson.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.fin.band.lesson.model.dao.LessonDAO;
import edu.kh.fin.band.lesson.model.vo.Lesson;

public abstract class Lessonservicelmpl{

	@Autowired
	private LessonDAO dao;
	/*
	@Override
	public List<Lesson> selectlesson(){
		
		return dao.selectlesson();
		
	}*/
	
}
