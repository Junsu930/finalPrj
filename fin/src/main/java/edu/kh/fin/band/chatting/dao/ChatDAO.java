package edu.kh.fin.band.chatting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.chatting.model.vo.ChatVo;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ChatVo> onChatRoom(int nowUser) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("nowUser", nowUser);
		

		return sqlSession.selectList("chat-mapper.roomList" ,nowUser);
		
		
	}
}
