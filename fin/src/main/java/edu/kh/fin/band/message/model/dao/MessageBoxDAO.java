package edu.kh.fin.band.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.message.model.vo.MessageBox;


@Repository
public class MessageBoxDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/** 
	 * @author lee
	 * 메세지 조회 DAO
	 */
	public List<MessageBox> selectMsgList(int userNo) {
		return sqlSession.selectList("msgBoxMapper.msgBoxList", userNo);
	}

	
	
	/**
	 * 메세지 보내기 서비스
	 * @author lee
	 * @param msgInput
	 * @param userNo
	 * @return
	 */
	public int sendMsg(MessageBox msg) {
		return sqlSession.insert("msgBoxMapper.sendMsg", msg);
	}

}
