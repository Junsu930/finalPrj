package edu.kh.fin.band.login.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.login.model.vo.User;

@Repository
public class LoginDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	private Logger logger = LoggerFactory.getLogger(LoginDAO.class);
	
	

	/**로그인DAO
	 * @param inputUser
	 * @return loginUser
	 */
	public User login(User inputUser) {
				
		
		User loginUser = sqlSession.selectOne("loginMapper.login", inputUser ); 
			
		
		return loginUser;
	}



	/** 이메일 중복검사DAO
	 * @param userEmail
	 * @return result
	 */
	public int emailDupCheck(String userEmail) {
		return sqlSession.selectOne("loginMapper.emailDupCheck", userEmail);
	}



	/** 닉네임 중복검사 DAO
	 * @param userNickname
	 * @return result
	 */
	public int nicknameDupCheck(String userNickname) {
		
		return sqlSession.selectOne("loginMapper.nicknameDupCheck", userNickname);
	}



	/** 회원가입 DAO
	 * @param inputUser
	 * @return result
	 */
	public int signUp(User inputUser) {
		
		return sqlSession.insert("loginMapper.signUp", inputUser);
	}

}
