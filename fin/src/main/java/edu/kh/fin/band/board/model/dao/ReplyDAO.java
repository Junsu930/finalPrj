package edu.kh.fin.band.board.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.login.model.vo.User;

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
	 * @param loginUser 
	 * @return result
	 */
	public int insertReply(Reply reply, User loginUser) {
		
		int insertReply = sqlSession.insert("replyMapper.insertReply", reply);
		
		
		// 누구에게 댓글을 단지 확인해야함 보드넘버를 바탕으로 글 작성자 유저넘버 가져오기
		// 왜냐하면 total_alarm 테이블에 to_user_no(글쓴 사람) from_user_no(댓글 단 사람 == LoginUser)
		// 정보를 가져와야함
		int toUserNo = sqlSession.selectOne("replyMapper.selectToUserNo", reply);
		reply.setToUserNo(toUserNo);
		if(insertReply > 0) {
			if(toUserNo != 0) {
				int result = sqlSession.insert("replyMapper.insertReplyAlarm", reply);
				return result;
			}else {
				return -1;
			}
			
		}else {
			return -1;
		}
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
