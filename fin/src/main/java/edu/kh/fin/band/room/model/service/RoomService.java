package edu.kh.fin.band.room.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.fin.band.room.model.dao.RoomDAO;
import edu.kh.fin.band.room.model.vo.Room;

@Service
public class RoomService {

	@Autowired
	RoomDAO dao;

	public List<Room> roomList() {
		return dao.roomList();
	}

	public Room roomDetail(int pracRoomNo) {
		return dao.roomDetail(pracRoomNo);
	}

	public List<Room> searchingRoomList(String region, String searchingText) {
		return dao.searchingRoomList(region, searchingText);
	}
	
}
