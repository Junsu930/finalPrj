package edu.kh.fin.band.board.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import java.util.UUID;
import com.google.gson.JsonObject;

@Controller
public class CkeditorFileUploadController {
	@PostMapping("/fileupload.do")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {
	
		//Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
		//파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						//파일 이름 설정
						String fileName = file.getName();
						//바이트 타입설정
						byte[] bytes;
						//파일을 바이트 타입으로 변경
						bytes = file.getBytes();
						//파일이 실제로 저장되는 경로 
						String uploadPath = request.getServletContext().getRealPath("/resources/ckimage/");
						//저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						//파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);
						
						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");
						
						//파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/resources/ckimage/" + fileName;
						
						//생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
			return null;
	}
}
