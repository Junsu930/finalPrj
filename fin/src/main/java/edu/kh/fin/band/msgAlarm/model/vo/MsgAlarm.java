package edu.kh.fin.band.msgAlarm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MsgAlarm {
	
	private int alarmNo;
	private int userNo;
	private int msgNo;
	private char alarmReadStatus;
	private char alarmStatus;
	
	
	private String userNick;
	private String sendDay;
	private String sendMon;
	private int replyNo;
	private int boardNo;
	
	private String roomName;
	private String alarmMon;
	private String alarmDay;
}
