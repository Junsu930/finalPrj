package edu.kh.fin.band.dbTest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import edu.kh.fin.band.login.model.vo.User;

@Controller
public class DBTest {
	
	@Autowired
	DBTestService service;


	@PostMapping(value="/dbTest", produces = "application/text; charset=utf8")
	@ResponseBody
	public String dbTest(@RequestParam int userNo) {

		
		DBTestVO testUser = service.dbTest(userNo);
		
		return new Gson().toJson(testUser);
		
	}
	
	@PostMapping("/inviteCheck")
	@ResponseBody
	public int inviteCheck(@RequestParam("userNo") int userNo, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		
		
		int loginUserNo = ((User)session.getAttribute("loginUser")).getUserNo();
		
		
		// 리더 여부 파악. 1이면 리더이다
		int leaderFl = service.leaderCheck(loginUserNo);
		
		
		// 0이여야 상대가 아직 밴드에 가입되어있지 않은 것이다.
		int inBandFl = service.inBandCheck(userNo);
		
		
		
		if(leaderFl == 1 && inBandFl == 0 ) {
			
			return 1;
		}else {
			return 0;
		}
		
	}

	
}
