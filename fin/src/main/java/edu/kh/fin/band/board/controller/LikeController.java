/*
package edu.kh.fin.band.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Qualifier;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import edu.kh.fin.band.board.model.vo.Board;
import edu.kh.fin.band.board.model.vo.BoardDetail;
import edu.kh.fin.band.board.model.vo.BoardLikeVO;
import edu.kh.fin.band.board.model.vo.Criteria;
import edu.kh.fin.band.board.model.vo.PageVO;
import edu.kh.fin.band.login.model.vo.User;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.fin.band.board.model.service.ReplyService;
import edu.kh.fin.band.board.model.vo.Reply;
import edu.kh.fin.band.board.model.service.BoardService;

@Controller
public class LikeController {
	  
	  @ResponseBody
	  @RequestMapping(value="/BoardLike/Board.do", method=RequestMethod.GET)
	  public String like(int boardno, HttpSession session){
	    int userNo = (Integer)session.getAttribute("userNO");
	    JSONObject obj = new JSONObject();

	    ArrayList<String> msgs = new ArrayList<String>();
	    HashMap <String, Object> hashMap = new HashMap<String, Object>();
	    hashMap.put("boardno", boardno);
	    hashMap.put("userNo", userNo);
	    BoardLikeVO BoardLikeVO = liketoProc.read(hashMap);
	    
	    BoardLikeVO boardVO = boardProc.read(boardno);
	    int like_cnt = boardVO.getLikeCheck();     //게시판의 좋아요 카운트
	    int like_check = 0;
	    like_check = boardVO.getLikeCheck();    //좋아요 체크 값
	    
	    if(liketoProc.countbyLike(hashMap)==0){
	      liketoProc.create(hashMap);
	    }
	      
	    if(like_check == 0) {
	      msgs.add("좋아요!");
	      liketoProc.like_check(hashMap);
	      like_check++;
	      like_cnt++;
	      boardProc.like_cnt_up(boardno);   //좋아요 갯수 증가
	    } else {
	      msgs.add("좋아요 취소");
	      liketoProc.like_check_cancel(hashMap);
	      like_check--;
	      like_cnt--;
	      boardProc.like_cnt_down(boardno);   //좋아요 갯수 감소
	    }
	    obj.put("boardno", boardVO.getBoardNo());
	    obj.put("like_check", like_check);
	    obj.put("like_cnt", like_cnt);
	    obj.put("msg", msgs);
	    
	    return obj.toJSONString();
	  }
	 
	}
	*/
