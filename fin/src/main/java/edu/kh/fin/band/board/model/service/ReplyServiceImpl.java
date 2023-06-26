package edu.kh.fin.band.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.board.model.dao.ReplyDAO;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.common.Util;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO dao;

	// 댓글 목록 조회 서비스 구현
	@Override
	public List<Reply> selectReplyList(int boardNo) {
		
		return dao.selectReplyList(boardNo);
	}

	// 댓글 등록 서비스 구현
	@Override
	public int insertReply(Reply reply) {
		
		// xss, 개행문자처리
		reply.setReplyContent( Util.XSSHandling( reply.getReplyContent()) );
		reply.setReplyContent( Util.newLineHandling( reply.getReplyContent()) );
		
		return dao.insertReply(reply);
	}
	

	// 댓글 삭제 서비스 구현
	@Override
	public int deleteReply(int replyNo) {
		return dao.deleteReply(replyNo);
	}

	// 댓글 수정 서비스 구현
	@Override
	public int updateReply(Reply reply) {
		
		// XSS, 개행문자 처리
		reply.setReplyContent(  Util.XSSHandling( reply.getReplyContent() )  );
		reply.setReplyContent(  Util.newLineHandling( reply.getReplyContent() )  );
		
		return dao.updateReply(reply);
	}
	
	
	
	
}
