package edu.kh.fin.band.used.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

	public int writeUsedForm(Map<String, Object> map, List<MultipartFile> images, String webPath, String folderPath) {
	
		// 1) xss(크로스 사이트 스크립트) 방지 처리 + 개행문자처리
		map.put("usedDetailInput",Util.XSSHandling((String)map.get("usedDetailInput")));
		map.put("usedDetailInput",Util.newLineHandling((String)map.get("usedDetailInput")));

		int boardNo = dao.writeUsedForm(map);
		// 변경된 파일명 저장
		// 2023060734534_334
		
		int imageAllResult = 0;
		
		if(boardNo > 0) { // 게시글 삽입 성공 후 이미지 넣기

			for(int i=0; i <images.size(); i++) {
				// 실제 이미지가 있는 경우
				if(images.get(i).getSize()>0) {
					UsedImage img = new UsedImage();
					String reName;
					
					reName = Util.fileRename(images.get(i).getOriginalFilename());
					
					// BoardImage 객체를 생성하여 값 세팅 후 boardImageList에 추가 
					img.setBoardNo(boardNo); // 게시글 번호
					img.setImageOriginal(images.get(i).getOriginalFilename()); // 원본 파일명
					img.setImageRename(webPath+reName); // 웹 접근경로 + 변경된 파일명
					img.setImageLevel(i);
					
					imageAllResult = dao.insertImageFile(img);
					try {
						images.get(i).transferTo(new File(folderPath + reName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
		return imageAllResult;
		
	}


	public int deleteUsedBoard(int hiddenNo) {
		return dao.deleteUsedBoard(hiddenNo);
	}


	public int updateUsedForm(Map<String, Object> map, List<MultipartFile> images, String webPath, String folderPath) {
		

		// 1) xss(크로스 사이트 스크립트) 방지 처리 + 개행문자처리
		map.put("usedDetailInput",Util.XSSHandling((String)map.get("usedDetailInput")));
		map.put("usedDetailInput",Util.newLineHandling((String)map.get("usedDetailInput")));

		
		int boardResult = dao.updateUserForm(map);
		int result = 0;
		
		if(boardResult > 0) {
			for(int i=0; i<images.size(); i++) {
				
				// 이미지가 업로드된 경우
				if(images.get(i).getSize()>0) {
					
					System.out.println("변경된 이미지"+images.get(i));
					
					UsedImage img = new UsedImage();
					String reName;
					
					// 여기서 일단 기본 게시글을 업데이트하고 이미지 파일을 업데이트 하는 부분부터 진행
					reName = Util.fileRename(images.get(i).getOriginalFilename());
					
					// BoardImage 객체를 생성하여 값 세팅 후 boardImageList에 추가 
					img.setBoardNo(Integer.parseInt((String)map.get("hiddenUpdateVal"))); // 게시글 번호
					img.setImageOriginal(images.get(i).getOriginalFilename()); // 원본 파일명
					img.setImageRename(webPath+reName); // 웹 접근경로 + 변경된 파일명
					img.setImageLevel(i);
					result = dao.updateImageFile(img);
					
					try {
						images.get(i).transferTo(new File(folderPath + reName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}
		
		return result;
	}


	public int updateUsedForm(Map<String, Object> map) {
		
		// 1) xss(크로스 사이트 스크립트) 방지 처리 + 개행문자처리
		map.put("usedDetailInput",Util.XSSHandling((String)map.get("usedDetailInput")));
		map.put("usedDetailInput",Util.newLineHandling((String)map.get("usedDetailInput")));
		
		return dao.updateUserForm(map);
	}


	public List<UsedImage> imageList(int usedBoard) {
		return dao.imageList(usedBoard);
	}

}
