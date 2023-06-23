package edu.kh.fin.band.msgAlarm.model.service;

import java.util.List;


import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

public interface MsgAlarmService {

	/**
	 * 쪽지 알람 갯수 가져오는 서비스
	 * @author lee
	 * @return
	 */
	int getMsgAlarmCount(int loginUserNo);

	/**
	 * 쪽지를 보낸 유저 닉네임 가져오는 서비스
	 * @param loginUserNo
	 * @return
	 */
	List<MsgAlarm> getUserNicks(int loginUserNo);

	/**
	 * 클릭 하고 count 갯수 사라지게 하는 서비스
	 * @param loginUserNo
	 * @return
	 */
	int disappearCount(int loginUserNo);

	/** 
	 * 유저의 알람 갯수를 가져오는 서비스
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	int getAlarmCount(int loginUserNo);

	/**
	 * 알람 버튼을 클릭하면 알람 카운트를 지워주는 서비스
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	int alarmDisappearCount(int loginUserNo);

	/**
	 * 로그인 멤버가 오너인 경우 자신의 예약실 알람을 보여주는 서비스
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	List<MsgAlarm> getUserNicksFromRoom(int loginUserNo);

}
