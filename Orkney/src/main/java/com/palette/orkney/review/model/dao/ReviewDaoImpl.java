package com.palette.orkney.review.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

@Repository
public class ReviewDaoImpl implements ReviewDao {

	@Override
	public Review selectOrderDetail(SqlSession session, int odNo) {
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

	@Override
	public List<Review> selectReviewList(SqlSession session, String mNo) {
		return session.selectList("review.selectReviewList", mNo);
	}

	@Override
	public List<ReviewImage> selectReviewImage(SqlSession session, int rNo) {
		return session.selectList("review.selectReviewImage", rNo);
	}

	@Override
	public List<Review> selectBeforeReviewList(SqlSession session, String mNo) {
		return session.selectList("review.selectBeforeReviewList", mNo);
	}
	
	
	
}
