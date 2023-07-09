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
		
		String nowSUser = Integer.toString(nowUser);
		
		map.put("nowUser", nowSUser);
		

		return sqlSession.selectList("chat-mapper.roomList" ,map);
		
		
	}

	public int saveMsg(Map<String, Object> msgMap) {
		
		// 최신 메세지 상태 변경 로직
		sqlSession.update("chat-mapper.lastChat", msgMap);
		
		sqlSession.update("chat-mapper.settingY", msgMap);
		
		return sqlSession.insert("chat-mapper.saveMsg", msgMap);
				
	}

	public List<ChatMessageVo> loadMessage(Map<String,Object> cMap) {
		
		
		
		return sqlSession.selectList("chat-mapper.loadMessage", cMap);
	}

	public int deleteChatRoom(String chatRoomNo) {
		return sqlSession.update("chat-mapper.deleteChatRoom",chatRoomNo);
	}

	public int chatStart(Map<String, Object> roomNoMap) {
		
		sqlSession.delete("chat-mapper.deleteToStart", roomNoMap);
		
		return sqlSession.insert("chat-mapper.chatStart",roomNoMap);
	}

	public int dupCheck(Map<String, Object> roomNoMap) {
		
		int result = sqlSession.selectOne("chat-mapper.dupCheck", roomNoMap);
		
		
		// Y인 채팅방 있으면 중복
		if(result > 0) {
			return 1;
		}else {
			int outCheck = sqlSession.selectOne("chat-mapper.outCheck", roomNoMap);
			
			// 중복은 아니지만 내가 나가거나 상대가 나간 방이 있으면
			// 만약 있으면
			if(outCheck > 0) {
				// Y로 수정
				int updateChatRoom = sqlSession.update("chat-mapper.returnY", roomNoMap);
				
				result = 1;
			}
		}
		
		
		return result;
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

	public int chatExit(Map<String, Object> chatMap) {
		
		String checkSt = sqlSession.selectOne("chat-mapper.checkSt", chatMap);
		int result = 0;
		if(checkSt.equals("Y")) {
			int fresult = sqlSession.update("chat-mapper.chatExitU", chatMap);
			if (fresult > 0) {
				
				result = sqlSession.update("chat-mapper.massageExitU", chatMap);
			}
		}else {
			int fresult = sqlSession.delete("chat-mapper.chatExitD", chatMap);
			if (fresult > 0) {
				
				result = sqlSession.delete("chat-mapper.massageExitD", chatMap);
			}
		}
		
		
		return result;
	}



}
