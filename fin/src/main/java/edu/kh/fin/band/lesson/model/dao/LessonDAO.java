package edu.kh.fin.band.lesson.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.lesson.model.vo.Lesson;

@Repository
public class LessonDAO {
	

	@Autowired
	SqlSessionTemplate sqlSession;

	/** lesson 조회
	 * @return
	 */

	public List<Lesson> lessonList() {
		return sqlSession.selectList("lessonMapper.lessonList");
	}
	
}
		