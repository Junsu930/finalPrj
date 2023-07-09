package edu.kh.fin.band.dbTest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DBTestDAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	public DBTestVO dbTest(int userNo) {
		return sqlSession.selectOne("testMapper.testSelect", userNo);
	}

	public int leaderCheck(int loginUserNo) {
		return sqlSession.selectOne("testMapper.leaderCheck", loginUserNo);
	}

	public int inBandCheck(int userNo) {
		return sqlSession.selectOne("testMapper.inBandCheck", userNo);
	}
	
}
