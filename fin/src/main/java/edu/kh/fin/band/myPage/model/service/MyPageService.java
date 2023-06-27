package edu.kh.fin.band.myPage.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.vo.Ban;

public interface MyPageService {

	/** 회원정보 수정 서비스
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap);

	/** 이미지 수정 서비스
	 * @param paramMap
	 * @param loginUser 
	 * @return
	 * @throws IOException 
	 */
	int updateImg(Map<String, Object> paramMap, User loginUser) throws IOException;

	/** 포지션 수정 서비스
	 * @param paramMap
	 * @return
	 * @throws IOException
	 */
	int updatePosition(Map<String, Object> paramMap)throws IOException;

	/** 비밀번호 변경 서비스
	 * @param paramMap
	 * @return
	 */
	int changePw(Map<String, Object> paramMap);

	/** 포지션 입력 서비스
	 * @param paramMap
	 * @return
	 */
	int insertPosition(Map<String, Object> paramMap);

	/** 회원탈퇴 서비스
	 * @param loginUser
	 * @return
	 */
	int secession(User loginUser);

	/** 유저 차단 해제
	 * @param loginUser
	 * @return
	 */
	int ban(User loginUser);

	/** 밴 유저 확인
	 * @param userNo 
	 * @return
	 */
	List<Ban> chBanList(int userNo);

	/** 밴 해제
	 * @param bannedUserNo
	 * @return
	 */
	int updateBan(int bannedUserNo);

}
