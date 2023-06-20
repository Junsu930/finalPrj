package edu.kh.fin.band.checkPw.model.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;

@Repository
public class CheckPwDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	public String selectEncPw(int userNo) {
		
		return sqlSession.selectOne("loginMapper.selectEncPw",userNo);
	}

}
