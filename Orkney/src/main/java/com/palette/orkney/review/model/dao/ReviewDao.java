package com.palette.orkney.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

public interface ReviewDao {
	
	Review selectOrderDetail(SqlSession session, int odNo);
	
	int insertReview(SqlSession session, Review review);
	
	int insertReviewImage(SqlSession session, ReviewImage ri);
	
	List<Review> selectReviewList(SqlSession session, String mNo);
	
	List<ReviewImage> selectReviewImage(SqlSession session, int rNo);
	
	List<Review> selectBeforeReviewList(SqlSession session, String mNo);
	
	Review selectReviewToUpdate(SqlSession session, int rNo);
	
	int updateReview(SqlSession session, Review review);
	
	int updateReviewImage(SqlSession session, ReviewImage ri);

}
