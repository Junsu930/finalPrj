package edu.kh.fin.band.myPage.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	/** 비밀번호 암호화 조회 DAO
	 * @param i
	 * @return
	 */
	public String selectEncPw(int userNo) {
		
		return sqlSession.selectOne("myPageMapper.selectEncPw", userNo);
	}

	/** 이메일 닉네임 변경
	 * @param paramMap
	 * @return
	 */
	public int updateInfo(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.updateInfo", paramMap);
	}

	/** 비밀번호 변경
	 * @param paramMap
	 * @return
	 */
	public int changePw(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.changePw", paramMap);
	}

	/** 이미지 변경
	 * @param paramMap
	 * @return
	 */
	public int updateImage(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.updateProfile", paramMap);
	}

}
