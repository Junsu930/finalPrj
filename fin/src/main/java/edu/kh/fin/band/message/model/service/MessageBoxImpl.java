package edu.kh.fin.band.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.message.model.dao.MessageBoxDAO;
import edu.kh.fin.band.message.model.vo.MessageBox;


@Service
public class MessageBoxImpl implements MessageBoxService{
	
	@Autowired
	private MessageBoxDAO dao;

	/**
	 * 메세지 조회 서비스
	 * @author lee
	 */
	@Override
	public List<MessageBox> selectMsgList(int userNo) {
		
		return dao.selectMsgList(userNo);
	}

	
	/**
	 * 메세지 보내기 서비스
	 * @author lee
	 */
	@Override
	public int sendMsg(MessageBox msg) {
		
		return dao.sendMsg(msg);
	}

}
