package edu.kh.fin.band.lesson.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.lesson.model.vo.Lesson;
import edu.kh.fin.band.lesson.model.vo.LessonImage;

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

	/** lesson 이미지 삽입
	 * @return
	 */
	public int insertImageFile(LessonImage img) {
		return sqlSession.insert("lessonMapper.insertImageFile", img);
	}

	public int writeLessonForm(Map<String, Object> map) {
		int result = sqlSession.insert("lessonMapper.writeLessonForm", map);
		
		if(result>0) result = (Integer)map.get("lessonNo");
				
		return result;
	}

	public Lesson lessonDetail(int lessonBoard) {
		return sqlSession.selectOne("lessonMapper.lessonDetail", lessonBoard);
	}

	public List<LessonImage> imageList(int lessonBoard) {
		return sqlSession.selectList("lessonMapper.imageList",lessonBoard);
		
	}
	

	
	


	
}