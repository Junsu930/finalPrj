package edu.kh.fin.band.myBand.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.common.pagination.CommonCriteria;
import edu.kh.fin.band.common.pagination.Pagination;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.service.MyBandService;
import edu.kh.fin.band.myBand.model.vo.LikeLogic;
import edu.kh.fin.band.myBand.model.vo.MyBand;
import edu.kh.fin.band.myBand.model.vo.MyBandReply;

@Controller
public class MyBandController {
	
	@Autowired
	MyBandService service;
	
	/** 밴드 보드 준수
	 * 
	 * @param bandNo
	 * @param amount
	 * @param pageNum
	 * @param loginUser
	 * @param model
	 * @return
	 */
	@GetMapping("/myBandBoard")
	public String myBandBoard(@RequestParam("bandNo") int bandNo,@RequestParam(value ="amount", defaultValue = "10") int amount,
			@RequestParam(value="pageNum", defaultValue = "1")int pageNum, HttpServletRequest req,  Model model ) {
		
		
		CommonCriteria cri = new CommonCriteria(pageNum, amount);
		
		Pagination pageVo = new Pagination(cri, service.getTotal(bandNo));
		
		List<MyBand> bandList = service.bandList(bandNo, amount, pageNum);
		
		String leaderNick = service.leaderNick(bandNo);
		
		HttpSession session = req.getSession();
		
		
		List<String> bandMember = service.bandMember(bandNo);
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			int bandUserFl = service.bandUserFl(bandNo, loginUser);
			
			if(bandUserFl > 0) { //멤버가 밴드 멤버가 맞으면
				model.addAttribute("memberFl", "T");
			}else {
				model.addAttribute("memberFl", "F");
			}
		}else { // 로그인 유저 없으면 
			model.addAttribute("memberFl", "F");
			
		}
		
		// 로그인 유저 검증
		
		model.addAttribute("leaderNick",leaderNick);
		
		model.addAttribute("bandList", bandList);
		
		model.addAttribute("memberList", bandMember);
		
		model.addAttribute("pageVo", pageVo);
		
		model.addAttribute("bandNo", bandNo);
		
		
		
