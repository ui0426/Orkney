package com.palette.orkney.review.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.order.model.vo.OrderDetail;
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
	public ModelAndView reviewForm(int odNo, ModelAndView mv) {
		System.out.println(odNo);
		Review r = service.selectReview(odNo);
		System.out.println(r);
		mv.addObject("review", r);
		mv.setViewName("review/reviewForm");
		return mv;
	}
	
	@RequestMapping(value="/review/reviewInsert.do", method = RequestMethod.POST)
	public ModelAndView insertReview(Review review, ModelAndView mv, @RequestParam(value="review_img", required=false) MultipartFile[] multi, HttpSession session ) {
		Map login = (Map)session.getAttribute("login");
		review.setMember_no((String)login.get("MEMBER_NO"));
		System.out.println("주문디테일 번호 : "+review.getOrder_detail_no());
		System.out.println("상품번호 : "+review.getProduct_no());
		System.out.println("별점 : "+review.getProduct_grade());
		System.out.println("리뷰내용 : "+review.getReview_content());
		System.out.println("multi : "+multi);

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
			}

		}
		int result=service.insertReview(review, files);
		mv.addObject("msg", result>0?"입력성공":"입력실패");
		mv.addObject("loc", "/review/reviewList.do");
		
		mv.setViewName("/common/msg");
		
		return mv;
	}
	
	@RequestMapping("/review/reviewList.do")
	public ModelAndView reviewList(HttpSession session, ModelAndView mv) {
		Map login = (Map)session.getAttribute("login");
		List<Review> beforeReview=service.selectBeforeReviewList((String)login.get("MEMBER_NO"));
		List<Review> review = service.selectReviewList((String)login.get("MEMBER_NO"));
		mv.addObject("beforeReview", beforeReview);
		mv.addObject("review", review);
		System.out.println("작성 가능한 리뷰 : "+beforeReview);
		System.out.println("작성 한 리뷰 : "+review);
		mv.setViewName("/review/reviewList");
		return mv;
	}

}
