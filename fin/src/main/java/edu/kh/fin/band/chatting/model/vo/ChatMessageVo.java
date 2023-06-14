package edu.kh.fin.band.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessageVo {
	
	private String chatRoomNo;
	private String message;
	private int userNo;

}
