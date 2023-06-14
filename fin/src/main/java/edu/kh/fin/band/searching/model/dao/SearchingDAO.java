package edu.kh.fin.band.searching.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.searching.model.vo.Searching;

@Repository
public class SearchingDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Searching> checkSelect(Searching searching) {
		return sqlSession.selectList("searchingMapper.memberList", searching);
	}

}
