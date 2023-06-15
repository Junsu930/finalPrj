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
	
	
	

}
