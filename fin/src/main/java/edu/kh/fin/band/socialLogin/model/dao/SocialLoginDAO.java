package edu.kh.fin.band.socialLogin.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;

@Repository
public class SocialLoginDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int checkNaverFl(String email) {
		return sqlSession.selectOne("socialMapper.checkNaverFl",email);
	}

	public int naverSignUp(Map<String, Object> map) {

		int result = sqlSession.insert("socialMapper.naverSignUp", map);
		
		if(result > 0) result = (Integer)map.get("userNo");
		
		return result;
	}

	public User getUser(int userNo) {
		
		return sqlSession.selectOne("socialMapper.getUser", userNo);
	}

	public int changeToken(Map<String, Object> map) {
		return sqlSession.update("socialMapper.changeToken", map);
	}

	/**
	 * kakaoSignUp + 액세스 토큰을 바탕으로 카카오 유저 정보를 가져와서 + 일반 회원과 중복 체크 + 정보 디비 저장 + 유저넘버 가져오기 + 기존 회원이면 토큰 교체 DAO
	 * @author lee
	 * @param getUserInfoMap
	 * @return
	 */
	public int kakaoSignUp(HashMap<String, Object> getUserInfoMap) {
		Integer alreadyUserNo;
		// 기존 회원이 존재하는지 파악 먼저 해야함
		String alreadyUserEmail = (String)getUserInfoMap.get("email");
		String alreadyUserNick = (String)getUserInfoMap.get("nick");
		
		alreadyUserNo = sqlSession.selectOne("socialMapper.selectAlreadyUser", alreadyUserEmail); 
		
		if(alreadyUserNo == null) { // 기존 회원이 아니라면
			// 일반 가입자와 중복 체크해야함
			// 갯수를 가져올 예정
			int checkEmailDup = sqlSession.selectOne("socialMapper.checkDupEmailForKakao" , alreadyUserEmail); // 이메일 중복
			int checkNickDup = sqlSession.selectOne("socialMapper.checkDupNickForKakao", alreadyUserNick); // 닉네임 중복
			
			int totalDup = checkEmailDup + checkNickDup;
			
			if(totalDup == 1) { // 중복 하나 존재 
				return -1;
			}else if(totalDup == 2){ // 중복 두개 존재
				return -1;
			}else { // 중복 없을 때,
				int result = sqlSession.insert("socialMapper.kakaoSignUp", getUserInfoMap); // 회원 등록
				if(result > 0) result = (Integer)getUserInfoMap.get("userNo");
				return result; // userNo 반환
			}
			
		}else { // 기존회원이면 토큰 교체후 유저넘버 리턴
			
			int alreadyUser = alreadyUserNo;
			// 기존 회원 넘버와 토큰을 map에 넣음
			HashMap<String, Object> map = new HashMap<>();
			map.put("alreadyUser", alreadyUser);
			map.put("token", getUserInfoMap.get("token"));
			
			int changeTokenResult = sqlSession.update("socialMapper.changeTokenKakao", map);
			
			if(changeTokenResult > 0);
			// 토큰 교체가 일어나면 리턴 기존 유저넘버 리턴
			return alreadyUser;
		}
	}

	public int emailCheckForNaver(String email) {
		return sqlSession.selectOne("socialMapper.emailCheckForNaver", email);
	}

	public int nickCheckForNaver(String nick) {
		return sqlSession.selectOne("socialMapper.nickCheckForNaver", nick);
	}

}
