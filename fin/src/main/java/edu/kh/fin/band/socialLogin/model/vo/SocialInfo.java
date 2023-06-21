package edu.kh.fin.band.socialLogin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SocialInfo {

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
	private String profileImg;

}
