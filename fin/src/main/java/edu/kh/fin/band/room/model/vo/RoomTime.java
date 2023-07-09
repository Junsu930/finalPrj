package edu.kh.fin.band.room.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RoomTime {

	private int roomTimeNo;
	private int roomNo;
	private int rezUserNo;
	private int rezTime;
}
