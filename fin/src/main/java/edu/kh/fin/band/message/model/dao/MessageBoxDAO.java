package edu.kh.fin.band.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.message.model.vo.MessageBox;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;


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
		return sqlSession.update("msgBoxMapper.deleteMsg", msgNo);
	}



	/**
	 * 메세지 알람 추가 DAO
	 * @author lee
	 * @param alarm
	 * @return
	 */
	public int insertMsgAlarm(MsgAlarm alarm) {
		// TODO Auto-generated method stub
		return sqlSession.insert("alaramMapper.insertMsgAlarm", alarm);
	}



	/**
	 * 메세지 알람 삭제 DAO
	 * @author lee
	 * @param msgNo
	 * @return
	 */
	public int deleteAlarm(int msgNo) {
		return sqlSession.update("alaramMapper.deleteAlarm", msgNo);
	}

}
