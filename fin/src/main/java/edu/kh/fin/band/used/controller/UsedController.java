package edu.kh.fin.band.used.controller;

import java.util.ArrayList;
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

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.used.model.service.UsedService;
import edu.kh.fin.band.used.model.vo.UsedImage;
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
		
		List<UsedImage> imageList = service.imageList(usedBoard);
		
		model.addAttribute("usedDetailVo", usedVo);
		model.addAttribute("imageList", imageList);
		
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
	public String writeUsedForm(@RequestParam Map<String,Object> map, @RequestParam(value = "images", required = false) List<MultipartFile> images,
			@ModelAttribute("loginUser") User loginUser, HttpServletRequest req, RedirectAttributes ra) {
		
		if(map.get("hiddenUpdateVal") == null) { // 삽입일 경우
			
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
				ra.addFlashAttribute("message", "게시글 등록이 실패했습니다.");
				return "redirect:/used/";
			}
		}else { // 수정일 경우
			
			map.put("userNo", loginUser.getUserNo());
			
			System.out.println(map);
			System.out.println(map.get("xImages"));
			
			String status = (String)map.get("status");
			if(status.equals("used")) {
				map.put("status", "중고");
			}else {
				map.put("status", "새상품");
			}
			
		
			int imageSize=0;
			
			for(int i = 0; i < images.size(); i++) {
				// 각 이미지들의 용량을 합친다.
				imageSize += images.get(i).getSize();
			}
			
			if(imageSize != 0) { // 만약 수정된 부분이 있으면, 새로운 이미지가 들어왔으면
				
				// 2) 이미지 저장 경로 얻어오기 (webPath, folderPath)
				String webPath = "/resources/images/used/";
				
				String folderPath = req.getSession().getServletContext().getRealPath(webPath);
				// c:\workspace\~~
				
				int updateResult = service.updateUsedForm(map, images, webPath,folderPath);
				
				if(updateResult > 0) {
					ra.addFlashAttribute("message", "게시글이 수정되었습니다.");
					return "redirect:/usedDetail?usedBoard=" + map.get("hiddenUpdateVal");
				}else {
					ra.addFlashAttribute("message", "게시글 수정이 실패했습니다.");
					return "redirect:/usedDetail?usedBoard=" + map.get("hiddenUpdateVal");
				}
			}else{
				int updateResult = service.updateUsedForm(map);
				
				if(updateResult > 0) {
					ra.addFlashAttribute("message", "게시글이 수정되었습니다.");
					return "redirect:/usedDetail?usedBoard=" + map.get("hiddenUpdateVal");
				}else {
					ra.addFlashAttribute("message", "게시글 수정이 실패했습니다.");
					return "redirect:/usedDetail?usedBoard=" + map.get("hiddenUpdateVal");
					
				}
			}
		}	
	}
	
	
	@PostMapping("/deleteUsedBoard")
	@ResponseBody
	public int deleteUsedBoard(@RequestParam("hiddenUsedBoardNo") int hiddenNo, RedirectAttributes ra) {
		
		int result = service.deleteUsedBoard(hiddenNo);
		
		return result;
		
	}
	
	@PostMapping("/updateUsedBoard")
	public String updateUsedBoard(@RequestParam("usedBoardNoValue") int boardNo, Model model) {
		
		model.addAttribute("flag", "update");
		
		UsedVo usedVo = service.useDetail(boardNo);
		
		usedVo.setBoardContent(Util.XSSClear(usedVo.getBoardContent()));
		usedVo.setBoardContent(Util.newLineClear(usedVo.getBoardContent()));
		
		List<UsedImage> imageList = service.imageList(boardNo);
		
		model.addAttribute("updateVo", usedVo);
		model.addAttribute("imageList", imageList);
		
		return "usedWriting/usedWriting";
	}
	
	@PostMapping("/completeSelling")
	public String completeSelling(@RequestParam("boardNoForCompleteSelling") int boardNo,RedirectAttributes ra) {
		
		int result = service.completeSelling(boardNo);
		
		
		if(result>0) {
			ra.addFlashAttribute("message", "판매완료 처리되었습니다.");
		}else {
			ra.addFlashAttribute("message", "판매완료 처리 실패");
		}
		
		return "redirect:/usedDetail?usedBoard=" + boardNo;
	}
	
	
}




