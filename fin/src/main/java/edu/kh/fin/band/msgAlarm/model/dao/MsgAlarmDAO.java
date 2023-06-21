package edu.kh.fin.band.msgAlarm.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.msgAlarm.model.vo.MsgAlarm;

@Repository
public class MsgAlarmDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/**
	 * 쪽지 알람 갯수 가져오는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public int getAlarmCount(int loginUserNo) {
		return sqlSession.selectOne("alaramMapper.getAlarmCount", loginUserNo);
	}

	/**
	 * 쪽지를 보낸 유저 닉네임 가져오는 DAO
	 * @author lee
	 * @param loginUserNo
	 * @return
	 */
	public List<MsgAlarm> getUserNicks(int loginUserNo) {
		return sqlSession.selectList("alaramMapper.getUserNicks", loginUserNo);
	}

	/**
	 * @author lee
	 * 클릭 하고 count 갯수 사라지게 하는 DAO
	 * @param loginUserNo
	 * @return
	 */
	public int disappearCount(int loginUserNo) {
		return sqlSession.update("alaramMapper.disappearCount", loginUserNo);
	}
	
	

}
