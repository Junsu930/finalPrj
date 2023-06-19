package edu.kh.fin.band.searching.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.searching.model.service.SearchingService;
import edu.kh.fin.band.searching.model.vo.Searching;

@SessionAttributes({"loginUser"})
@Controller
public class SearchingController {
	
	@Autowired
	private SearchingService service;
	
	
	
	
	@GetMapping("/findingMember")
	public String findingMemberController(RedirectAttributes ra, HttpSession session) {
		
		if(session.getAttribute("loginUser") == null) {
			ra.addFlashAttribute("msg", "로그인을 먼저 해주세요!");
			return "redirect:/login"; // 로그인 되어있지 않은 경우 
		}else {
			return "finding/findingMember"; // 로그인 되어있는 경우 
		}
	}
	
	
//	잠깐 페이지 거쳐가는 로더 페이지
	@GetMapping("/findingLoder")
	public String findingLoderController() {
		
		System.out.println("잠깐 거쳐가기");
		
		return "finding/findingLoder";
	}
	
	
	
	
	
	/** 
	 * 조건에 맞는 멤버 찾기 Controller
	 * @author lee
	 * @param gender
	 * @param region
	 * @param inst
	 * @param genre
	 * @param model
	 * @return
	 */
	@PostMapping("/checkSelect")
	public String showMemberList(
			@RequestParam("gender") char gender,
			@RequestParam("region") String region,
			@RequestParam("inst") String inst,
			@RequestParam("genre") String genre, Model model, @ModelAttribute("loginUser") User loginUser) {
		
		
		Searching searching = new Searching();
		
		searching.setGender(gender);
		searching.setGenre(genre);
		searching.setRegion(region);
		searching.setInst(inst);
		searching.setUserNo(loginUser.getUserNo());
		
		
		
		
		System.out.println(searching.toString() + "Controller");
		
		
		
		
		List<Searching> memberList = service.checkSelect(searching);
		
	
		System.out.println(memberList + "test Controller");
		
		model.addAttribute("memberList", memberList);
		
		return "finding/memberList";
	}
}
