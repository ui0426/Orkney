package com.palette.orkney.review.model.service;

import java.util.List;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

public interface ReviewService {

	Review selectReview(int odNo);
	
	int insertReview(Review review, List<ReviewImage> list);
	
	List<Review> selectReviewList(String mNo);
	
	List<Review> selectBeforeReviewList(String mNo);
}
