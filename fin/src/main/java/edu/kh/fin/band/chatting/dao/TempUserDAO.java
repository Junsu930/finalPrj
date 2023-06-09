package edu.kh.fin.band.chatting.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.chatting.model.vo.TempUserVo;

@Repository
public class TempUserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	public TempUserVo tempUser(int nowUser) {
		return sqlSession.selectOne("chat-mapper.tempUser",nowUser);
	}
}
