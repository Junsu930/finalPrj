package edu.kh.fin.band.chatting.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.chatting.model.vo.ChatMessageVo;
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

	public int saveMsg(Map<String, Object> msgMap) {
		
		return sqlSession.insert("chat-mapper.saveMsg", msgMap);
				
	}

	public List<ChatMessageVo> loadMessage(String chatRoomNo) {
		return sqlSession.selectList("chat-mapper.loadMessage", chatRoomNo);
	}

	public int deleteChatRoom(String chatRoomNo) {
		return sqlSession.update("chat-mapper.deleteChatRoom",chatRoomNo);
	}

	public int chatStart(Map<String, Object> roomNoMap) {
		
		sqlSession.delete("chat-mapper.deleteToStart", roomNoMap);
		
		return sqlSession.insert("chat-mapper.chatStart",roomNoMap);
	}

	public int dupCheck(Map<String, Object> roomNoMap) {
		
		
		return sqlSession.selectOne("chat-mapper.dupCheck", roomNoMap);
	}

	
	/** 상대방 닉네임 확인
	 * @param withUser
	 * @return
	 */
	public String withUserName(int withUser) {
		return sqlSession.selectOne("chat-mapper.withUserName", withUser);
	}

	/** 상대방 닉네임 확인(채팅방 번호로)
	 * @param chatRoomNo
	 * @return
	 */
	public String withUserName(String chatRoomNo) {
		return sqlSession.selectOne("chat-mapper.withUserUsingRoomNo", chatRoomNo);
	}

	public String chattingCheckImg(int userNo) {
		return sqlSession.selectOne("chat-mapper.chattingCheckImg", userNo);
	}



}
