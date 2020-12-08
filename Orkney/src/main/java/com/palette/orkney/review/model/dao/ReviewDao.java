package com.palette.orkney.review.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

public interface ReviewDao {
	
	OrderDetail selectOrderDetail(SqlSession session, int odNo);
	
	int insertReview(SqlSession session, Review review);
	
	int insertReviewImage(SqlSession session, ReviewImage ri);

}
