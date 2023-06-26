package edu.kh.fin.band.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.board.model.vo.Reply;

@Repository
public class ReplyDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 댓글 목록 조회 서비스 DAO
	 * @param boardNo
	 * @return rList
	 */
	public List<Reply> selectReplyList(int boardNo) {
		
		return sqlSession.selectList("replyMapper.selectReplyList", boardNo);
	}

	/** 댓글 등록 DAO
	 * @param reply
	 * @return result
	 */
	public int insertReply(Reply reply) {
		
		return sqlSession.insert("replyMapper.insertReply", reply);
	}
	

	/** 댓글 삭제 DAO
	 * @param replyNo
	 * @return result
	 */
	public int deleteReply(int replyNo) {
		return sqlSession.update("replyMapper.deleteReply", replyNo);
	}

	
	/** 댓글 수정 DAO
	 * @param reply
	 * @return result
	 */
	public int updateReply(Reply reply) {
		return sqlSession.update("replyMapper.updateReply", reply);
	}
		
}
