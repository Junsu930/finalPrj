package edu.kh.fin.band.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
