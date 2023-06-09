package edu.kh.fin.band.chatting.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TempUserVo {

	private int userNo;
	private String userEmail;
	private String userPwd;
	private String userDate;
	private String secessionFl;
	private String userName;
	private String matchingFl;
	private String userType;
	private String introMent;
	private String bannedFl;
	private String inst;
	private String genreFavor;
	private String region;
	private String gender;
	private String yoe;
	
	@Override
	public String toString() {
		return "TempUserVo [userNo=" + userNo + ", userEmail=" + userEmail + ", userPwd=" + userPwd + ", userDate="
				+ userDate + ", secessionFl=" + secessionFl + ", userName=" + userName + ", matchingFl=" + matchingFl
				+ ", userType=" + userType + ", introMent=" + introMent + ", bannedFl=" + bannedFl + ", inst=" + inst
				+ ", genreFavor=" + genreFavor + ", region=" + region + ", gender=" + gender + ", yoe=" + yoe + "]";
	}
	

}
