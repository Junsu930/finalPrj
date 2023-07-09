package edu.kh.fin.band.room.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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

	public int pracRoomBooking(ArrayList<Integer> timeArr, HashMap<String, Object> map) {
		return dao.pracRoomBooking(timeArr, map);
	}

	public List<Integer> checkBookingTime(HashMap<String, Object> dayMap) {
		return dao.checkBookingTime(dayMap);
	}

	/**
	 * 예약을 하면서 오너에게 알람을 보내는 서비스
	 * @author lee
	 * @param map
	 * @return
	 */
	public int roomAlarmResult(HashMap<String, Object> map) {
		
		// 해당 맵 안에는 로그인 넘버, 룸 넘버가 있는데 해당 룸을 등록한 오너의 오너 넘버를 먼저 가지고 와서 map 세팅해야함
		int ownerNo = dao.selectOwnerNo(map);
		map.put("ownerNo", ownerNo);
		
		// 오너 넘버가 세팅된 맵을 다시 인서트 구문으로 보내기
		return dao.roomAlarmResult(map);
	}
	
}
