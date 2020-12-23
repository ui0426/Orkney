package com.palette.orkney.review.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.review.model.dao.ReviewDao;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao dao;
	@Autowired
	private SqlSession session; 
	
	@Override
	public Review selectReview(int odNo) {
		return dao.selectOrderDetail(session, odNo);
	}

	@Override
	public int insertReview(Review review, List<ReviewImage> list) {
		int result = dao.insertReview(session, review);
		if(result>0) {
			if(list!=null) {
				for(ReviewImage ri : list) {
					ri.setReview_no(review.getReview_no());
					result = dao.insertReviewImage(session, ri);
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Review> selectReviewList(String mNo) {
		List<Review> review = dao.selectReviewList(session, mNo);
		if(!review.isEmpty()) {
			for(Review r : review) {
				if(r.getImg_count()>0) {					
					List<ReviewImage> ri = dao.selectReviewImage(session, r.getReview_no());
					r.setRiList(ri);
				}
			}
		}
		return review;
	}

	@Override
	public List<Review> selectBeforeReviewList(String mNo) {
		return dao.selectBeforeReviewList(session, mNo);
	}

	@Override
	public Review selectReviewToUpdate(int rNo) {
		Review r = dao.selectReviewToUpdate(session, rNo);
		if(r != null) {
			r.setRiList(dao.selectReviewImage(session, rNo));
		}
		return r;
	}

	@Override
	public int updateReview(Review review) {
		return dao.updateReview(session, review);
	}

//	@Override
//	public int updateReview(Review review, List<ReviewImage> list) {
//		int result = dao.updateReview(session, review);
//		if(result>0) {
//			if(list!=null) {				
//				for(ReviewImage ri : list) {
//					result = dao.updateReviewImage(session, ri);
//				}
//			}
//		}
//		return result;
//	}
	
	
	
	
	
}
