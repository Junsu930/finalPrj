package edu.kh.fin.band.msgAlarm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Invitation {
	
	private int inviNo;
	private int toUserNo;
	private int fromUserNo;
	private int bandNo;

	
	
	// 목록 가져오기 용
	private String userNick;
	private String bandName;
	private String sendMon;
	private String sendDay;
}
