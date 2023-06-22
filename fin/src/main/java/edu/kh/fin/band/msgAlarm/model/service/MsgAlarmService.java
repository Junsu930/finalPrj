package edu.kh.fin.band.msgAlarm.model.service;

import java.util.List;


import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

public interface MsgAlarmService {

	/**
	 * 쪽지 알람 갯수 가져오는 서비스
	 * @author lee
	 * @return
	 */
	int getAlarmCount(int loginUserNo);

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

}
