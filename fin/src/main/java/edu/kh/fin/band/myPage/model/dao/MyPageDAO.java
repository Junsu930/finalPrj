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
		
		System.out.println("비밀번호 조회 DAO 유저NO" + userNo);
		
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

	/** 포지션 변경 DAO
	 * @param paramMap
	 * @return
	 */
	public int updatePosition(Map<String, Object> paramMap) {
		
		System.out.println("포지션 변경 DAO 악기" +paramMap.get("inst"));
		System.out.println(paramMap.get("genre"));
		System.out.println(paramMap.get("region"));
		
		return sqlSession.update("myPageMapper.updatePosition", paramMap);
	}

	/** 이미지 변경 DAO
	 * @param paramMap
	 * @return
	 */
	public int updateImg(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.updateImg", paramMap);
	}

	/** 포지션 입력 DAO
	 * @param paramMap
	 * @return
	 */
	public int insertPosition(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.insertPosition", paramMap);
	}

	/** 회원 탈퇴 DAO
	 * @param userNo
	 * @return
	 */
	public int secession(int userNo) {
		
		return sqlSession.update("myPageMapper.secession", userNo);
	}


}
