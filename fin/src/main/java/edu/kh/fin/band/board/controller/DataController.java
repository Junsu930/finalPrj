package edu.kh.fin.band.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import edu.kh.fin.band.board.model.service.BoardService;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;
import edu.kh.fin.band.board.model.vo.PageVO;

@RestController
public class DataController {
	
	@Autowired
	private BoardService service;
	
	

	@GetMapping("/boardTalk")
	public String boardTalk(Criteria cri ) {
	    int total = service.getTotal(cri);
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardTalk = service.boardTalk(cri);
	    return new Gson().toJson(boardTalk);
	}
	
	
	
	@GetMapping("/boardQus")
	public String boardQus(Criteria cri ) {
	    int total = service.getTotal(cri);
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardQus = service.boardQus(cri);
	    return new Gson().toJson(boardQus);
	}
	
	@GetMapping("/boardAll")
	public String boardAll(Criteria cri ) {
	    int total = service.getTotal(cri);
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardAll = service.boardAll(cri);
	    return new Gson().toJson(boardAll);
	}
	
}