		return "myBand/myBand";
	}
	
	
	/** 게시글 들어가기
	 * @param boardNo
	 * @param bandNo
	 * @param model
	 * @param req
	 * @return
	 */
	@PostMapping("/bandBoardDetail")
	public String bandBoardDetail(HttpServletResponse resp,@RequestParam("thisBoardNo") int boardNo, @RequestParam("thisBandNo")int bandNo, Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			int bandUserFl = service.bandUserFl(bandNo, loginUser);
			
			if(bandUserFl > 0) { //멤버가 밴드 멤버가 맞으면
				model.addAttribute("memberFl", "T");
			}else {
				model.addAttribute("memberFl", "F");
			}
		}else { // 로그인 유저 없으면 
			model.addAttribute("memberFl", "F");
			
		}
		
		// 조회수 쿠키 로직
		Cookie[] cookies = req.getCookies();
		boolean flag = false;
		if(cookies != null) {
			for(Cookie cookie : cookies) {
				
				if (cookie.getName().equals("visit_cookie")) {
					// 이미 있음
					flag= true;
					
					if(cookie.getValue().contains(""+boardNo)) {
					}else {						
						cookie.setValue(cookie.getValue() + "_" + (boardNo+""));
						cookie.setMaxAge(60 * 60 * 2);
						resp.addCookie(cookie);
						service.bandBoardCount(boardNo);
					}
				}
			}
		}else {
			Cookie newCookie = new Cookie("visit_cookie", boardNo+"");
			newCookie.setMaxAge(60 * 60 * 2);
			resp.addCookie(newCookie);
			service.bandBoardCount(boardNo);
		}
		
		if(loginUser != null) {
			// 좋아요 검증
			int result = service.likeCheck(boardNo, loginUser.getUserNo());
			
			if(result > 0) {
				// 결과가있으면 이미 좋아요를 했다.
				model.addAttribute("likeCheck","T");
			}else {
				model.addAttribute("likeCheck", "F");
			}
			
			if(flag == false) {
				Cookie newCookie = new Cookie("visit_cookie", boardNo+"");
				newCookie.setMaxAge(60 * 60 * 2);
				resp.addCookie(newCookie);
				service.bandBoardCount(boardNo);
			}
		}else {
			model.addAttribute("likeCheck", "F");
			// 로그인 안했으면 당연히 F다
		}
		
		
		MyBand board = service.bandBoardDetail(boardNo);

		model.addAttribute("boardDetail", board);
		
		return "myBand/myBandBoardDetail";
	}
	
	@PostMapping("/bandBoardWrite")
	public String bandBoardWrite(@RequestParam("hiddenBandNoForWrite") int bandNo, Model model) {
		
		
		model.addAttribute("bandNo", bandNo);
		
		return "myBand/myBandWrite";
	}
	
	@PostMapping("/writeBandBoard")
	public String writeBandBoard(Model model,@RequestParam("titleInputForBandBoard")String title ,@RequestParam("text") String text, @RequestParam(value="hiddenBandNo", required = false, defaultValue = "0") int bandNo, HttpServletRequest req, RedirectAttributes ra, @RequestParam("updateFlag") String updateFlag,
			@RequestParam("hiddenBoardNoForUpdateLogic") String boardNo) {
		
		if(updateFlag.equals("U")) {
			
			int intBoardNo = Integer.parseInt(boardNo);

			
			int result = service.updateBandBoard(title, text, intBoardNo);
			
			
			if(result > 0 ) {
				ra.addAttribute("message", "글이 수정되었습니다.");
			}else {
				ra.addAttribute("message", "수정을 실패했습니다.");
			}
			
			
			MyBand board = service.bandBoardDetail(intBoardNo);

			model.addAttribute("boardDetail", board);
			model.addAttribute("memberFl", "T");
			
			return "myBand/myBandBoardDetail";
			
		}else {	
			HttpSession session = req.getSession();
			
			int userNo = ((User)session.getAttribute("loginUser")).getUserNo();
			
			
			int result = service.writeBandBoard(title, text, bandNo, userNo);
			
			
			if(result > 0 ) {
				ra.addFlashAttribute("message", "글이 등록되었습니다.");
			}else {
				ra.addFlashAttribute("message", "등록을 실패했습니다.");
			}
			
			return "redirect:./myBandBoard?bandNo=" + bandNo;
		}
	}
	
	@PostMapping("/insertReplyForBandBoard")
	@ResponseBody
	public String insertReplyForBandBoard(@RequestParam("boardNo") int boardNo, @RequestParam("replyText") String replyText, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		replyText = Util.XSSHandling(replyText);
		replyText = Util.newLineHandling(replyText);
		
		int loginUserNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		int result = service.insertReplyForBandBoard(boardNo, loginUserNo ,replyText);
		
		return "성공";
		
	}
	
	@RequestMapping("/loadReplyForBandBoard")
	@ResponseBody
	public String loadReplyForBandBoard(@RequestParam("boardNo") int boardNo){
		
	
		List<MyBandReply> rList = service.loadReplyForBandBoard(boardNo);
		
		for(MyBandReply eachR : rList) {
			eachR.setReplyContent(Util.newLineClear(eachR.getReplyContent()));
			eachR.setReplyContent(Util.XSSClear(eachR.getReplyContent()));
		}
		
		
		return new Gson().toJson(rList);
	}
	
	
	@PostMapping("/updateBandBoardDetail")
	public String updateBandBoardDetail(@RequestParam("boardNoForUpdateBoardDetail") int boardNo, Model model) {
		
		MyBand detail = service.bandBoardDetail(boardNo);
		
		
		model.addAttribute("updateFlag", "U");
		
		model.addAttribute("updateDetail", detail);
		model.addAttribute("boardNo", boardNo);
		
		return "myBand/myBandWrite";
		
	}
	
	@PostMapping("/deleteBandBoardDetail")
	public String deleteBandBoardDetail(Model model,
			@RequestParam("boardNoForUpdateBoardDetail") int boardNo, @RequestParam("bandNoForUpdateBoardDetail") int bandNo,
			RedirectAttributes ra) {
		
		int result = service.deleteBandBoardDetail(boardNo);
		
		ra.addFlashAttribute("message", "게시글이 삭제되었습니다.");
		
		return "redirect:./myBandBoard?bandNo=" + bandNo;
		
	}
	
	/** 리플 수정 로직
	 * @param replyNo
	 * @param replyText
	 * @return
	 */
	@PostMapping("/updateReplyLogic")
	@ResponseBody
	public String updateReplyLogic(@RequestParam("replyNo") int replyNo, @RequestParam("replyText") String replyText) {
		
		int result = service.updateReplyLogic(replyNo, replyText);
		
		return "성공";
	}
	
	@PostMapping("/deleteReplyForBandBoard")
	@ResponseBody
	public String deleteReplyForBandBoard(@RequestParam("replyNo")int replyNo) {
		
		int result = service.deleteReplyForBandBoard(replyNo);
		
		return "성공";
	}
	
	@PostMapping("/likeLogic")
	@ResponseBody
	public String likeLogic(@ModelAttribute LikeLogic likeLogic) {

		return "";
	}
	
	@PostMapping("/unlikeLogic")
	@ResponseBody
	public String unlikeLogic(@ModelAttribute LikeLogic likeLogic) {

		return "";
	}
	
	
}
