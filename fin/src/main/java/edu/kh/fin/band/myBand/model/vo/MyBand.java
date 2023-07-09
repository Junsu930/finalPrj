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
	private int replyCount;
	private int userNo;
	
	@Override
	public String toString() {
		return "MyBand [boardNo=" + boardNo + ", bandNo=" + bandNo + ", bandName=" + bandName + ", boardTitle="
				+ boardTitle + ", boardContent=" + boardContent + ", boardDate=" + boardDate + ", readCount="
				+ readCount + ", userNick=" + userNick + ", boardLike=" + boardLike + ", boardTag=" + boardTag + "]";
	}
	
	
	
}
