package edu.kh.fin.band.socialLogin.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.vo.SocialInfo;

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

	public SocialInfo getUser(int userNo) {
		
		return sqlSession.selectOne("socialMapper.getUser", userNo);
	}

	public int changeToken(Map<String, Object> map) {
		return sqlSession.update("socialMapper.changeToken", map);
	}

}
