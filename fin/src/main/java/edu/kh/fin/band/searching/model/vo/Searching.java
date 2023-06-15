package edu.kh.fin.band.searching.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Searching {
	
	
	private int userNo;
	private int matchingNo;
	private int career;
	private String userName;
	private String inst;
	private String genre;
	private char gender;
	private String region;
	
	
	@Override
	public String toString() {
		return "Searching [userNo=" + userNo + ", matchingNo=" + matchingNo + ", career=" + career + ", userName="
				+ userName + ", inst=" + inst + ", genre=" + genre + ", gender=" + gender + ", region=" + region + "]";
	}
	
	
}
