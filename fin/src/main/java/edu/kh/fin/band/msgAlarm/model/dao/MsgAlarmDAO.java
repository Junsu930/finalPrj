package edu.kh.fin.band.msgAlarm.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

@Repository
public class MsgAlarmDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/**
	 * 쪽지 알람 갯수 가져오는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public int getMsgAlarmCount(int loginUserNo) {
		return sqlSession.selectOne("alaramMapper.getMsgAlarmCount", loginUserNo);
	}

	/**
	 * 쪽지를 보낸 유저 닉네임 가져오는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public List<MsgAlarm> getUserNicks(int loginUserNo) {
		return sqlSession.selectList("alaramMapper.getUserNicks", loginUserNo);
	}

	/**
	 * 클릭 하고 count 갯수 사라지게 하는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public int disappearCount(int loginUserNo) {
		return sqlSession.update("alaramMapper.disappearCount", loginUserNo);
	}

	/**
	 * 유저의 알람 갯수를 가져오는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public int getAlarmCount(int loginUserNo) {
		return sqlSession.selectOne("alaramMapper.getAlarmCount", loginUserNo);
	}

	/**
	 * 알람 버튼을 클릭하면 알람 카운트를 지워주는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public int alarmDisappearCount(int loginUserNo) {
		return sqlSession.update("alaramMapper.alarmDisappearCount", loginUserNo);
	}

	/**
	 * 로그인 멤버가 오너인 경우 자신의 예약실 알람을 보여주는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public List<MsgAlarm> getUserNicksFromRoom(int loginUserNo) {
		return sqlSession.selectList("alaramMapper.getUserNicksFromRoom", loginUserNo);
	}

	/**
	 * 초대장을 보내서 초대장 테이블에 데이터 넣어두기 DAO + fromUserNo을 바탕으로 DAO에서 밴드 NO도 가져와서 초대장 테이블에 삽입
	 * + totalAlarm테이블에도 데이터 삽입
	 * @author lee
	 * @param map
	 * @return
	 */
	public int sendInvitate(HashMap<String, Object> map) {
		
		
		// fromUserNo 즉 leaderUserNo을 바탕으로 밴드 넘버 가져오기
		int bandNo = sqlSession.selectOne("alaramMapper.getBandNo", map);
		
		if(bandNo != 0) { // 밴드 넘버를 가져왔을 시,
			// 밴드 넘버를 맵에 넣기
			map.put("bandNo", bandNo);
			// 밴드 넘버를 바탕으로 인서트 구문 실행
			int result = sqlSession.insert("alaramMapper.insertInvitation", map);
			if(result > 0) { // 밴드 넘버 인서트 성공
				result = sqlSession.insert("alaramMapper.insertInviAlarm", map);
			}else {
				return 0; // 밴드 넘버 인서트 실패
			}
			return result; //초대장 알람 까지 성공 했을 경우
		}else {
			return 0; // 밴드 넘버 못가져왔을 때
		}
	}

	/**
	 * 알람(초대장 + 댓글 + 좋아요) 갯수 가져오는 DAO
	 * @author lee
	 * @param userNo
	 * @return
	 */
	public int totalAlarmGet(int userNo) {
		return sqlSession.selectOne("alaramMapper.totalAlarmGet", userNo);
	}

	/**
	 * 초대장 알람 목록 출력하기 DAO + 가져올 거, 밴드 리더닉네임, 밴드네임
	 * @author lee
	 * @param userNo
	 * @return
	 */
	public List<Invitation> getInviList(int userNo) {
		return sqlSession.selectList("alaramMapper.getInviList", userNo);
	}

	/**
	 * 알람페이지 이동 후, 초대장 목록 출력 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public List<Invitation> selectInviAlarmPage(int loginUserNo) {
		return sqlSession.selectList("alaramMapper.selectInviAlarmPage", loginUserNo);
	}

	/**
	 * 읽으면 알람 카운트 삭제 DAO
	 * @author lee
	 * @param userNo
	 * @return
	 */
	public int changeAlarmStatus(int userNo) {
		return sqlSession.update("alaramMapper.changeAlarmStatus", userNo);
	}

	/**
	 * 현재 로그인된 유저넘버 바탕으로 댓글 단 사람 목록, 날짜 출력 DAO
	 * @author lee
	 * @param userNo
	 * @return
	 */
	public List<MsgAlarm> getUserNicksFromReply(int userNo) {
		return sqlSession.selectList("alaramMapper.getUserNicksFromReply", userNo);
	}

	
	

}
