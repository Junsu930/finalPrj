package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import edu.kh.fin.band.board.model.vo.Board;

public interface BoardService {

	int write(Board board);

	List<Board> boardList();



}
