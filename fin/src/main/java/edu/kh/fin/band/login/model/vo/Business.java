package edu.kh.fin.band.login.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Business {
	private int OwnerNo;
	private String ownerEmail;
	private String ownerPw;
	private String secessionFl;
	private String ownerNick;
	private int regNo;

}
