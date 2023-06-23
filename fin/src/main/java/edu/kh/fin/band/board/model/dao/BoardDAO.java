package edu.kh.fin.band.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int write(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.write",board);
	}

	public List<BoardDetail> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardList");
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



	
	
}
