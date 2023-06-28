package edu.kh.fin.band.signupband.model.service;

import edu.kh.fin.band.msgAlarm.model.vo.Invitation;

public interface SignUpBandService {

	/**
	 * 밴드 가입 승락 서비스
	 * @author lee
	 * @param invi
	 * @return
	 */
	int acceptBand(Invitation invi);

	/**
	 * 밴드 가입 거절 서비스
	 * @author lee
	 * @param bandNo
	 * @return
	 */
	int deniedBand(int bandNo);

}
