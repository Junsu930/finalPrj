package edu.kh.fin.band.signupband.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
import edu.kh.fin.band.myPage.model.vo.Band;

@Repository
public class SignUpBandDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	/**
	 * 밴드 가입 승락 DAO
	 * @author lee
	 * @param invi
	 * @return
	 */
	public int acceptBand(Invitation invi) {
		int result = sqlSession.insert("signUpBand.acceptBand", invi);
		if(result > 0) {
			int bandNo = invi.getBandNo();
			// inviFl을 변경해야지 alarmPage에서 승락한 초대장이 안 보임
			// 23 06 28 그냥 데이터 삭제하기로함
			result = sqlSession.delete("signUpBand.changeInviStatus",bandNo);
		}else {
			return 0;
		}
		return result;
	}

	/**
	 * 밴드 가입 거절 DAO
	 * @author lee
	 * @param bandNo
	 * @return
	 */
	public int deniedBand(int bandNo) {
		return sqlSession.delete("signUpBand.changeInviStatus",bandNo);
	}

	public Band modalBandInfo(int bandNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("signUpBand.modalBandInfo", bandNo);
	}

}
