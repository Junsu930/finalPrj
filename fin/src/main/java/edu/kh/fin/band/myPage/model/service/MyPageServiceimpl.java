package edu.kh.fin.band.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceimpl implements MyPageService{
	
	@Autowired 
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@Override
	public int updateInfo(Map<String, Object> paramMap) throws IOException {
		
		int updateInfo = dao.updateInfo(paramMap);
		
		String encPw = dao.selectEncPw( (int)paramMap.get("userNo") );
		
		
		if( bcrypt.matches( (String)paramMap.get("userPw") , encPw) ) {
			
			paramMap.put("newPw", bcrypt.encode( (String)paramMap.get("newPw")) );
			
			
			int updatePw = dao.changePw(paramMap);
		}
		
		MultipartFile uploadImage = (MultipartFile)paramMap.get("uploadImage");
		String delete = (String)paramMap.get("delete");
		
		String renameImage = null;
		
		if( delete.equals("0") ) { // 이미지가 변경된 경우
			
			// 파일명 변경
			// uploadImage.getOriginalFilename() : 원본 파일명
			renameImage = Util.fileRename( uploadImage.getOriginalFilename() );
			
			paramMap.put("profileImage", paramMap.get("webPath") + renameImage);
									//  /resources/images/memberProfile/20220624122315.png
			
		} else {
			
			paramMap.put("profileImage", null);
			
		}
		
		int updateImage =  dao.updateImage(paramMap);
		
		if( updateImage > 0 && paramMap.get("profileImage") != null) {
			uploadImage.transferTo( new File( paramMap.get("folderPath") + renameImage) );
		}
		
		
		int result = updateInfo;
		
		return 0;
	}

}
