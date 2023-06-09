package edu.kh.fin.band.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ChatVo {
	
	int chatRoomNo;
	String chatTitle;
	int chatMasterNo;
	int chatGuestNo;
	
}
