package com.palette.orkney.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.admin.model.service.AdminService;
import com.palette.orkney.review.model.service.ReviewService;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("login")
@Slf4j
public class ReviewController {

	@Autowired
	private ReviewService service;
	@Autowired
	private AdminService aservice;
	
	@RequestMapping("/review/reviewLoginCheck.do")
	@ResponseBody
	public boolean reviewForm(HttpSession session) {
		Map login = (Map)session.getAttribute("login");
		if(login != null && !login.isEmpty() ) {		
			return true;
		}else {			
			return false;
		}
	}
	
	@RequestMapping("/review/reviewForm.do")
	public ModelAndView reviewForm(int odNo, ModelAndView mv, HttpSession session) {
		Map login = (Map)session.getAttribute("login");
		
		if(login != null) {			
			System.out.println(odNo);
			Review r = service.selectReview(odNo);
			System.out.println("혹시리뷰번호까지 담아오니??:"+r);
			mv.addObject("review", r);
			mv.setViewName("review/reviewForm");
		}
		return mv;
	}
	
	//by윤나-리뷰 작성
	@RequestMapping(value="/review/reviewInsert.do", method = RequestMethod.POST)
	public String insertReview(Review review, Model m, @RequestParam(value="review_img", required=false) MultipartFile[] multi, 
								HttpSession session ) throws IOException{
		Map login = (Map)session.getAttribute("login");
		review.setMember_no((String)login.get("MEMBER_NO"));
		Map data = new HashMap();//포인트 적립 정보 담을 것
		data.put("point", 200);
		data.put("reason", "리뷰작성(텍스트형)");

		//저장경로 지정
		String path=session.getServletContext().getRealPath("/resources/upload/review");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		
		List<ReviewImage> files=new ArrayList();
		
		for(MultipartFile f : multi) {
			System.out.println("file "+f);
			if(!f.isEmpty()) {
				String originalName = f.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".")+1);
				System.out.println(ext);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				ReviewImage ri=ReviewImage.builder().originalFileName(originalName).renamedFileName(reName).build();
				files.add(ri);
				data.put("point", 500);
				data.put("reason", "리뷰작성(사진형)");
			}
		}
		int result=service.insertReview(review, files);
		
		if(result>0) {
			System.out.println("리뷰 성공???");
			data.put("type", "적립");
			data.put("no", review.getMember_no());
			result = aservice.modifyPoint(data);
		}
		if(result>0) {
			m.addAttribute("msg", "소중한 리뷰 감사합니다! "+data.get("point")+"포인트 적립 완료!");
			m.addAttribute("loc", "/review/reviewList.do?s=wrote");
		}else {
			m.addAttribute("msg", "죄송합니다. 리뷰 등록에 실패하였습니다.");
			m.addAttribute("loc", "/review/reviewList.do?s=reviewable");
		}
		return "/common/msg";
	}
	
	@RequestMapping("/review/reviewList.do")
	public ModelAndView reviewList(String s,HttpSession session, ModelAndView mv) {
		Map login = (Map)session.getAttribute("login");
		List<Review> beforeReview=service.selectBeforeReviewList((String)login.get("MEMBER_NO"));
		List<Review> review = service.selectReviewList((String)login.get("MEMBER_NO"));
		mv.addObject("beforeReview", beforeReview);
		mv.addObject("review", review);
		mv.addObject("s", s);
		//System.out.println("작성 가능한 리뷰 : "+beforeReview);
		//System.out.println("작성 한 리뷰 : "+review);
		mv.setViewName("/review/reviewList");
		return mv;
	}
	
	@RequestMapping("/review/reviewUpdate.do")
	public ModelAndView reviewUpdate(int rNo, ModelAndView mv, HttpSession session) {
		Map login = (Map)session.getAttribute("login");
		if(login != null) {			
			Review review=service.selectReviewToUpdate(rNo);
			mv.addObject("review", review);
			//System.out.println("수정할 것: "+review);
			mv.setViewName("review/reviewUpdate");
		}
		return mv;
	}
	
	@RequestMapping("/review/reviewUpdateEnd.do")
	@ResponseBody
	public int reviewUpdateEnd(Review review, HttpSession session) {
		System.out.println("수정 한 후 전송한 데이터 : "+review);
//		String path=session.getServletContext().getRealPath("/resources/upload/review");
//		
//		File dir = new File(path);
//		
//		List<ReviewImage> files=new ArrayList();
//		
//		for(MultipartFile f : multi) {
//			if(!f.isEmpty()) {
//				String originalName = f.getOriginalFilename();
//				String ext = originalName.substring(originalName.lastIndexOf(".")+1);
//				System.out.println(ext);
//				
//				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//				int rndValue = (int)(Math.random()*10000);
//				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
//				try {
//					f.transferTo(new File(path+"/"+reName));
//				}catch(IOException e) {
//					e.printStackTrace();
//				}
//				ReviewImage ri=ReviewImage.builder().review_no(review.getReview_no()).originalFileName(originalName).renamedFileName(reName).build();
//				files.add(ri);
//			}
//
//		}
//		int result=service.updateReview(review, files);
		int result=service.updateReview(review);
		System.out.println("수정결과 : "+result);
		
		return result;
	}
	
	//작성가능한 리뷰개수 가져오기
	@RequestMapping("/review/reviewQty")
	@ResponseBody
	public int reviewQty(HttpSession session) {
		Map login = (Map)session.getAttribute("login");
		String mNo = (String)login.get("MEMBER_NO");
		
		return service.selectBeforeReviewList((String)login.get("MEMBER_NO")).size();
		
	}
	

}
