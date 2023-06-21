package edu.kh.fin.band.myPage.model.service;

import java.io.IOException;
import java.util.Map;

public interface MyPageService {

	/** 회원정보 수정 서비스
	 * @param paramMap
	 * @return result
	 */
	int updateInfo(Map<String, Object> paramMap)throws IOException;

}
