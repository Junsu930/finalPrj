package edu.kh.fin.band.used.model.dao;

import java.util.ArrayList;
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

	/** 게시글 이미지 삽입
	 * @param img
	 * @return
	 */
	public int insertImageFile(UsedImage img) {
		return sqlSession.insert("usedBoard-mapper.insertImageFile", img);
	}

	/** 게시글 삭제
	 * @param hiddenNo
	 * @return
	 */
	public int deleteUsedBoard(int hiddenNo) {
		return sqlSession.update("usedBoard-mapper.deleteUsedBoard", hiddenNo);
	}

	/** 게시글 수정
	 * @param map
	 * @return
	 */
	public int updateUserForm(Map<String, Object> map) {
		
		
		return sqlSession.update("usedBoard-mapper.updateUsedBoard",map);
	}

	/** 이미지 있는 경우 이미지 수정
	 * @param img
	 * @return
	 */
	public int updateImageFile(UsedImage img) {
		
		int flCount = sqlSession.selectOne("usedBoard-mapper.flCount", img);
		
		// 만약에 이미 같은 레벨에 이미지가 있으면
		if(flCount > 0) {
			return sqlSession.update("usedBoard-mapper.updateImageFile", img);
		}else { // 이미지 레벨에 이미지가 없으면
			
			return sqlSession.insert("usedBoard-mapper.insertImageFile", img);
		}
		
	}

	public List<UsedImage> imageList(int usedBoard) {
		return sqlSession.selectList("usedBoard-mapper.imageList",usedBoard);
	}

	public int deleteXImages(Map<String,Object> delMap) {
		return sqlSession.delete("usedBoard-mapper.deleteXImages", delMap);
	}

	/** 판매완료 메서드
	 * @param boardNo
	 * @return
	 */
	public int completeSelling(int boardNo) {
		return sqlSession.update("usedBoard-mapper.completeSelling", boardNo);
	}
	
	
}
