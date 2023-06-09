package edu.kh.fin.band.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.chatting.dao.ChatDAO;
import edu.kh.fin.band.chatting.model.vo.ChatVo;

@Service
public class ChatService {
	
	@Autowired
	ChatDAO dao;

	public List<ChatVo> onChatRoom(int nowUser) {
		return dao.onChatRoom(nowUser);
	}
	
	

}
