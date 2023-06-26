package edu.kh.fin.band.myBand.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.myBand.model.vo.MyBand;

@Repository
public class MyBandDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyBand> bandList(int bandNo) {
		return sqlSession.selectList("myBandMapper.bandBoardList", bandNo);
	}

}
