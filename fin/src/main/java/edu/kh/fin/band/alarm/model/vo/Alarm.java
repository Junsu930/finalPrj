package edu.kh.fin.band.alarm.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Alarm {
	
	private int alarmNo;
	private int userNo;
	private int alarmType;
	private char alarmStatus;
}
