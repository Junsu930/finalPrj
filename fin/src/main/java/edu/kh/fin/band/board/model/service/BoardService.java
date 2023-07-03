package edu.kh.fin.band.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardBanned;
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

	List<BoardDetail> boardList(Criteria cri);

	void reportUser(BoardBanned boardBanned);

	List<String> bannedUserIds(BoardBanned boardBanned);

	/**
	 * 좋아요 등록 + 좋아요 알람
	 * @author lee
	 * @param boardNo
	 * @param loginUser
	 * @return
	 */
	int boardDetailLike(HashMap<String, Object> map);

	/**
	 * 좋아요 취소 + 좋아요 알람 취소
	 * @author lee
	 * @param boardNo
	 * @param loginUser
	 * @return
	 */
	int removeLike(HashMap<String, Object> map);









}