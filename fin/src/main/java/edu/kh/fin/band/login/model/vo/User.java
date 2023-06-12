package edu.kh.fin.band.login.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class User {
	private int userNo;
	private String userEmail;
	private String userPw;
	private String joinDate;
	private String secessionFl;
	private String userNick;
	private String matchFl;
	private String userType;
	private String intro;
	private String banFl;
}
