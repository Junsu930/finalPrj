package edu.kh.fin.band.myBand.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.fin.band.common.pagination.CommonCriteria;
import edu.kh.fin.band.common.pagination.Pagination;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myBand.model.service.MyBandService;
import edu.kh.fin.band.myBand.model.vo.MyBand;

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
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		List<String> bandMember = service.bandMember(bandNo);
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
	
	
	@PostMapping("/bandBoardDetail")
	public String bandBoardDetail(@RequestParam("boardNo") int boardNo, @RequestParam("bandNo")int bandNo) {
		return "";
	}
	
	@PostMapping("/bandBoardWrite")
	public String bandBoardWrite() {
		return "myBand/myBandWrite";
	}

}
