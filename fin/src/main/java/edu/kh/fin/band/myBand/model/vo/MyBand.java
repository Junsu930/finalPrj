package edu.kh.fin.band.myBand.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MyBand {

	private int boardNo;
	private int bandNo;
	private String bandName;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private int readCount;
	private String userNick;
	private int boardLike;
	private String boardTag;
	
	
}
