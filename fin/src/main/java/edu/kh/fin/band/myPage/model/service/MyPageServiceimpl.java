package edu.kh.fin.band.myPage.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.dao.MyPageDAO;
import edu.kh.fin.band.myPage.model.vo.Ban;
import edu.kh.fin.band.myPage.model.vo.Band;
import edu.kh.fin.band.myPage.model.vo.Crite;

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

	/** 유저 차단 해제
	 *
	 */
	@Override
	public int ban(User loginUser) {
		
		return dao.ban(loginUser);
	}

	/** 밴 유저 확인
	 *
	 */
	@Override
	public List<Ban> chBanList(int userNo) {
		
		return dao.chBanList(userNo);
	
	}

	/** 밴 해제
	 *
	 */
	@Override
	public int updateBan(int bannedUserNo) {
		
		
		return dao.updateBan(bannedUserNo);
	}

	/** 밴드 생성
	 *
	 */
	@Override
	public int makeBand(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return dao.makeBand(paramMap);
	}

	/**
	 * 밴드 멤버 정보 가져오기
	 */
	@Override
	public List<Band> bandMem(int userNo) {
	
		return dao.bandMem(userNo);
	}

	/** 밴드에 리더 넣기
	 *
	 */
	@Override
	public int makeBandUser(Map<String, Object> paramMap) {
		
		return dao.makeBandUser(paramMap);
	}

	/**
	 * 밴드 번호 갖고오기
	 */
	@Override
	public int bandNo(int userNo) {
		
		return dao.bandNo(userNo);
	}

	/** 밴드 추방
	 *
	 */
	@Override
	public int exile(int exileNo) {
		
		return dao.exile(exileNo);
	}

	/** 밴드 해체
	 *
	 */
	@Override
	public int dismiss(int bandNo) {
		
		return dao.dismiss(bandNo);
	}

	@Override
	public int getTotal() {
		
		return dao.getTotal();
	}

	@Override
	public List<BoardDetail> boardList(Map<String, Object> map) {
		
		return dao.boardList(map);
	}

	@Override
	public List<Reply> ReplyList(int userNo) {
		
		return dao.ReplyList(userNo);
	}

}
