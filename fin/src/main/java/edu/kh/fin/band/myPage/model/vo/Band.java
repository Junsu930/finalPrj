package edu.kh.fin.band.myPage.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Band {
	
	private int bandNo;
	private String bandName;
	private String genre;
	private String ment;
	private int leaderNo;
	private int userNo;
	private String userNick;
	private String leaderNick;

}
