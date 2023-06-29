package edu.kh.fin.band.myPage.model.vo;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Pagi {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private Crite cri;
	
	private int total;
	private int pageNum;
	private int amount;
	
	public Pagi(Crite cri, int total) {
		
		this.pageNum = cri.getPageNum();
		this.amount = cri.getAmount();
		this.total = total;
		this.cri =cri;
		this.endPage = (int)Math.ceil(this.pageNum/10.0 ) * 10;
		this.startPage = this.endPage - 10 + 1;
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
	}
	
}
	
	