package edu.kh.fin.band.myPage.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Ban {
	private int bannedNo;
	private int userNo;
	private int bannedUserNo;
	private String bannedUserNick;
	
}
