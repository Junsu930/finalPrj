package edu.kh.fin.band.lesson.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import edu.kh.fin.band.lesson.model.vo.Lesson;

public class LessonDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	
	public String getDate() {
		String SQL = "Select NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류 
	}

	public int getNext() {
		String SQL = "SELECT LessonID FROM  Lesson ORDER BY LessonID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1 ;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
	}
	
	//실제로 글을 작성
	public int write(String LessonNo, String userNo, String introment,
				String joinDate, String lessonImg, String genre, String ints, 
				String Region, String detailment, String socialSite) {
		String SQL = "INSERT INTO Lesson VALUE(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, LessonNo);
			pstmt.setString(3, userNo);
			pstmt.setString(4, joinDate);
			pstmt.setString(5, lessonImg);
			pstmt.setString(6, genre);
			pstmt.setString(7, ints);
			pstmt.setString(8, Region);
			pstmt.setString(9, detailment);
			pstmt.setString(10, socialSite);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
	}
}
		