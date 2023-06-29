package edu.kh.fin.band.common.pagination;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Pagination {
	
	private int startPage; //시작페이지 번호
	private int endPage; // 마지막 페이지 번호
	private boolean next; // 다음버튼 활성화
	private boolean prev; // 이전 버튼 활성화
	
	private int total; // 총 게시글
	private int pageNum; // 조회할 때 페이지번호
	private int amount; //
	
	private CommonCriteria cri;
	
	public Pagination(CommonCriteria cri, int total) {
		
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri = cri;
		
		this.endPage = (int)Math.ceil(this.pageNum / 10.0) * 10;
		this.startPage = this.endPage - 10 + 1;
		
		// 진짜 마지막 end 만약 게시글 53개면 마지막은 6
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
	
}
