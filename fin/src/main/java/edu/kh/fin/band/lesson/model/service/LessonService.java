package edu.kh.fin.band.lesson.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.fin.band.common.Util;
import edu.kh.fin.band.lesson.model.dao.LessonDAO;
import edu.kh.fin.band.lesson.model.vo.Lesson;
import edu.kh.fin.band.lesson.model.vo.LessonImage;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;

	/**
	 * 레슨 무한 스크롤 service
	 * @author lee
	 * @return
	 */
	public List<Lesson> lessonList() {
		return dao.lessonList();
	}

	public int writeLessonForm(Map<String, Object> map, List<MultipartFile> images, String webPath, String folderPath) {
		
		int lessonNo = dao.writeLessonForm(map);
		
		// lessonNo 반환
		
		int imageAllResult = 0;
		
		if(lessonNo > 0) { // 게시글 삽입 성공 후 이미지 넣기

			for(int i=0; i <images.size(); i++) {
				// 실제 이미지가 있는 경우
				if(images.get(i).getSize()>0) { 
					LessonImage img = new LessonImage();
					String reName;
					
					reName = Util.fileRename(images.get(i).getOriginalFilename());
					
					// LessonImge 객체를 생성하여 값 세팅 후 lessonImageList에 추가 
					img.setLessonNo(lessonNo); // 게시글 번호
					img.setImageOriginal(images.get(i).getOriginalFilename()); // 원본 파일명
					img.setImageRename(webPath+reName); // 웹 접근경로 + 변경된 파일명
					img.setImageLevel(i);
					
					imageAllResult = dao.insertImageFile(img);
					
					System.out.println("이미지 저장"+ folderPath +  reName);
					
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
	
	
	
	/**
	 * 레슨 필터 리스트 조회 service
	 * @author lee
	 * @param lessonText
	 * @param locText
	 * @return
	 */
	public List<Lesson> lessonFilter(String lessonText, String locText) {
		return dao.lessonFilter(lessonText,locText);
	}
	
	

	/**
	 * 레슨 게시글 디테일 가져오기 service
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public Lesson selectDetail(int lessonNo) {
		return dao.selectDetail(lessonNo);
	}

	/**
	 * 레슨 디테일 이미지 가져오기 service
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public LessonImage selectLessonImg(int lessonNo) {
		return dao.selectLessonImg(lessonNo);
	}
	
	/**
	 * 레슨 디테일 조회 시, 하단 추천 강사 뜨기(랜덤 조회) service
	 * @author lee
	 * @return
	 */
	public List<Lesson> lessonListRandom() {
		return dao.lessonListRandom();
	}

	/**
	 * 레슨 글 삭제 서비스
	 * @author lee
	 * @param lessonNo
	 * @return
	 */
	public int deleteLesson(int lessonNo) {
		
		return dao.deleteLesson(lessonNo);
	}

	

	

	
}
