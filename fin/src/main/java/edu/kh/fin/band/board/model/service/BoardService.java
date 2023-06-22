package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;

public interface BoardService {

	int write(Board board);

	List<Board> boardList();

	Board boardDetail(int boardNo);

	void updateReadCount(int boardNo);

	void delete(int boardNo);

	void boardUpdate(Board board);



	



}
