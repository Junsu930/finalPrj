package edu.kh.fin.band.searching.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.kh.fin.band.searching.model.vo.Searching;


public interface SearchingService{

	

	List<Searching> checkSelect(Searching searching);
	
	
	

}
