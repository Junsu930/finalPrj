package edu.kh.fin.band.msgAlarm.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.msgAlarm.model.dao.MsgAlarmDAO;
import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

@Service
public class MsgAlarmServiceImpl implements MsgAlarmService{
	
	@Autowired
	private MsgAlarmDAO dao;

	/**
	 * 쪽지 알람 갯수 가져오는 서비스
	 * @author lee
	 */
	@Override
	public int getMsgAlarmCount(int loginUserNo) {
		
		return dao.getMsgAlarmCount(loginUserNo);
	}

	/**
	 * 쪽지를 보낸 유저 닉네임 가져오는 서비스
	 * @author lee
	 */
	@Override
	public List<MsgAlarm> getUserNicks(int loginUserNo) {
		return dao.getUserNicks(loginUserNo);
	}

	/**
	 * 클릭 하고 count 갯수 사라지게 하는 서비스
	 * @author lee
	 */
	@Override
	public int disappearCount(int loginUserNo) {
		return dao.disappearCount(loginUserNo);
	}

	/**
	 * 유저의 알람 갯수를 가져오는 서비스
	 * @author lee
	 */
	@Override
	public int getAlarmCount(int loginUserNo) {
		return dao.getAlarmCount(loginUserNo);
	}

	/**
	 * 알람 버튼을 클릭하면 알람 카운트를 지워주는 서비스
	 * @author lee
	 */
	@Override
	public int alarmDisappearCount(int loginUserNo) {
		return dao.alarmDisappearCount(loginUserNo);
	}

	/**
	 * 로그인 멤버가 오너인 경우 자신의 예약실 알람을 보여주는 서비스
	 * @author lee
	 */
	@Override
	public List<MsgAlarm> getUserNicksFromRoom(int loginUserNo) {
		return dao.getUserNicksFromRoom(loginUserNo);
	}

	/**
	 * 초대장을 보내서 초대장 테이블에 데이터 넣어두기 서비스 + fromUserNo을 바탕으로 DAO에서 밴드 NO도 가져와서 초대장 테이블에 삽입
	 * + totalAlarm테이블에도 데이터 삽입
	 * @author lee
	 */
	@Override
	public int sendInvitate(HashMap<String, Object> map) {
		return dao.sendInvitate(map);
	}

	/**
	 * 알람(초대장 + 댓글 + 좋아요) 갯수 가져오는 서비스
	 * @author lee
	 */
	@Override
	public int totalAlarmGet(int userNo) {
		return dao.totalAlarmGet(userNo);
	}

	/**
	 * 초대장 알람 목록 출력하기 서비스 + 가져올 거, 밴드 리더닉네임, 밴드네임
	 * @author lee
	 */
	@Override
	public List<Invitation> getInviList(int userNo) {
		return dao.getInviList(userNo);
	}

	/**
	 * 알람페이지 이동 후, 초대장 목록 출력 서비스
	 * @author lee
	 */
	@Override
	public List<Invitation> selectInviAlarmPage(int loginUserNo) {
		return dao.selectInviAlarmPage(loginUserNo);
	}

	/**
	 * 읽으면 알람 카운트 삭제 서비스
	 * @author lee
	 */
	@Override
	public int changeAlarmStatus(int userNo) {
		return dao.changeAlarmStatus(userNo);
	}

	

	

}
