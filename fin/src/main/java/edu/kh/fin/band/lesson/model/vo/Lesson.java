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
	
	private int LessonNo;
	private int userNo;
	private String introment;
	private String joinDate;
	private String lessonImg;
	private String genre;
	private String ints;
	private String Region; 
	private String detailment;
	private String socialSite;


}
