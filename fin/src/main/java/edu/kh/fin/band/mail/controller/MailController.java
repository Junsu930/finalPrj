package edu.kh.fin.band.mail.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.kh.fin.band.mail.model.service.MailService;

@Controller
public class MailController {
	
	
	
	@Autowired
	private MailService mailService;
	
	
	/** 
	 * 문의 메일 보내기 Controller
	 * @author lee
	 * @param map
	 * @param subject
	 * @param fromName
	 * @param fromAddress
	 * @param mailContent
	 * @return
	 */
	@ResponseBody
	@PostMapping("/sendEmail")
	public String sendEmail(@RequestParam HashMap<String, String> map,
			@RequestParam String subject,
			@RequestParam String fromName,
			@RequestParam String fromAddress,
			@RequestParam String mailContent){
		 
		
		
		  map.put("subject", subject);
		  map.put("fromName", fromName); 
		  map.put("fromAddress", fromAddress);
		  map.put("mailContent", mailContent);
		  
		  int result = mailService.sendEmail(map);
		  
		  if(result > 0) {
			  return new Gson().toJson("메일 전송 성공!");
		  } else {
			  return new Gson().toJson("메일 전송 실패 ㅠㅠ");
		  }
	}
}
