package edu.kh.fin.band.lesson.model.dao;

import java.util.HashMap;
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

	/** 
	 * 레슨 무한 스크롤 DAO
	 * @author lee
	 * @return
	 */
	public List<Lesson> lessonList() {
		return sqlSession.selectList("lessonMapper.lessonList");
	}
	
	
	/**
	 * 레슨 필터 조회 DAO
	 * @author lee
	 * @param lessonText
	 * @param locText
	 * @return
	 */
	public List<Lesson> lessonFilter(String lessonText, String locText) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		String lessonTextForSql = "%" + lessonText + "%";
		String locTextForSql = "%" + locText + "%";
		
		
		map.put("lessonText", lessonTextForSql);
		map.put("locText", locTextForSql);
		
		
		return sqlSession.selectList("lessonMapper.lessonFilter", map);
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
	 * 레슨 디테일 조회 시, 하단 추천 강사 뜨기(랜덤 조회) DAO
	 * @author lee
	 * @return
	 */
	public List<Lesson> lessonListRandom() {
		return sqlSession.selectList("lessonMapper.lessonListRandom");
	}

	/**
	 * 레슨 글 삭제 DAO
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public int deleteLesson(int lessonNo) {
		
		int imgDelete = sqlSession.update("lessonMapper.deleteLessonImg", lessonNo);
		if(imgDelete > 0) {
			return sqlSession.update("lessonMapper.deleteLesson", lessonNo);
		}else {
			return 0;
		}
		
		
	}


	

	



	
}