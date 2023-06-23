package edu.kh.fin.band.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceimpl implements MyPageService{
	
	@Autowired 
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	/** 이메일 닉네임 업데이트
	 *
	 */
	@Override
	public int updateInfo(Map<String, Object> paramMap){
		return dao.updateInfo(paramMap);
		
		
	}

	/** 프로필 이미지 업데이트
	 *
	 */
	@Override
	public int updateImg(Map<String, Object> paramMap, User loginUser) throws IOException {
		
		MultipartFile uploadImage = (MultipartFile)paramMap.get("uploadImage");
		
		
		String renameImage = null;
		
			// 이미지가 변경된 경우
			
			// 파일명 변경
			// uploadImage.getOriginalFilename() : 원본 파일명
			renameImage = Util.fileRename( uploadImage.getOriginalFilename() );
			
			paramMap.put("profileImg", paramMap.get("webPath") + renameImage);
			
			
		
			
				   int img = dao.updateImg(paramMap);
		
					if( img > 0 && paramMap.get("profileImg") != null) {
						uploadImage.transferTo( new File( paramMap.get("folderPath") + renameImage) );
				
			}
			
			return img;
	}

	/** 포지션 업데이트
	 *
	 */
	@Override
	public int updatePosition(Map<String, Object> paramMap) {
		
		return dao.updatePosition(paramMap);
	}

	/** 비밀번호 변경 서비스impl
	 *
	 */
	@Override
	public int changePw(Map<String, Object> paramMap) {
		
		String encPw = dao.selectEncPw((int)paramMap.get("userNo"));
		
			if( bcrypt.matches( (String)paramMap.get("userPw") , encPw) ) {
			
			paramMap.put("newPw", bcrypt.encode( (String)paramMap.get("newPw")) );
			
			
			return dao.changePw(paramMap);
			
		}
		
		return 0;
	}

	/** 포지션 입력 서비스impl
	 *
	 */
	@Override
	public int insertPosition(Map<String, Object> paramMap) {
		
		return dao.insertPosition(paramMap);
	}

	/** 회원 탈퇴 서비스 impl
	 *
	 */
	@Override
	public int secession(User loginUser) {
		
		String encPw = dao.selectEncPw(loginUser.getUserNo());
		
		if(bcrypt.matches(loginUser.getUserPw(), encPw)) {
			
			return dao.secession(loginUser.getUserNo());
		}
		
		return 0;
	}

}
