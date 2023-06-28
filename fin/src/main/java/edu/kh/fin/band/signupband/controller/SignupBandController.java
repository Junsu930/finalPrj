package edu.kh.fin.band.signupband.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
import edu.kh.fin.band.signupband.model.service.SignUpBandService;

@Controller
@SessionAttributes({"loginUser"})
public class SignupBandController {
	
	@Autowired
	private SignUpBandService service;
	
	/**
	 * 밴드 가입 승락 컨트롤러
	 * @author lee
	 * @param bandNo
	 * @param loginUser
	 * @return
	 */
	@PostMapping("/acceptBand")
	public String acceptBand(@RequestParam("bandNo") int bandNo,
			@ModelAttribute("loginUser") User loginUser, RedirectAttributes ra) {
		
		int result = 0;

		Invitation invi = new Invitation();
		
		invi.setBandNo(bandNo);
		invi.setFromUserNo(loginUser.getUserNo());
		
		result = service.acceptBand(invi);
		
		if(result > 0) {
			ra.addFlashAttribute("msgFromAccept", "밴드가입이 완료 되었습니다!");
			return "redirect:main";
		}else {
			ra.addFlashAttribute("msgFromAccept", "밴드가입이 실패 되었습니다!");
			return "redirect:alarmPage";
		}
	}
	
	/**
	 * 초대장 거절 컨트롤러 FL 변경해야함
	 * @author lee
	 * @param bandNo
	 * @param ra
	 * @return
	 */
	@PostMapping("/deniedBand")
	public String deniedBand(@RequestParam("bandNo") int bandNo, RedirectAttributes ra) {
		
		int result = service.deniedBand(bandNo);
		
		if(result > 0) {
			ra.addFlashAttribute("msgFromDenied", "밴드가입을 거절했습니다!");
			return "redirect:main";
		}else {
			ra.addFlashAttribute("msgFromDenied", "거절을 실패하네 ㅋㅋ!");
			return "redirect:alarmPage";
		}
	}

}
