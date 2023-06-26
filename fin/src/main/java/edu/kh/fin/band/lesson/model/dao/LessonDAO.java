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
	
	/**
	 * 레슨 이미지 전체 조회 DAO
	 * @author lee
	 * @return
	 */
	public List<LessonImage> selectLessonImgList() {
		return sqlSession.selectList("lessonMapper.lessonImageList");
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
	
	

	/**
	 * 레슨 디테일 가져오기 DAO
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public Lesson selectDetail(int lessonNo) {
		return sqlSession.selectOne("lessonMapper.selectDetail", lessonNo);
	}

	/**
	 * 레슨 디테일 이미지 가져오기 DAO
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public LessonImage selectLessonImg(int lessonNo) {
		return sqlSession.selectOne("lessonMapper.selectLessonImg", lessonNo);
	}

	/**
	 * 레슨 글 삭제 DAO
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public int deleteLesson(int lessonNo) {
		return sqlSession.update("lessonMapper.deleteLesson", lessonNo);
	}



	
}