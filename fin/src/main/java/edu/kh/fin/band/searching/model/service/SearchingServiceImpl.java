package edu.kh.fin.band.searching.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.searching.model.dao.SearchingDAO;
import edu.kh.fin.band.searching.model.vo.Searching;

@Service
public class SearchingServiceImpl implements SearchingService{
	
	
	@Autowired
	private SearchingDAO dao;


	@Override
	public List<Searching> checkSelect(Searching searching) {
		
		
		return dao.checkSelect(searching);
	}

}
