package edu.kh.fin.band.chatting.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private  Logger logger = LoggerFactory.getLogger(SocketHandler.class);

	// 웹 소켓 세션을 담을 리스트
	List<WebSocketSession> rls = new ArrayList<>();
	
	@Autowired
	ChatService service;
	
	@SuppressWarnings("unchecked")
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		//메시지 발송
		String msg = message.getPayload();
		

		JSONObject obj = JsonToObjectParser(msg);
		
		// 메세지가 잘 도착했으면 
		if(obj != null) {
			Map<String, Object> msgMap = null;
			 try {
				msgMap = new ObjectMapper().readValue(obj.toString(), Map.class);
				
				logger.info("메세지 값"+msgMap);
				
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
		
	
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//소켓 종료
	}
}