package edu.kh.fin.band.chatting.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.kh.fin.band.chatting.model.service.ChatService;

@Component
public class SocketHandler extends TextWebSocketHandler{

	// 웹 소켓 세션을 담을 리스트
	List<WebSocketSession> rls = new ArrayList<>();
	
	@Autowired
	ChatService service;
	
	@SuppressWarnings("unchecked")
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		
		
		
		System.out.println("메세지 올 때 보는 세션 " + session);

		/*
		if(msg.contains("onSession:")) {
			System.out.println("세션값 들어왔수");
			String sessionRoom = msg.split("onSession:")[1];

			if(!rls.contains(sessionRoom)) {
				rls.add(sessionRoom);
				
			}else {
				
			}
			
		}else {
		 */
			
		JSONObject obj = JsonToObjectParser(msg);
		
		// 메세지가 잘 도착했으면 
		if(obj != null) {
			Map<String, Object> msgMap = null;
			 try {
				msgMap = new ObjectMapper().readValue(obj.toString(), Map.class);
				
				System.out.println(msgMap);
				
				// 메세지 저장
				service.savaMsg(msgMap);	
				
				
			} catch (JsonParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (JsonMappingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		try {
			
			for(int i=0; i< rls.size(); i++) {
				
				WebSocketSession tempSession =  rls.get(i);
						
				if(tempSession.isOpen()) {
					tempSession.sendMessage(new TextMessage(obj.toJSONString()));					
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
			
	}
		
		
//		
//		HashMap<String, Object> temp = new HashMap<String, Object>();
//		
//		// 세션에 방이 저장되어 있으면
//		if(rls.size() > 0) {
//			for(int i = 0; i<rls.size(); i++) {
//				String roomNo = (String)rls.get(i).get("chatRoomNo"); // 세션 리스트에 저장된 방 가져옴
//				if(roomNo.equals(rN)) { // 같은 방이 존재한다면
//					temp = rls.get(i); // 해당 방의 모든 정보가져옴
//					break;
//				}
//			}
//			
//			for(String key : temp.keySet()) { // 해당 방만 찾는다
//				System.out.println("key = " + key + ", value= " + temp.get(key));
//				 
//				if(key.equals("chatRoomNo")) {
//					continue; // 방 번호는 건너뛰기
//				}
//				WebSocketSession wss = (WebSocketSession)temp.get(key);
//				if(wss != null) {
//					
//					try {
//						wss.sendMessage(new TextMessage(obj.toJSONString()));
//					}catch(Exception e) {
//						e.printStackTrace();
//					}
//					
//				}
//			}
//		}
	
	
	// json파일 파싱하는 함수
	private static JSONObject JsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
	
		super.afterConnectionEstablished(session);
		
		
		rls.add(session);
		
		
		
//		boolean flag = false;
//		
//		System.out.println("Session 정보 : " + session);
//		
//		String url = session.getUri().toString();
//		System.out.println("url : "+ url );
//		
//		String roomNo = url.split("/chatting/")[1];
//		int idx = rls.size(); // 방 사이즈 조사
//		
//		
//		if(rls.size() > 0 ) {
//			for(int i = 0; i<rls.size(); i++) {
//				String rN = (String)rls.get(i).get("chatRoomNo");
//				if(rN.equals(roomNo)) { // 같은 방이 존재하면
//					flag = true;
//					idx = i;
//					break;
//				}
//			}
//			
//		}
//		if(flag) { // 만약 방이 존재하면  세션만 추가
//			HashMap<String,Object> map = rls.get(idx);
//			map.put(session.getId(), session);
//			
//		}else { // 최초 생성하는 방이면 방 번호와 세션 추가
//			HashMap<String,Object> map = new HashMap<String, Object>();
//			map.put("chatRoomNo", roomNo);
//			map.put(session.getId(), session);
//			rls.add(map);
//			
//		}
//		
//
//		// 세션 등록 끝나면 세션 id값 발송
//		JSONObject obj = new JSONObject();
//		obj.put("type", "getId");
//		obj.put("sessionId", session.getId());
//		session.sendMessage(new TextMessage(obj.toJSONString()));
//		System.out.println("등록된 세션들 객체 : " + rls);
//		System.out.println("등록된 세션들 세션 : " + session);
//		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
	}
}