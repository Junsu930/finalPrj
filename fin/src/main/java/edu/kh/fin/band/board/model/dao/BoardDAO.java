package edu.kh.fin.band.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardBanned;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int write(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.write",board);
	}

	public List<BoardDetail> boardList(Criteria cri, String searchType, String keyword) {
		// TODO Auto-generated method stub
		
		  HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  
		
		  data.put("cri", cri);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		 return sqlSession.selectList("boardMapper.boardList",data);
	}

	public BoardDetail boardDetail(int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.boardDetail",boardNo);
	}

	public void updateReadCount(int boardNo) {
		// TODO Auto-generated method stub
		sqlSession.update("boardMapper.updateReadCount",boardNo);
	}
	
	

	public int delete(int boardNo) {
		return sqlSession.delete("boardMapper.delete",boardNo);
		
	}

	public int  boardUpdate(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.update("boardMapper.boardUpdate",board);
	}

	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.getTotal",cri);
	}

	public List<BoardDetail> boardTalk(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardTalk",cri);
	}

	public List<BoardDetail> boardQus(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardQus",cri);
	}

	public List<BoardDetail> boardAll(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardAll",cri);
	}

	public List<BoardDetail> boardList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardList",cri);
	}


	public Object reportUser(BoardBanned boardBanned) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.reportUser",boardBanned);
	}

	public List<String> bannedUserIds(BoardBanned boardBanned) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.bannedUserIds",boardBanned);
	}
	/**
	 * 좋아요 등록 + 좋아요 알람
	 * @author lee
	 * @param boardNoz
	 * @param loginUser
	 * @return
	 */
	public int boardDetailLike(HashMap<String, Object> map) {
		
		
		
		int result = sqlSession.update("boardMapper.boardDetailLike", map); // 좋아요 등록
		
		
		
		if(result > 0) { // 좋아요 보드 테이블에 들어갔을 시, 좋아요 테이블 등록 
			result = sqlSession.insert("boardMapper.addLike", map);
			if(result > 0) {
				result = sqlSession.insert("alaramMapper.addLike", map); // 좋아요 알람 등록
				if(result > 0) {
					return result = sqlSession.selectOne("boardMapper.countLike", map); // 좋아요 테이블에서 좋아요갯수 가져오기
				}else {
					return 0;
				}
			}else {
				return 0;
			}
		}else {  
			return 0;
		}
		
	}

	
	
	/**
	 * 좋아요 취소 + 좋아요 알람 취소
	 * @author lee
	 * @param boardNo
	 * @param loginUser
	 * @return
	 */
	public int removeLike(HashMap<String, Object> map) {
		
		int result = sqlSession.update("boardMapper.removeLike", map); // 보드 디테일 테이블 좋아요 카운트 -1
		
		System.out.println("removeLike <!-- 좋아요 취소 --> " + result);
		
		if(result > 0) { // 보드 디테일 테이블 좋아요 카운트 -1, 좋아요 테이블 좋아요 삭제
			result = sqlSession.delete("boardMapper.removeLikeFromLikeTable", map);
			System.out.println("removeLike <!-- 좋아요 테이블 좋아요 삭제 --> " + result);
			if(result >0) {
				result = sqlSession.delete("alaramMapper.removeLikeFromLikeAlarm", map); // 알람테이블 좋아요 삭제
				System.out.println("removeLike <!-- 좋아요 알람 삭제 --> " + result);
				if(result > 0) {
					result = sqlSession.selectOne("boardMapper.countLike", map); // 삭제 후 좋아요 알람 갯수 가져오기
					if(result ==0) {
						return 1; // 만약 좋아요 갯수가 총 0개라면 0을 리턴하기에 에러가 남
					}else {
						return result;
					}
					
				}else {
					return 0;
				}
			}else {
				return 0;
			}
		}
		return 0;

	}




	
	
}