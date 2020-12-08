package com.palette.orkney.review.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.order.model.vo.OrderDetail;
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
	public OrderDetail selectOrderDetail(int odNo) {
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
	
}
