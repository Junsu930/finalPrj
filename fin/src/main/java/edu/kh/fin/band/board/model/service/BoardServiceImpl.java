package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.board.model.dao.BoardDAO;
import edu.kh.fin.band.board.model.service.BoardService;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;
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
	public List<BoardDetail> boardList(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.boardList(cri);
	}

	@Override
	public BoardDetail boardDetail(int boardNo) {
		// TODO Auto-generated method stub
		return dao.boardDetail(boardNo);
	}

	@Override
	public void updateReadCount(int boardNo) {
		dao.updateReadCount(boardNo);
		
	}

	@Override
	public int  delete(int boardNo) {
		return dao.delete(boardNo);
		
	}

	@Override
	public int boardUpdate(Board board) {
		// TODO Auto-generated method stub
		 return dao.boardUpdate(board);
	}

	@Override
	public int getTotal() {
		// TODO Auto-generated method stub
		return dao.getTotal();
	}

	@Override
	public List<BoardDetail> boardTalk(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.boardTalk(cri);
	}



	
	
	
}
