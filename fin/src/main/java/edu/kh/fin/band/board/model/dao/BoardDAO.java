package edu.kh.fin.band.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.board.model.vo.Board;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int write(Board board) {
		// TODO Auto-generated method stub
		return sqlSession.insert("boardMapper.write",board);
	}

	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("boardMapper.boardList");
	}

	
	
}
