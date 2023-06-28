package edu.kh.fin.band.myBand.model.vo;

import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MyBandReply {
	
	int replyNo;
	String replyContent;
	String replySt;
	String replyDt;
	int userNo;
	int pReplyNo;
	int boardNo;
	String userNick;

}
