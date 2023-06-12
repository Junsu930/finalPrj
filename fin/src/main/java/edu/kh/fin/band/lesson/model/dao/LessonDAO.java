/*package edu.kh.fin.band.lesson.model.dao;

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
		String SQL = "SELECT LessonID FROM  BBS ORDER BY bbsid DESC";
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
	
	public int write(String LessonTitle, String userID, String LessonContent) {
		String SQL = "INSERT INTO Lesson VALUE(?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, LessonTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, LessonContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류 
	}
	
	public ArrayList<Lesson> getList(int pageNumber) {
		String SQL = "SELECT * FROM Lesson WHERE lesson < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Lesson> list = new ArrayList<Lesson>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Lesson Lesson = new Lesson();
				Lesson.setLessonID(rs.getInt(1));
				Lesson.setLessonTitle(rs.getString(2));
				Lesson.setUserID(rs.getString(3));
				Lesson.setLessonDate(rs.getString(4));
				Lesson.setLessonContent(rs.getString(5));
				Lesson.setLessonAvailable(rs.getInt(6));
				list.add(Lesson);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list; //데이터베이스 오류 
	}
	
	public boolean nextPage(int pageNumber) {
		String SQL = "SELECT * FROM BBS WHERE bbs < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
		ArrayList<Lesson> list = new ArrayList<Lesson>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false; //데이터베이스 오류 
	}
}

*/