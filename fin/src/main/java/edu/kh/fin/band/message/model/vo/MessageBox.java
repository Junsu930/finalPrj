package edu.kh.fin.band.message.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class MessageBox {
	private int msgNo;
	private int userNo;
	private int sendUserNo;
	private String msgContent;
	private String openDate;
	private String sendDate;
}
