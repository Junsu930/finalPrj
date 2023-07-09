package edu.kh.fin.band.message.model.service;

import java.util.HashMap;
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



	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 서비스
	 * @author lee
	 * @param map
	 * @return
	 */
	int firstSendMsg(HashMap<String, Object> map);



	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 작업 이후 발생된 메세지 넘버를 바탕으로 알람등록 서비스
	 * @author lee
	 * @param msgA
	 * @return
	 */
	int insertAlarm(MsgAlarm msgA);



	

}
