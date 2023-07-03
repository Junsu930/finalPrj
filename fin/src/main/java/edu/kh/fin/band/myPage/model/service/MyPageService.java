package edu.kh.fin.band.myPage.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.myPage.model.vo.Ban;
import edu.kh.fin.band.myPage.model.vo.Band;
import edu.kh.fin.band.myPage.model.vo.Crite;

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

	/** 밴드 생성
	 * @param bandName
	 * @param userNo
	 * @param ment
	 * @return
	 */
	int makeBand(Map<String, Object> paramMap);

	/** 밴드 멤버 정보 가져오기
	 * @param userNo
	 * @return
	 */
	List<Band> bandMem(int userNo);

	/** 밴드 정보에 리더 넣기
	 * @param paramMap
	 * @return
	 */
	int makeBandUser(Map<String, Object> paramMap);

	/** 밴드 번호 갖고 오기
	 * @param userNo
	 * @return
	 */
	int bandNo(int userNo);

	/** 밴드 추방
	 * @param userNick
	 * @return
	 */
	int exile(int exileNo);

	/** 밴드 해체
	 * @param bandNo
	 * @return
	 */
	int dismiss(int bandNo);

	int getTotal();

	/** 게시글 목록 조회
	 * @param i 
	 * @return
	 */
	List<BoardDetail> boardList(Map<String, Object> map);

	/** 댓글 조회
	 * @param userNo
	 * @return
	 */
	List<Reply> ReplyList(int userNo);

	int dissmiss2(int bandNo);
}
