package edu.kh.fin.band.myBand.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.common.pagination.CommonCriteria;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.dao.MyBandDAO;
import edu.kh.fin.band.myBand.model.vo.MyBand;
import edu.kh.fin.band.myBand.model.vo.MyBandReply;

@Service
public class MyBandService {

	@Autowired
	MyBandDAO dao;

	public List<MyBand> bandList(int bandNo, int amount, int pageNum) {
		
		Map<String,Object> boardMap = new HashMap<>();
		
		boardMap.put("bandNo", bandNo);
		boardMap.put("pageNum", pageNum);
		boardMap.put("amount", amount);
		
		
		return dao.bandList(boardMap);
	}

	public String leaderNick(int bandNo) {
		return dao.leaderNick(bandNo);
	}

	public List<String> bandMember(int bandNo) {
		return dao.bandMember(bandNo);
	}

	public int getTotal(int bandNo) {
		return dao.getTotal(bandNo);
	}

	public int bandUserFl(int bandNo, User loginUser) {
		return dao.bandUserFl(bandNo,loginUser);
	}

	public int writeBandBoard(String title, String text, int bandNo, int userNo) {
		return dao.writeBandBoard(title, text, bandNo, userNo);
	}

	public MyBand bandBoardDetail(int boardNo) {
		return dao.bandBoardDetail(boardNo);
	}

	public int insertReplyForBandBoard(int boardNo, int loginUserNo, String replyText) {
		return dao.insertReplyForBandBoard(boardNo, loginUserNo, replyText);
	}

	public List<MyBandReply> loadReplyForBandBoard(int boardNo) {
		return dao.loadReplyForBandBoard(boardNo);
	}
	
	
	
}
