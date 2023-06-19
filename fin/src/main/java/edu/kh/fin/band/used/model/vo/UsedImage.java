package edu.kh.fin.band.used.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UsedImage {

	private int imageNo;
	private String imageOriginal;
	private String imageRename;
	private int boardNo;
	private int imageLevel;
}
