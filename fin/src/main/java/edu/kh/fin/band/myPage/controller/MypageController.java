package edu.kh.fin.band.myPage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
			, @ModelAttribute("loginMember") User loginUser
			,@RequestParam("gender") char gender,
			@RequestParam("region") String region,
			@RequestParam("inst") String inst,
			@RequestParam("genre") String genre, Model model,@RequestParam("uploadImage") MultipartFile uploadImage
			,HttpServletRequest req, /* 파일 저장 경로 탐색용 */
			RedirectAttributes ra) throws IOException{
		
		Searching updateInfo = new Searching();
		
		String webPath = "/resources/images/memberProfile/";
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		
		updateInfo.setGender(gender);
		updateInfo.setGenre(genre);
		updateInfo.setInst(inst);
		updateInfo.setRegion(region);
		
		
		
		paramMap.put("userNo", loginUser.getUserNo());
		paramMap.put("userPw", loginUser.getUserPw());
		paramMap.put("gender", updateInfo.getGender());
		paramMap.put("genre", updateInfo.getGenre());
		paramMap.put("inst", updateInfo.getInst());
		paramMap.put("region", updateInfo.getRegion());
		paramMap.put("webPath", webPath);
		paramMap.put("folderPath", folderPath);
		paramMap.put("uploadImage", uploadImage);
		
		
		int result = service.updateInfo(paramMap);
		
		
		
		return null;
		}
	
}
