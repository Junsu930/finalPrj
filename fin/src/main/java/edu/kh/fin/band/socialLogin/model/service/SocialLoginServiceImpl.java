package edu.kh.fin.band.socialLogin.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import edu.kh.fin.band.login.model.vo.User;
import edu.kh.fin.band.socialLogin.model.dao.SocialLoginDAO;

@Service
public class SocialLoginServiceImpl implements SocialLoginService {
	
	@Autowired
	private SocialLoginDAO dao;

	@Override
	public int checkNaverFl(String email) {
		return dao.checkNaverFl(email);
	}

	@Override
	public int naverSignUp(Map<String, Object> map) {
		return dao.naverSignUp(map);
	}

	@Override
	public User getUser(int userNo) {
		return dao.getUser(userNo);
	}

	@Override
	public int changeToken(Map<String, Object> map) {
		return dao.changeToken(map);
	}

	/**
	 * 카카오 인증 코드 가져오기 
	 * @author lee
	 */
	@Override
	public String getToken(String code) {
		
		  String access_Token = "";
          String refresh_Token = "";
          String reqURL = "https://kauth.kakao.com/oauth/token";
          
          try {
              URL url = new URL(reqURL);

              HttpURLConnection conn = (HttpURLConnection) url.openConnection();

              //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로

              conn.setRequestMethod("POST");
              conn.setDoOutput(true);

              //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
              BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
              StringBuilder sb = new StringBuilder();
              sb.append("grant_type=authorization_code");
              sb.append("&client_id=de31983424f4bd5faadc8493b90e5626");  //본인이 발급받은 key
              sb.append("&redirect_uri=http://localhost:8091/fin/kakaoLogin");     // 본인이 설정해 놓은 경로
              sb.append("&code=" + code);
              bw.write(sb.toString());
              bw.flush();
//            결과 코드가 200이라면 성공
              int responseCode = conn.getResponseCode();
              System.out.println("responseCode : " + responseCode);

              //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
              BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
              String line = "";
              String result = "";

              while ((line = br.readLine()) != null) {
                  result += line;
              }
              System.out.println("response body : " + result);

              //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
              
              JsonElement element = (JsonObject)JsonParser.parseString(result);

              access_Token = element.getAsJsonObject().get("access_token").getAsString();
              refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

              

              br.close();
              bw.close();
          } catch (IOException e) {
              // TODO Auto-generated catch block
              e.printStackTrace();
          }

          return access_Token;
      }

	/**
	 * 인증코드를 바탕으로 액세스 토큰 가져오기
	 * @author lee
	 */
	@Override
	public HashMap<String, Object> getUserInfo(String accessToken) {
		
		 HashMap<String, Object> getUserInfo = new HashMap<>();
		 String reqURL = "https://kapi.kakao.com/v2/user/me";
		 try {
		        URL url = new URL(reqURL);
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        
		        //    요청에 필요한 Header에 포함될 내용
		        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		        int responseCode = conn.getResponseCode();
		        System.out.println("responseCode : " + responseCode);
		        
		        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        
		        String line = "";
		        String result = "";
		        
		        while ((line = br.readLine()) != null) {
		            result += line;
		        }
		        System.out.println("response body : " + result);
		        
		        JsonElement element = (JsonObject)JsonParser.parseString(result);
		        
		        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		        
		        String nick = properties.getAsJsonObject().get("nickname").getAsString();
		        String profileImg = properties.getAsJsonObject().get("profile_image").getAsString();
		        String email = kakao_account.getAsJsonObject().get("email").getAsString();
		        
		        getUserInfo.put("profileImg", profileImg);
		        getUserInfo.put("nick", nick);
		        getUserInfo.put("email", email);
		        getUserInfo.put("token", accessToken);
		        
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    
		    return getUserInfo;
	}

	/**
	 * kakaoSignUp + 액세스 토큰을 바탕으로 카카오 유저 정보를 가져와서 + 정보 디비 저장 + 유저넘버 가져오기 + 기존 회원이면 토큰 교체
	 * @author lee
	 */
	@Override
	public int kakaoSignUp(HashMap<String, Object> getUserInfoMap) {
		return dao.kakaoSignUp(getUserInfoMap);
	}
}
