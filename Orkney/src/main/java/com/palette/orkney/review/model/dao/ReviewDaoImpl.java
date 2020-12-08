package com.palette.orkney.review.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public OrderDetail selectOrderDetail(SqlSession session, int odNo) {
		return session.selectOne("review.selectOrderDetail", odNo);
	}

	@Override
	public int insertReview(SqlSession session, Review review) {
		return session.insert("review.insertReview",review);
	}

	@Override
	public int insertReviewImage(SqlSession session, ReviewImage ri) {
		return session.insert("review.insertReviewImage", ri);
	}
	
}
