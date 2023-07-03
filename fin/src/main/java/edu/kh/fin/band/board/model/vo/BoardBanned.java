package edu.kh.fin.band.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardBanned {

	private  int bannedNo;
	private int userNo;
	private int bannedUserNo;
	private String bannedUserNick;

	
}


//CREATE TABLE "BANDARCHIVE"."BOARD_BANNED" 
//(	"BANNED_NO" NUMBER, 
//	"USER_NO" NUMBER NOT NULL ENABLE, 
//	"BANNED_USER_NO" NUMBER NOT NULL ENABLE, 
//	"BANNED_USER_NICK" VARCHAR2(100), 
//	 PRIMARY KEY ("BANNED_NO")