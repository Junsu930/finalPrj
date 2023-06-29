package edu.kh.fin.band.myBand.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.vo.MyBand;
import edu.kh.fin.band.myBand.model.vo.MyBandReply;

@Repository
public class MyBandDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyBand> bandList(Map<String, Object> boardMap) {
		
		List<MyBand> bList = sqlSession.selectList("myBandMapper.bandBoardList", boardMap);
		
		for(MyBand eachBand : bList) {
			int MboardNo = eachBand.getBoardNo();
			
			int rCount = sqlSession.selectOne("myBandMapper.rCount", MboardNo);
			
			eachBand.setReplyCount(rCount);
			
		}
		
		
		return bList;
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

	public int insertReplyForBandBoard(int boardNo, int loginUserNo, String replyText) {
		
		
		Map<String, Object> replyMap = new HashMap<String, Object>();
		
		replyMap.put("boardNo", boardNo);
		replyMap.put("loginUserNo", loginUserNo);
		replyMap.put("replyText", replyText);
		
		return sqlSession.insert("myBandMapper.insertReplyForBandBoard", replyMap);
	}

	public List<MyBandReply> loadReplyForBandBoard(int boardNo) {
		return sqlSession.selectList("myBandMapper.loadReplyForBandBoard", boardNo);
	}

	public int updateBandBoard(String title, String text, int boardNo) {
		
		Map<String, Object> boardMap = new HashMap<String, Object>();
		
		boardMap.put("boardNo", boardNo);
		boardMap.put("title", title);
		boardMap.put("text", text);
		return sqlSession.update("myBandMapper.updateBandBoard", boardMap);
	}

	public int deleteBandBoardDetail(int boardNo) {
		return sqlSession.update("myBandMapper.deleteBandBoardDetail", boardNo);
	}

	public int updateReplyLogic(int replyNo, String replyText) {
		

		Map<String, Object> rMap = new HashMap<String, Object>();
		
		rMap.put("replyNo", replyNo);
		rMap.put("replyText", replyText);

		return sqlSession.update("myBandMapper.updateReplyLogic", rMap);
	}

	public int deleteReplyForBandBoard(int replyNo) {
		return sqlSession.update("myBandMapper.deleteReplyForBandBoard", replyNo);
	}

	public void bandBoardCount(int boardNo) {

		sqlSession.update("myBandMapper.bandBoardCount", boardNo);
	}

	public int likeCheck(int boardNo, int userNo) {
		

		Map<String, Object> likeMap = new HashMap<String, Object>();
		
		likeMap.put("boardNo", boardNo);
		likeMap.put("userNo", userNo);
		
		return sqlSession.selectOne("myBandMapper.likeCheck", likeMap);
	}

}
