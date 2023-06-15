package edu.kh.fin.band.chatting.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.chatting.dao.ChatDAO;
import edu.kh.fin.band.chatting.model.vo.ChatMessageVo;
import edu.kh.fin.band.chatting.model.vo.ChatVo;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;

	public List<ChatVo> onChatRoom(int nowUser) {
		return dao.onChatRoom(nowUser);
	}

	
	/** 메세지 저장 기능
	 * @param msgMap
	 * @return
	 */
	public int savaMsg(Map<String, Object> msgMap) {
		return dao.saveMsg(msgMap);
	}


	/** 메세지 소환
	 * @param chatRoomNo
	 * @return
	 */
	public List<ChatMessageVo> loadMessage(String chatRoomNo) {
		return dao.loadMessage(chatRoomNo);
	}


	/** 채팅방 나가기(삭제)
	 * @param chatRoomNo
	 * @return
	 */
	public int deleteChatRoom(String chatRoomNo) {
		return dao.deleteChatRoom(chatRoomNo);
	}


	public int chatStart(Map<String, Object> roomNoMap) {
		return dao.chatStart(roomNoMap);
	}


	public int dupCheck(Map<String, Object> roomNoMap) {
		return dao.dupCheck(roomNoMap);
	}


	public String withUserName(int withUser) {
		return dao.withUserName(withUser);
	}


	public String withUserName(String chatRoomNo) {
		return dao.withUserName(chatRoomNo);
	}




}
