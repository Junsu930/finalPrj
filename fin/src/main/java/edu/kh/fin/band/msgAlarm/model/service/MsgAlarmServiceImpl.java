package edu.kh.fin.band.msgAlarm.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.msgAlarm.model.dao.MsgAlarmDAO;
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
	public int getAlarmCount(int loginUserNo) {
		
		return dao.getAlarmCount(loginUserNo);
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

	

}
