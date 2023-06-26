package edu.kh.fin.band.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Reply {

	
	
	private int replyNo;
	private int boardNo;
	private String replyContent;
	private String replySt;
	private String createDate;
	private int userNo;
	private int parentReplyNo;
	private String userNick;
	
//	`REPLY_NO`	NUMBER	NOT NULL,
//	`BOARD_NO`	NUMBER	NOT NULL,
//	`REPLY_CONTENT`	VARCHAR2(2000)	NOT NULL,
//	`REPLY_ST`	CHAR(1)	NOT NULL	DEFAULT N,
//	`CREATE_DT`	DATE	NOT NULL	DEFAULT SYSDATE,
//	`USER_NO`	NUMBER	NOT NULL,
//	`PARENT_REPLY_NO`	NUMBER	NULL
//	USER_NICK
	
	
}
