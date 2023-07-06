package edu.kh.fin.band.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardLikeVO {

	private int boardLike;
	private int boardNo;
	private int userNo;
	private int likeCheck;
}
