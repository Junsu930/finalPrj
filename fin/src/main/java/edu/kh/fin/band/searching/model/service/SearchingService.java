package edu.kh.fin.band.searching.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.fin.band.searching.model.vo.Searching;


public interface SearchingService{

	

	/** 
	 * 조건에 맞는 멤버 조회 서비스
	 * @author lee
	 * @param searching
	 * @return
	 */
	List<Searching> checkSelect(Searching searching);

	
	
	/** 서칭 페이지 접속시 매칭인포가 작성되어있는지 확인하는 서비스
	 * @param userNo
	 * @return result
	 */
	public abstract String checkInfo(int userNo);
	
	
	

}
