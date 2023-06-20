package edu.kh.fin.band.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.alarm.model.vo.Alarm;
import edu.kh.fin.band.message.model.vo.MessageBox;


@Repository
public class MessageBoxDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/** 
	 * @author lee
	 * 메세지 조회 DAO
	 */
	public List<MessageBox> selectMsgList(int receiverUserNo) {
		return sqlSession.selectList("msgBoxMapper.msgBoxList", receiverUserNo);
	}

	
	
	/**
	 * 메세지 답장 DAO
	 * @author lee
	 * @param msgInput
	 * @param userNo
	 * @return
	 */
	public int sendMsg(MessageBox msg) {
		return sqlSession.insert("msgBoxMapper.sendMsg", msg);
	}



	/**
	 * 메세지 삭제 DAO
	 * @author lee
	 * @param msgNo
	 * @return
	 */
	public int deleteMsg(int msgNo) {
		return sqlSession.delete("msgBoxMapper.deleteMsg", msgNo);
	}



	public int insertMsgAlarm(Alarm alarm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("alaramMapper.insertMsgAlarm", alarm);
	}

}
