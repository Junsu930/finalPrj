package edu.kh.fin.band.message.model.dao;

import java.util.HashMap;
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



	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 DAO
	 * @author lee
	 * @param map
	 * @return
	 */
	public int firstSendMsg(HashMap<String, Object> map) {
		int msgNo = 0;
		int insertResult = sqlSession.insert("msgBoxMapper.firstSendMsg", map);
		
		if(insertResult >0) msgNo = (Integer) map.get("msgNo");
		
		return msgNo;
	}



	/**
	 * 멤버리스트에서 처음으로 메세지 보내는 작업 이후 발생된 메세지 넘버를 바탕으로 알람등록 DAO
	 * @author lee
	 * @param msgA
	 * @return
	 */
	public int insertAlarm(MsgAlarm msgA) {
		return sqlSession.insert("alaramMapper.insertAlarm", msgA);
	}



	

}
