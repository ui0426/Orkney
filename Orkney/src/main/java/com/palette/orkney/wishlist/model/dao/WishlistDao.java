package com.palette.orkney.wishlist.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

public interface WishlistDao {

	Wishlist selectWishlist(SqlSession session, String mNo);

	Wishlist selectWishlistCookie(SqlSession session, Map nos);

	//위시리스트들의 리스트 가져오기
	List<Wishlist> wishlistList(SqlSession session, String mNo);

	//위시리스트 제품 삭제하기
	int deleteWishProduct(SqlSession session, Map data);

	//다른 리스트로 제품 이동
	int moveWishlist(SqlSession session, Map nos);

	//위시리스트에 제품 추가
	int insertWishProduct(SqlSession session, Map nos);

	//위시리스트 이름 바꾸기
	int wishNameUpdate(SqlSession session, Map data);

	//위시리스트 삭제하기
	int deleteWishlist(SqlSession session, String wNo);

	//위시리스트 추가하기
	int addWishlist(SqlSession session, Map data);
	
	//제품수량 업하기
	int countUp(SqlSession session, Map data);
	
	//위시리스트에 특정 제품 있는지  확인
	Wishlist_detail isProductNo(SqlSession session, Map nos);

	//제품수량 다운하기
	int countDown(SqlSession session, Map data);

	//위쉬리스트 제품 담기
	int insertWish(SqlSession session, Map data);



}
