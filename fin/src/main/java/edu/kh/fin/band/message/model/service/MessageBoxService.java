package edu.kh.fin.band.message.model.service;

import java.util.List;

import edu.kh.fin.band.message.model.vo.MessageBox;



public interface MessageBoxService {

	/** 
	 * msgList 조회 서비
	 * @author lee
	 * @param sendUserNickName 
	 * @return
	 */
	List<MessageBox> selectMsgList(String receiverNickName);

	
	
	/**
	 * 메세지 보내기 서비스
	 * @author lee
	 * @param msgInput
	 * @param userNo
	 * @return
	 */
	int sendMsg(MessageBox msg);

}
