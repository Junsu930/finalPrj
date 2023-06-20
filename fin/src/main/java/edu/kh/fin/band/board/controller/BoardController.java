package edu.kh.fin.band.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.login.model.vo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import edu.kh.fin.band.board.model.service.BoardService;

@Controller
@SessionAttributes({"loginUser"})
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	
	
	@GetMapping("/board")
		 public String BoardList(Model model) {
		List<Board> boardList = service.boardList();
		model.addAttribute("boardList",boardList);
		
		 
	
		
		return "board/boardMain";
		
	}
	
	
	
	
	
	@GetMapping("/boardDetail")
	public String boardDetailController() {
		
		return "board/boardDetail";
		
	}
	
	
	
	
	@GetMapping("/boardWrite")
	public String boardWriteFom() {
		
		
		
		return "board/boardWrite";
		
	}
	
	@PostMapping("/boardWrite")
	public String Write(@ModelAttribute Board board,
			@ModelAttribute("loginUser") User loginUser) {
		board.setUserNo( loginUser.getUserNo()  );
		int writeResult = service.write(board);
		if(writeResult>0) {
			System.out.println("성공" + board.getBoardTitle());
			System.out.println("성공" + board.getBoardContent());
			System.out.println("성공" + board.getUserNo());
			return "redirect:/board/";
		}else {
			System.out.println("실패 " + board.getBoardTitle());
			System.out.println("실패 " + board.getBoardContent());
			System.out.println("성공" + board.getUserNo());
			return "board/boardWrite";
		}
		
		
		
		
	}

}
