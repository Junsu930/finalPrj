package edu.kh.fin.band.myPage.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Crite {
	
	private int pageNum;
	private int amount;
	
	

	public Crite() {
		this(1, 5);
	}
	
	public Crite(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	


}
