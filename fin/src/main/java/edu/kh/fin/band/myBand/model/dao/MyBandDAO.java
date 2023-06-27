package edu.kh.fin.band.myBand.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.vo.MyBand;

@Repository
public class MyBandDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyBand> bandList(Map<String, Object> boardMap) {
		return sqlSession.selectList("myBandMapper.bandBoardList", boardMap);
	}

	public String leaderNick(int bandNo) {
		return sqlSession.selectOne("myBandMapper.leaderNick",bandNo);
	}

	public List<String> bandMember(int bandNo) {
		return sqlSession.selectList("myBandMapper.bandMember", bandNo);
	}

	public int getTotal(int bandNo) {
		return sqlSession.selectOne("myBandMapper.getTotal", bandNo);
	}

	public int bandUserFl(int bandNo, User loginUser) {
		Map<String, Object>bandFlMap = new HashMap<>();
		
		bandFlMap.put("bandNo", bandNo);
		bandFlMap.put("userNo", loginUser.getUserNo());
		
		
		return sqlSession.selectOne("myBandMapper.bandUserFl", bandFlMap);
	}

	public int writeBandBoard(String title, String text, int bandNo, int userNo) {
		
		Map<String, Object>map = new HashMap<String, Object>();
		
		map.put("title", title);
		map.put("text", text);
		map.put("bandNo", bandNo);
		map.put("userNo", userNo);
		
		return sqlSession.insert("myBandMapper.writeBandBoard", map);
	}

	public MyBand bandBoardDetail(int boardNo) {
		return sqlSession.selectOne("myBandMapper.bandBoardDetail",boardNo);
	}

}
