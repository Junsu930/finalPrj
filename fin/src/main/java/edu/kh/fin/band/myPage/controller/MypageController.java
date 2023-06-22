package edu.kh.fin.band.myPage.controller;

import java.io.IOException;
import java.util.Map;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.service.MyPageService;
import edu.kh.fin.band.searching.model.vo.Searching;

@Controller
@SessionAttributes({"loginUser"})
public class MypageController {
	
	
	@Autowired 
	private MyPageService service;
	
	
	
	
	@GetMapping("/myPage")
	public String myPageController() {
		
		return "myPage/myPage";
	}
	
	
	@PostMapping("fin/updateInfo")
	public String updateInfo(@RequestParam Map<String, Object> paramMap
			, @ModelAttribute("loginUser") User loginUser
			,@RequestParam("region") String region,
			@RequestParam("inst") String inst,
			@RequestParam("genre") String genre, Model model,@RequestParam("uploadImage") MultipartFile uploadImage
			,HttpServletRequest req, /* 파일 저장 경로 탐색용 */
			RedirectAttributes ra, HttpSession session
			, HttpServletRequest re) throws IOException{
		
		
		Searching updateInfo = new Searching();
		
		String webPath = "/resources/images/profileImage/";
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		session = re.getSession();
		
		updateInfo.setGenre(genre);
		updateInfo.setInst(inst);
		updateInfo.setRegion(region);
		
		System.out.println("세션검사" + session.getAttribute("loginUser"));
		System.out.println("세션검사2" +loginUser.getUserNo() );
		System.out.println("입력검사" + loginUser.getUserEmail());
		System.out.println("입력검사2" + loginUser.getUserNick());

		paramMap.put("userPw", loginUser.getUserPw());
		paramMap.put("userNo", loginUser.getUserNo());
		paramMap.put("gender", updateInfo.getGender());
		paramMap.put("genre", updateInfo.getGenre());
		paramMap.put("inst", updateInfo.getInst());
		paramMap.put("region", updateInfo.getRegion());
		paramMap.put("webPath", webPath);
		paramMap.put("folderPath", folderPath);
		paramMap.put("uploadImage", uploadImage);
		
		int allResult = 0;
		
		int img = service.updateImg(paramMap, loginUser);
		System.out.println("이미지 변경" + img);
		
		int info = service.updateInfo(paramMap);
		System.out.println("info변경" + info);
		
		int position = service.updatePosition(paramMap);
		System.out.println("포지션 변경" + position);
		
		int changePw = service.changePw(paramMap);
		System.out.println("비밀번호 변경" + changePw );
		
		allResult = img + info + position + changePw;
		
		String message = null;
		
		if(allResult == 4) {
			message = "회원 정보 변경 완료";
		} else {
			message = "회원 정보 변경 실패";
		}
		
		ra.addFlashAttribute("msg", message);
		return "redirect:/myPage";
	}
	
}
