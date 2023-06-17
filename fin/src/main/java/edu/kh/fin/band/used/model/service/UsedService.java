package edu.kh.fin.band.used.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.used.model.dao.UsedDAO;
import edu.kh.fin.band.used.model.vo.UsedImage;
import edu.kh.fin.band.used.model.vo.UsedVo;

@Service
public class UsedService {

	@Autowired
	UsedDAO dao;
	
	
	public List<UsedVo> usedRoomScroll() {
		return dao.usedRoomScroll();
	}


	public List<UsedVo> usedSearchingRoomScroll(String region, String searchingText) {
		return dao.usedSearchingRoomScroll(region, searchingText);
	}


	public UsedVo useDetail(int usedBoard) {
		return dao.useDetail(usedBoard);
	}

	public int writeUsedForm(Map<String, Object> map, MultipartFile images, String webPath, String folderPath) {
	
		
		map.get("usedDetailInput");
		// 1) xss(크로스 사이트 스크립트) 방지 처리 + 개행문자처리
		map.put("usedDetailInput",Util.XSSHandling((String)map.get("usedDetailInput")));
		map.put("usedDetailInput",Util.newLineHandling((String)map.get("usedDetailInput")));

		int boardNo = dao.writeUsedForm(map);
		// 변경된 파일명 저장
		// 2023060734534_334
		UsedImage img = new UsedImage();
		String reName;
		if(boardNo > 0) {
			
			reName = Util.fileRename(images.getOriginalFilename());
			
			// BoardImage 객체를 생성하여 값 세팅 후 boardImageList에 추가 
			img.setBoardNo(boardNo); // 게시글 번호
			img.setImageOriginal(images.getOriginalFilename()); // 원본 파일명
			img.setImageRename(webPath+reName); // 웹 접근경로 + 변경된 파일명
			
			try {
				images.transferTo(new File(folderPath + reName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		int result = dao.insertImageFile(img);
		
		
		return result;
		
	}


	public int deleteUsedBoard(int hiddenNo) {
		return dao.deleteUsedBoard(hiddenNo);
	}

}
