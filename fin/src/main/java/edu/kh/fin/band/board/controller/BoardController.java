package edu.kh.fin.band.board.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.login.model.vo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.board.model.service.BoardService;

@Controller
//@RequestMapping("/board")
@SessionAttributes({"loginUser"})
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	   
	
	@GetMapping("/board")
		 public String BoardList(Model model) {
		List<BoardDetail> boardList = service.boardList();
		model.addAttribute("boardList",boardList);
		
		 
	
		
		return "board/boardMain";
		
	}
	
	
	
	
	
	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam("boardNo")int boardNo,
							  	Model model) {
		service.updateReadCount(boardNo);
		BoardDetail boardDetail = service.boardDetail(boardNo);
		model.addAttribute("BoardDetail" , boardDetail);
		
		
		return "board/boardDetail";
		
	}
	
	
	
	
	@GetMapping("/boardWrite")
	public String boardWriteFom() {
		
		
		
		return "board/boardWrite";
		
	}
	
	@PostMapping("/boardWrite")
	public String Write(@ModelAttribute Board board,
						@ModelAttribute("loginUser") User loginUser,
						RedirectAttributes ra) {
		
		board.setUserNo( loginUser.getUserNo()  );
		
		int writeResult = service.write(board);
		String message = null;
		
		if(writeResult>0) {
			
			message = "게시글이 등록되었습니다";
			ra.addFlashAttribute("message", message);
			return "redirect:/board";
		}else {
			message = "게시글 삽입 실패...";
			ra.addFlashAttribute("message", message);
			return "board/boardWrite";
		}
			
		
		
		
	}
	
	@GetMapping("/paging")
	public String paging(Model model,
						@RequestParam(value = "page",required = false, defaultValue = "1")int page	) {
		
	System.out.println("page=" + page);	
		
		return "index";
	}
	
	
	@GetMapping("/delete")
	public String delete(@RequestParam("boardNo")int boardNo
										, RedirectAttributes ra) {
		
		int deleteResult = service.delete(boardNo);
		String message = null;
		if(deleteResult>0) {
			
			message = "게시글이 삭제되었습니다";
			ra.addFlashAttribute("message", message);
			return "redirect:/board";
			
		}else {
			
			message = "삭제 실패...";
			ra.addFlashAttribute("message", message);
			return "redirect:/board";
		}
			
			
		
		
	
	}
	
	
	@GetMapping("/update")
	public String updateForm(@RequestParam("boardNo")int boardNo, 
											Model model,
											RedirectAttributes ra) {
		
		BoardDetail boardDetail = service.boardDetail(boardNo);
		model.addAttribute("board" , boardDetail);
		
		
		
		
		return "board/boardUpdate";
	}
	
	@PostMapping("/mody")
	public String boardUpdate(@ModelAttribute Board board,
								Model model,
								RedirectAttributes ra) {
		
		 int updateResult = service.boardUpdate(board);
	
		BoardDetail boardDetail = service.boardDetail(board.getBoardNo());
		
		model.addAttribute("BoardDetail",boardDetail);
		String message = null;
		if(updateResult>0) {
			message = "게시글이 수정되었습니다 ";
			ra.addFlashAttribute("message", message);
			return "board/boardDetail";
			
			
			
		}else {
			message = "수정실패... ";
			ra.addFlashAttribute("message", message);
			
			return "redirect:/board";
			
		}
		
	
		
	
			
	
			
	
		
	
	}
	
	

}
