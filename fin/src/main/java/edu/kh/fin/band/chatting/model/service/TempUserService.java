package edu.kh.fin.band.chatting.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.chatting.dao.TempUserDAO;
import edu.kh.fin.band.chatting.model.vo.TempUserVo;

@Service
public class TempUserService {
	
	@Autowired
	TempUserDAO dao;

	public TempUserVo tempUser(int nowUser) {
		return dao.tempUser(nowUser);
	}

}
