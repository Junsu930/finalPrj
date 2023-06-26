package edu.kh.fin.band.common.pagination;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CommonCriteria {
	
	private int pageNum; //페이지 번호
	private int amount; // 한 페이지 당 개수
	
	public CommonCriteria() {
		this(1, 10);
	}
	
}
