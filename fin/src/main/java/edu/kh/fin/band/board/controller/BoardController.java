package edu.kh.fin.band.board.controller;
   
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.board.model.service.BoardService;
import edu.kh.fin.band.board.model.service.ReplyService;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;
import edu.kh.fin.band.board.model.vo.PageVO;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.login.model.vo.User;

@Controller
//@RequestMapping("/board")
@SessionAttributes({"loginUser"})
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private ReplyService rService;   
	
	@GetMapping("/board")
	
	public String BoardList(Model model, Criteria cri,
							@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
							@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword) {
	    int total = service.getTotal(cri);
	   
	   
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
							  	Model model,Criteria cri ,
							  	@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
							    @RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
							  	) {
		service.updateReadCount(boardNo);
		BoardDetail boardDetail = service.boardDetail(boardNo);
		model.addAttribute("BoardDetail" , boardDetail);
		List<Reply> rList = rService.selectReplyList(boardNo);
		model.addAttribute("rList", rList);
		
		
	    int total = service.getTotal(cri);
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardList = service.boardList(cri,searchType,keyword);
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
										,RedirectAttributes ra) {
		
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
	
	
	/**
	 * 좋아요 등록 + 좋아요 알람
	 * @author lee
	 * @param boardNo
	 * @param loginUser
	 * @return
	 */
	@PostMapping("/addLike")
	@ResponseBody
	public String boardDetailLike(
			@RequestParam("boardNo") int boardNo,
			@RequestParam("userNo") int userNo,
			@RequestParam("loginUserNo") int loginUserNo) {
		
		
		HashMap<String,Object> map = new HashMap<>();
		
		System.out.println("addLike!!!");
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		map.put("loginUserNo", loginUserNo);
		
		System.out.println("lognUserNo" + map.get("loginUserNo"));
		
		int result = service.boardDetailLike(map);
		
		System.out.println(result + "result!!!!!!");
		if(result > 0) {
			  return new Gson().toJson(result);
		} 
		else {
			  return new Gson().toJson("좋아요 실패 ㅠㅠ");
		}
	}
	
	
	/**
	 * 좋아요 취소 + 좋아요 알람 취소
	 * @author lee
	 * @param boardNo
	 * @param loginUser
	 * @return
	 */
	@PostMapping("/removeLike")
	@ResponseBody
	public String removeLike(
			@RequestParam("boardNo") int boardNo,
			@RequestParam("userNo") int userNo,
			@RequestParam("loginUserNo") int loginUserNo) {
		
		HashMap<String,Object> map = new HashMap<>();
		System.out.println("removeLike!!!");
		
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		map.put("loginUserNo", loginUserNo);
		
		System.out.println("lognUserNo removeLike" + map.get("loginUserNo"));
		
		int result = service.removeLike(map);
		
		
		if(result > 0) {
			  return new Gson().toJson(result);
		} 
		else {
			  return new Gson().toJson("좋아요 없애기 실패 ㅠㅠ");
		}
	}
	

	

}