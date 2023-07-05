package edu.kh.fin.band.board.controller;
   
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardBanned;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Criteria;
import edu.kh.fin.band.board.model.vo.PageVO;
import edu.kh.fin.band.login.model.vo.User;

import org.apache.ibatis.reflection.SystemMetaObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
							@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
							,HttpSession session,
							BoardBanned boardBanned) {
	    int total = service.getTotal(cri);
	
	   
	    PageVO pageVO = new PageVO(cri, total);
	    List<BoardDetail> boardList = service.boardList(cri);
	    
	    
		User user =(User)session.getAttribute("loginUser");

	    model.addAttribute("boardList", boardList);
	    model.addAttribute("pageVO", pageVO);
	    if(user==null) {
	    	
	    	
	    }else {
	    boardBanned.setUserNo(user.getUserNo());
	    List<String> bannedUserIds = service.bannedUserIds(boardBanned);
	  	
	  
	   
	    model.addAttribute("bannedUserIds", bannedUserIds);

	    }
	    
	    return "board/boardMain";

		
	}


    @RequestMapping(value="/report", method=RequestMethod.POST)
    public String reportUser(BoardBanned boardBanned, 
			@RequestParam(value = "bannedUserNo") int bannedUserNo,
			
			@RequestParam(value = "bannedUserNick")String bannedUserNick,
    		HttpSession session
    						) {
    	User user =(User)session.getAttribute("loginUser");
    if(user==null) {
    	
    	
    }else {
    	
   	 boardBanned.setUserNo(user.getUserNo());
       service.reportUser(boardBanned);

       
    	
    }
    	 
    
        return "board/boardMain";
    }

	@GetMapping("/boardDetail")
	public String boardDetail(@RequestParam("boardNo")int boardNo,
								Model model, Criteria cri,
								@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
								@RequestParam(value = "keyword",required = false, defaultValue = "") String keywor
								,HttpSession session,
								@RequestParam(value = "loginUserNo", required = false, defaultValue = "0") int loginUserNo,
							    HttpServletRequest req, HttpServletResponse resp 
							    ) {
		
		// 세션이 있는지 없는지
					// 세션이 있으면 memberNo 세팅
					User loginUser = new User(); // @ModelAttribute("loginUser") User loginUser,
		BoardDetail boardDetail = service.boardDetail(boardNo);
					int memberNo = 0;
					if(loginUser != null) {
						memberNo = loginUser.getUserNo();
					}
			
					// 글쓴이와 현재 클라이언트가 같은지 아닌지 
					if( boardDetail.getUserNo() != memberNo ) {
						// 같지 않으면 -> 조회수 증가
						
						// 쿠키가 있는지 없는지
						//	있다면 쿠키 이름이 "readBoardNo" 있는지 ?
						//  없다면 만들어라
						//  있다면 쿠키에 저장된 값 뒤쪽에 현재 조회된 게시글 번호를 추가
						//	-> 단, 기존 쿠키값에 중복되는 번호 없어야함.
						
						Cookie cookie = null; // 기존에 존재하던 쿠키를 저장하는 변수
						
						Cookie[] cArr = req.getCookies(); // 쿠키 얻어오기
						
						if(cArr != null && cArr.length > 0) { // 얻어온 쿠키가 있을 경우
							for(Cookie c : cArr) {
								
								// 얻어온 쿠키중 이름이 "readBoardNo"가 있으면 얻어오기
								if(c.getName().equals("readBoardNo")) {
									cookie = c;
								}
							}
						}
						
						int result = 0;
						
						if (cookie == null) { // 기존에 "readBoardNo" 이름의 쿠키가 없던 경우
							
							cookie = new Cookie("readBoardNo", boardNo+"");
							result = service.updateReadCount(boardNo);// 조회 수 증가 서비스 호출
							
						} else { // 기존에 "readBoardNo" 이름의 쿠키가 있던 경우
							// "readBoardNo"  :   "1/2/3/5/30/500" + / + boardNo
							// -> 쿠키에 저장된 값 뒤쪽에 현재 조회된 게시글 번호 추가
							
							String[] temp = cookie.getValue().split("/");
							
							List<String> list = Arrays.asList(temp); // 배열 -> List 변환
							
							if(list.indexOf(boardNo+"") == -1) { // 기존 값에 같은 글번호가 없다면 추가
								cookie.setValue( cookie.getValue() + "/" + boardNo );
								result = service.updateReadCount(boardNo);// 조회 수 증가 서비스 호출
								
							}
							
						}
						
						// 이미 조회된 데이터 DB와 동기화
						if(result > 0) {
							
							boardDetail.setReadCount( boardDetail.getReadCount() + 1 );
							
							cookie.setPath(req.getContextPath());
							cookie.setMaxAge(60 * 60 * 1); // + 쿠키 maxAge 1시간
							resp.addCookie(cookie);
						}
						
					}
					model.addAttribute("BoardDetail" , boardDetail);
					List<Reply> rList = rService.selectReplyList(boardNo);
					model.addAttribute("rList", rList);
					
					 // 내가 좋아요 한지 안한지 체크 
				    boardDetail.setBoardNo(boardNo);
				    boardDetail.setLoginUserNo(loginUserNo);
				    
				   
				    
				    int result = service.checkLike(boardDetail);
				    
				    
				    
				    if(result > 0) {
				    	model.addAttribute("likeck", "T");
				    }else {
				    	model.addAttribute("likeck", "F");
				    }
					
					
				  	int total = service.getTotal(cri);
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
											Model model,Criteria cri,
											RedirectAttributes ra) {
		
		BoardDetail boardDetail = service.boardDetail(boardNo);
		model.addAttribute("board" , boardDetail);
		
		
	 	
		
		return "board/boardUpdate";
	}
	
	
	@PostMapping("/mody")
	public String boardUpdate(@ModelAttribute Board board,
								Model model,Criteria cri,
								RedirectAttributes ra) {
		
		 int updateResult = service.boardUpdate(board);
	
		 BoardDetail boardDetail = service.boardDetail(board.getBoardNo());
		
		model.addAttribute("BoardDetail",boardDetail);
		String message = null;
		if(updateResult>0) {
			message = "게시글이 수정되었습니다 ";
			ra.addFlashAttribute("message", message);
			
			
			int total = service.getTotal(cri);
		  	PageVO pageVO = new PageVO(cri, total);
		    List<BoardDetail> boardList = service.boardList(cri);
		    model.addAttribute("boardList", boardList);
		    model.addAttribute("pageVO", pageVO);
			
			
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
		
		
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		map.put("loginUserNo", loginUserNo);
		
		
		int result = service.boardDetailLike(map);
		
		
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
		
		
		map.put("boardNo", boardNo);
		map.put("userNo", userNo);
		map.put("loginUserNo", loginUserNo);
		
	
		
		int result = service.removeLike(map);
		
		
		if(result > 0) {
			  return new Gson().toJson(result);
		} 
		else {
			  return new Gson().toJson("좋아요 없애기 실패 ㅠㅠ");
		}
	}
	
	
	

	

}