package edu.kh.fin.band.myBand.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.myBand.model.dao.MyBandDAO;
import edu.kh.fin.band.myBand.model.vo.MyBand;

@Service
public class MyBandService {

	@Autowired
	MyBandDAO dao;

	public List<MyBand> bandList(int bandNo) {
		return dao.bandList(bandNo);
	}
	
	
	
}
