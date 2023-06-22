package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.board.model.dao.BoardDAO;
import edu.kh.fin.band.board.model.service.BoardService;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
@Service
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	private BoardDAO dao;

	@Override
	public int write(Board board) {
		// TODO Auto-generated method stub
		return dao.write(board);
	}

	@Override
	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return dao.boardList();
	}

	@Override
	public Board boardDetail(int boardNo) {
		// TODO Auto-generated method stub
		return dao.boardDetail(boardNo);
	}

	@Override
	public void updateReadCount(int boardNo) {
		dao.updateReadCount(boardNo);
		
	}

	@Override
	public void delete(int boardNo) {
		dao.delete(boardNo);
		
	}

	@Override
	public void boardUpdate(Board board) {
		// TODO Auto-generated method stub
		dao.boardUpdate(board);
	}



	
	
	
}
