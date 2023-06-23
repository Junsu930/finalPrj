package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;

public interface BoardService {

	int write(Board board);

	List<BoardDetail> boardList();

	BoardDetail boardDetail(int boardNo);

	void updateReadCount(int boardNo);

	int delete(int boardNo);

	int boardUpdate(Board board);



	



}
