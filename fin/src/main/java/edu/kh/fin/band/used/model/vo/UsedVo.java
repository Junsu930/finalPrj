package edu.kh.fin.band.used.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UsedVo {

	private int usedBoardNo;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardState;
	private int price;
	private String productName;
	private int userNo;
	private String boardTag;
	private String region;
	private String imgSrc;
	private String userNick;
	private int imgLevel;

}
