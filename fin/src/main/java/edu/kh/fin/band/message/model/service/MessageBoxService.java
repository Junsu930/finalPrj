package edu.kh.fin.band.message.model.service;

import java.util.List;

import edu.kh.fin.band.message.model.vo.MessageBox;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;



public interface MessageBoxService {

	/** 
	 * msgList 조회 서비
	 * @author lee
	 * @param sendUserNickName 
	 * @return
	 */
	List<MessageBox> selectMsgList(int receiverUserNo);

	
	
	/**
	 * 메세지 답장 서비스
	 * @author lee
	 * @param msgInput
	 * @param userNo
	 * @return
	 */
	int sendMsg(MessageBox msg);



	/**
	 * 쪽지 삭제 서비스
	 * @author lee
	 * @param msgNo
	 * @return
	 */
	int deleteMsg(int msgNo);



	/**
	 * 메시지 알람 추가 서비스
	 * @param alarm
	 * @return
	 */
	int insertMsgAlarm(MsgAlarm alarm);



	/**
	 * 메시지 알람 삭제 서비스
	 * @param msgNo
	 * @return
	 */
	int deleteAlarm(int msgNo);

}
