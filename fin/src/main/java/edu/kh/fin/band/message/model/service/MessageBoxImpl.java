package edu.kh.fin.band.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.alarm.model.vo.Alarm;
import edu.kh.fin.band.message.model.dao.MessageBoxDAO;
import edu.kh.fin.band.message.model.vo.MessageBox;


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
	 * 메세지 답장 서비스
	 * @author lee
	 */
	@Override
	public int sendMsg(MessageBox msg) {
		
		return dao.sendMsg(msg);
	}


	/**
	 * 쪽지 삭제 서비스
	 * @author lee
	 */
	@Override
	public int deleteMsg(int msgNo) {
		return dao.deleteMsg(msgNo);
	}


	@Override
	public int insertMsgAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return dao.insertMsgAlarm(alarm);
	}

}
