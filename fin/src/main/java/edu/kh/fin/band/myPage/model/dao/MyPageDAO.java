package edu.kh.fin.band.myPage.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.vo.Ban;
import edu.kh.fin.band.myPage.model.vo.Band;

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

	/** 유저 차단 해제
	 * @param loginUser
	 * @return
	 */
	public int ban(User loginUser) {
		// TODO Auto-generated method stub
		return 0;
	} 

	/** 차단 유저 정보 갖고오기
	 * @return
	 */
	public List<Ban> chBanList(int userNo) {
		
	
		return sqlSession.selectList("myPageMapper.chBanList", userNo);
	}

	/** 밴 해제
	 * @param bannedUserNo
	 * @return
	 */
	public int updateBan(int bannedUserNo) {
		
		return sqlSession.update("myPageMapper.updateBan", bannedUserNo );
	}

	/** 밴드 생성
	 * @param bandName
	 * @param userNo
	 * @param ment
	 * @return
	 */
	public int makeBand(Map<String, Object> paramMap) {
		
		return sqlSession.update("myPageMapper.makeBand", paramMap);
	}

	/**  밴드 멤버 정보 가져오기
	 * @param userNo
	 * @return
	 */
	public List<Band> bandMem(int userNo) {
	
		return sqlSession.selectList("myPageMapper.bandMem", userNo);
	}

	/** 밴드에 유저 넣기
	 * @param paramMap
	 * @return
	 */
	public int makeBandUser(Map<String, Object> paramMap) {
		
		System.out.println("유저넣기 DAO" +paramMap);
		
		return sqlSession.update("myPageMapper.makeBandUser", paramMap);
	}

	/** 밴드 번호 갖고 오기
	 * @param userNo
	 * @return
	 */
	public int bandNo(int userNo) {
		
		return sqlSession.selectOne("myPageMapper.bandNo", userNo);
	}

	/** 밴드 추방
	 * @param userNick
	 * @return
	 */
	public int exile(String userNo) {
	
		return sqlSession.update("myPageMapper.exile", userNo);
	}

	/** 밴드 해체
	 * @param bandNo
	 * @return
	 */
	public int dismiss(int bandNo) {
		
		return sqlSession.update("myPageMapper.dismiss", bandNo);
	}

	

}
