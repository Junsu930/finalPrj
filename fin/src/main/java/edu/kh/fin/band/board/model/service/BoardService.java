package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.List;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;

public interface BoardService {

	int write(Board board);

	List<BoardDetail> boardList(Criteria cri, String searchType, String keyword);

	BoardDetail boardDetail(int boardNo);

	void updateReadCount(int boardNo);

	int delete(int boardNo);

	int boardUpdate(Board board);

	int getTotal(Criteria cri);

	List<BoardDetail> boardTalk(Criteria cri);

	List<BoardDetail> boardQus(Criteria cri);

	List<BoardDetail> boardAll(Criteria cri);

	int likeCheck(int boardNo);

	List<BoardDetail> boardList(Criteria cri);






	



}
