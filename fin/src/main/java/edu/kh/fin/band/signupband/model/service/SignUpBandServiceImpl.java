package edu.kh.fin.band.signupband.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.msgAlarm.model.vo.Invitation;
import edu.kh.fin.band.signupband.model.dao.SignUpBandDAO;

@Service
public class SignUpBandServiceImpl implements SignUpBandService{

	@Autowired
	private SignUpBandDAO dao;

	/**
	 * 밴드 가입 승락 서비스
	 * @author lee
	 */
	@Override
	public int acceptBand(Invitation invi) {
		return dao.acceptBand(invi);
	}

	/**
	 * 밴드 가입 거절 서비스
	 * @author lee
	 */
	@Override
	public int deniedBand(int bandNo) {
		return dao.deniedBand(bandNo);
	}
}
