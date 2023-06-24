package edu.kh.fin.band.message.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.message.model.dao.MessageBoxDAO;
import edu.kh.fin.band.message.model.vo.MessageBox;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;


@Service
public class MessageBoxImpl implements MessageBoxService{
	
	@Autowired
	private MessageBoxDAO dao;

	/**
	 * 메세지 조회 서비스
	 * @author lee
	 */
	@Override
	public List<MessageBox> selectMsgList(int receiverUserNo) {
		
		return dao.selectMsgList(receiverUserNo);
	}



	/**
	 * 쪽지 삭제 서비스
	 * @author lee
	 */
	@Override
	public int deleteMsg(int msgNo) {
		return dao.deleteMsg(msgNo);
	}


	/**
	 * 메세지 알람 추가 서비스
	 * @author lee
	 */
	@Override
	public int insertMsgAlarm(MsgAlarm alarm) {
		// TODO Auto-generated method stub
		return dao.insertMsgAlarm(alarm);
	}


	/**
	 * 메세지 알람 삭제 서비스
	 * @author lee
	 */
	@Override
	public int deleteAlarm(int msgNo) {
		// TODO Auto-generated method stub
		return dao.deleteAlarm(msgNo);
	}



	

	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 서비스
	 * @author lee
	 */
	@Override
	public int firstSendMsg(HashMap<String, Object> map) {
		return dao.firstSendMsg(map);
	}


	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 작업 이후 발생된 메세지 넘버를 바탕으로 알람등록 서비스
	 * @author lee
	 */
	@Override
	public int insertAlarm(MsgAlarm msgA) {
		// TODO Auto-generated method stub
		return dao.insertAlarm(msgA);
	}

}
