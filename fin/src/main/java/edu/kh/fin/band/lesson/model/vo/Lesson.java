package edu.kh.fin.band.lesson.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Lesson {
	
	private int lessonNo;
	private int userNo;
	private String userNick;
	private String genre;
	private String inst;
	private String region;
	private String socialSite;
	private String motto;
	private String detailment;
	private String writingDate;
	
	private String imgSrc;
	private int imgLevel;
}
