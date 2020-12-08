package com.palette.orkney.review.model.service;

import java.util.List;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

public interface ReviewService {

	OrderDetail selectOrderDetail(int odNo);
	
	int insertReview(Review review, List<ReviewImage> list);
}
