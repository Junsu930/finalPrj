package edu.kh.fin.band.used.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.fin.band.used.model.vo.UsedImage;
import edu.kh.fin.band.used.model.vo.UsedVo;

@Repository
public class UsedDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<UsedVo> usedRoomScroll() {
		return sqlSession.selectList("usedBoard-mapper.usedRoomScroll");
	}

	public List<UsedVo> usedSearchingRoomScroll(String region, String searchingText) {
		
		HashMap<String, Object> map = new HashMap<>(); 
		
		searchingText = '%' + searchingText + '%';
		region = '%' + region + '%';
		
		map.put("region", region);
		map.put("searchingText", searchingText);
		
		return sqlSession.selectList("usedBoard-mapper.usedSearchingRoomScroll", map);
	}

	public UsedVo useDetail(int usedBoard) {
		return sqlSession.selectOne("usedBoard-mapper.useDetail", usedBoard);
	}

	public int writeUsedForm(Map<String, Object> map) {

		int result = sqlSession.insert("usedBoard-mapper.writeUsedForm", map);
		
		if(result>0) result = (Integer)map.get("boardNo");
				
		return result;
	}

	public int insertImageFile(UsedImage img) {
		return sqlSession.insert("usedBoard-mapper.insertImageFile", img);
	}

	public int deleteUsedBoard(int hiddenNo) {
		return sqlSession.update("usedBoard-mapper.deleteUsedBoard", hiddenNo);
	}
	
	
}
