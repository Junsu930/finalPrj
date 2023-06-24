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
	private String lessonNick;
	private String motto;
	private String joinDate;
	private String lessonImg;
	private String genre;
	private String ints;
	private String region; 
	private String detailment;
	private String socialSite;

}
