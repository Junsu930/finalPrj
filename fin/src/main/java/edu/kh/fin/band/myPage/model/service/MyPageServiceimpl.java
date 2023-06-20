package edu.kh.fin.band.myPage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.myPage.model.dao.MyPageDAO;

@Service
public class MyPageServiceimpl implements MyPageService{
	
	@Autowired 
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;

}
