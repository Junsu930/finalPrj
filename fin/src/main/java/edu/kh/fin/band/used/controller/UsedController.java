package edu.kh.fin.band.used.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.used.model.service.UsedService;
import edu.kh.fin.band.used.model.vo.UsedVo;


@Controller
@SessionAttributes({"loginUser"})
public class UsedController {

	@Autowired
	UsedService service;
	
	
	@GetMapping("/used")
	public String UsedMain() {
		
		return "used/usedMain";
	}
	
	
	@GetMapping("/usedDetail")
	public String useDetail(@RequestParam("usedBoard") int usedBoard, Model model) {
		
		UsedVo usedVo = service.useDetail(usedBoard);
		
		
		model.addAttribute("usedDetailVo", usedVo);
		
		return "used/usedDetail";
	}
		
	@GetMapping("/writeUsedThing")
	public String usedWriting() {
		
		return "usedWriting/usedWriting";
	}
		
	@GetMapping("/usedRoomScroll")
	@ResponseBody
	public String usedRoomScroll() {
		
		List<UsedVo> usedVo = service.usedRoomScroll();
		
		return new Gson().toJson(usedVo);
	}

	@GetMapping("/usedSearchingRoomScroll")
	@ResponseBody
	public String usedSearchingRoomScroll(@RequestParam("region") String region, @RequestParam("searchingText") String searchingText) {
		
	
		List<UsedVo> usedVo = service.usedSearchingRoomScroll(region, searchingText);
		
		return new Gson().toJson(usedVo);
	}
	
	@PostMapping("/writeUsedForm")
	public String writeUsedForm(@RequestParam Map<String,Object> map, @RequestParam("images") MultipartFile images,
			@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra) {
		
		
		map.put("userNo", loginUser.getUserNo());
		
		String status = (String)map.get("status");
		if(status.equals("used")) {
			map.put("status", "중고");
		}else {
			map.put("status", "새상품");
		}
		
		
		// 2) 이미지 저장 경로 얻어오기 (webPath, folderPath)
		String webPath = "/resources/images/used/";
		
		String folderPath = req.getSession().getServletContext().getRealPath(webPath);
		// c:\workspace\~~

		int writeResult = service.writeUsedForm(map, images, webPath,folderPath);
		
		if(writeResult > 0) {
			ra.addFlashAttribute("message", "게시글이 등록되었습니다.");
			return "redirect:/used/";
		}else {
			ra.addFlashAttribute("message", "게시글이 등록이 실패했습니다.");
			return "redirect:/used/";
		}
		
	}
	
	
	@PostMapping("/deleteUsedBoard")
	@ResponseBody
	public int deleteUsedBoard(@RequestParam("hiddenUsedBoardNo") int hiddenNo, RedirectAttributes ra) {
		
		int result = service.deleteUsedBoard(hiddenNo);
		
		return result;
		
		
		
	}
	
	
	
}




