package edu.kh.fin.band.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;

@Repository
public class findPwDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	public int emailCheck(String userEmail) {
		
		return sqlSession.selectOne("findPwMapper.emailCheck", userEmail);
	}

	public int findPw(User inputUser) {
		
		return sqlSession.update("findPwMapper.updatePw", inputUser);
	}

}
