package edu.kh.fin.band.lesson.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.fin.band.lesson.model.vo.Lesson;

public class LessonDAO {
	

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** lesson 코드, 이름 조회 DAO
	 * @return boardTypeList
	 */

	public List<Lesson> selectlesson() {
		return sqlSession.selectList("lessonMapper.selectLesson");
	}
	
}
		