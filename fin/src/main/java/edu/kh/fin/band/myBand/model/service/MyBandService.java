package edu.kh.fin.band.myBand.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.common.pagination.CommonCriteria;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.dao.MyBandDAO;
import edu.kh.fin.band.myBand.model.vo.LikeLogic;
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

	/** 글쓰기 수정 로직
	 * @param title
	 * @param text
	 * @param boardNo
	 * @return
	 */
	public int updateBandBoard(String title, String text, int boardNo) {
		return dao.updateBandBoard(title,text,boardNo);
	}

	public int deleteBandBoardDetail(int boardNo) {
		return dao.deleteBandBoardDetail(boardNo);
	}

	public int updateReplyLogic(int replyNo, String replyText) {
		return dao.updateReplyLogic(replyNo, replyText);
	}

	public int deleteReplyForBandBoard(int replyNo) {
		return dao.deleteReplyForBandBoard(replyNo);
	}

	public void bandBoardCount(int boardNo) {
		dao.bandBoardCount(boardNo);
		
		
	}

	/** 좋아요 검증 로직
	 * @param boardNo
	 * @param userNo
	 * @return
	 */
	public int likeCheck(int boardNo, int userNo) {
		return dao.likeCheck(boardNo, userNo);
	}

	public int likeLogic(LikeLogic likeLogic) {
		return dao.likeLogic(likeLogic);
	}

	public int unlikeLogic(LikeLogic likeLogic) {
		return dao.unlikeLogic(likeLogic);
	}

	public List<MyBand> searcingBandList(int bandNo, int amount, int pageNum, String searchingText, String selectType) {
		return dao.searcingBandList(bandNo, amount, pageNum, searchingText, selectType);
	}

	public int getSearchingTotal(int bandNo, String searchingText, String selectType) {
		return dao.getSearchingTotal(bandNo, searchingText, selectType);
	}

	public int reRplyLogic(Map<String, Object> paramMap) {
		return dao.reRplyLogic(paramMap);
		
	}

	public int boardCheck(int bandNo) {
		return dao.boardCheck(bandNo);
	}

	public List<MyBand> zeroBand(int bandNo) {
		return dao.zeroBand(bandNo);
	}
	
	
	
}
