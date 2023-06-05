package edu.kh.fin.band.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	@GetMapping("/board")
	public String boardController() {
		
		return "board/boardDetail";
		
	}
	
	@GetMapping("/boardDetail")
	public String boardDetailController() {
		
		return "board/boardDetail";
		
	}

}
