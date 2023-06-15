package edu.kh.fin.band.dbTest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class DBTest {
	
	@Autowired
	DBTestService service;

	@Autowired
	BCryptPasswordEncoder bcrypt;

	@PostMapping(value="/dbTest", produces = "application/text; charset=utf8")
	@ResponseBody
	public String dbTest(@RequestParam int userNo) {

		
		DBTestVO testUser = service.dbTest(userNo);
		
		return new Gson().toJson(testUser);
		
	}
	
	@GetMapping("/testBc")
	public String testBc(@RequestParam("bc") String bc) {
		System.out.println(bc);
		
		String encBc = bcrypt.encode(bc);
		System.out.println(encBc);
		
		System.out.println(bcrypt.matches(bc, encBc));
		
		
		return "room/roomMain";
		
		
	}
	

	
}
