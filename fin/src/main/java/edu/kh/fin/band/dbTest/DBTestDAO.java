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
	
}
