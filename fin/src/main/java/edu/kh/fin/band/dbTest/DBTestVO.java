package edu.kh.fin.band.dbTest;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DBTestVO {

	private int userNo;
	private String userEmail;
	private String userPwd;
	private String userDate;
	private String secessionFl;
	private String userName;
	private String matchingFl;
	private String userType;
	private String introMent;
	private String inst;
	private String genreFavor;
	private String region;
	private String gender;
	private String yoe;
	
	
	@Override
	public String toString() {
		return "DBTestVO [userNo=" + userNo + ", userEmail=" + userEmail + ", userPwd=" + userPwd + ", userDate="
				+ userDate + ", secessionFl=" + secessionFl + ", userName=" + userName + ", matchingFl=" + matchingFl
				+ ", userType=" + userType + ", introMent=" + introMent + ", inst=" + inst + ", genreFavor="
				+ genreFavor + ", region=" + region + ", gender=" + gender + ", yoe=" + yoe + "]";
	}
	

		

}
