package edu.kh.fin.band.searching.controller;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.searching.model.service.SearchingService;
import edu.kh.fin.band.searching.model.vo.Searching;

@SessionAttributes({"loginUser"})
@Controller
public class SearchingController {
	
	@Autowired
	private SearchingService service;
	
	@GetMapping("/setPosition")
	public String setPosition() {
		return "user/setPosition";
	}
	
	
	
	@GetMapping("/findingMember")
	public String findingMemberController(RedirectAttributes ra
											, HttpSession session
											, HttpServletRequest re
			
										) {
		
		String message = null;
		String path = null;
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		session = re.getSession();
		System.out.println(session.getAttribute("loginUser"));
		
		if(session.getAttribute("loginUser") != null) { // 로그인이 되어있는 경우
			
			System.out.println("로그인이 되어있음" +loginUser.getUserNo());
			
			int result = service.checkInfo(loginUser.getUserNo());
			
			System.out.println(result);
			
			
			if(result > 0) {// 작성이 되어있는 경우
				message = "";
				path = "finding/findingMember";
			} else { // 작성이 안되어 있는 경우
				message = "본인의 정보를 작성해주세요";
				path = "redirect:/setPosition";
			}
			
		} else {// 로그인이 안되어 있는경우
			
			message = "로그인을 해주세요";
			path = "redirect:/login";
			
			
		}
		
		ra.addFlashAttribute("msg", message);
		
		
		return path;
		
		
		
			
				
		
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
	
	@PostMapping("setPosition")
	public String setInfo(
			@RequestParam("gender") char gender,
			@RequestParam("region") String region,
			@RequestParam("inst") String inst,
			@RequestParam("genre") String genre, Model model, @ModelAttribute("loginUser") User loginUser
			,RedirectAttributes ra) {
		
		Searching setInfo = new Searching();
		
		setInfo.setGender(gender);
		setInfo.setGenre(genre);
		setInfo.setInst(inst);
		setInfo.setRegion(region);
		setInfo.setUserNo(loginUser.getUserNo());
		
		int Info = service.setInfo(setInfo);
		
		String message = null;
		String path = null;
		
		if(Info >0) {
			message = "입력 완료 이제 멤버를 찾아보세요";
			path = "redirect:/findingMember";
			
		} else {
			message = "입력 오류";
			path = "redirect:/setPosition";
		}
		
		ra.addFlashAttribute("msg", message);
		
		return path;
		
	}

	
	
}
