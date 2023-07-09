package edu.kh.fin.band.board.model.vo;

import java.util.List;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BoardDetail {

	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private int replyCount;
	private int readCount;
	private int userNo;
	private int boardLike;
	private String boardTag;
	private String userNick;
	
	private int loginUserNo;
	
	
	private List<BoardImage> imageList;
	
	
	
}
