package edu.kh.fin.band.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.Business;

@Repository
public class businessDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	// 로그인 DAO
	public Business login(Business inputOwner) {
		
		Business loginOwner = sqlSession.selectOne("businessMapper.businessLogin", inputOwner ); 
		
		return loginOwner;
	}

	//  이메일 체크
	public int emailDupCheck(String ownerEmail) {
		
		return sqlSession.selectOne("businessMapper.emailDupCheck", ownerEmail);
	}

	// 닉네임 체크
	public int nicknameDupCheck(String ownerNickname) {

		return sqlSession.selectOne("businessMapper.emailDupCheck", ownerNickname);
	}

	// 회원가입
	public int signUp(Business inputOwner) {

		return sqlSession.insert("businessMapper.ownerSignUp", inputOwner);
	}

}
