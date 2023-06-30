package edu.kh.fin.band.board.controller;
   
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;
import edu.kh.fin.band.board.model.vo.PageVO;
import edu.kh.fin.band.login.model.vo.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.board.model.service.ReplyService;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.board.model.service.BoardService;

@Controller
//@RequestMapping("/board")
@SessionAttributes({"loginUser"})
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService rService;   
	
	@GetMapping("/board")
	
	public String BoardList(Model model, Criteria cri) {
	    int total = service.getTotal();
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardList = service.boardList(cri);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("pageVO", pageVO);
	    return "board/boardMain";
//		 public String BoardList(Model model) {
//
//		Criteria cri = new Criteria();
//		PageVO pageVO = new PageVO(cri, service.getTotal());
//		List<BoardDetail> boardList = service.boardList(cri);
//		model.addAttribute("boardList",service.boardList(cri));
//		model.addAttribute("pageVO",pageVO);
//		 
//	
//		
//		return "board/boardMain";
		
	}

	

	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam("boardNo")int boardNo,
							  	Model model,Criteria cri ) {
		service.updateReadCount(boardNo);
		BoardDetail boardDetail = service.boardDetail(boardNo);
		model.addAttribute("BoardDetail" , boardDetail);
		List<Reply> rList = rService.selectReplyList(boardNo);
		model.addAttribute("rList", rList);
		
		
	    int total = service.getTotal();
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardList = service.boardList(cri);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("pageVO", pageVO);
		
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
	
	/* addlike 증가하는 코드 */
	@GetMapping("/addLike")
	public String addLike(@RequestParam("boardNo")int boardNo,
							  @ModelAttribute("loginUser") User loginUser,
							  RedirectAttributes ra) {
		System.out.println("들어오는지 확인");
		System.out.println(boardNo);
		
		int likecheck = service.likeCheck(boardNo);
		
		if(likecheck > 0) {
			  return new Gson().toJson("좋아요 쌓임!");
		  } else {
			  return new Gson().toJson("ㄴㄴ");
		  }
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
