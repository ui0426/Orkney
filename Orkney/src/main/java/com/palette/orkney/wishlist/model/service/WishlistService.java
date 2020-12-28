package com.palette.orkney.wishlist.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.palette.orkney.wishlist.model.vo.Wishlist;

public interface WishlistService {

	Wishlist selectWishlist(String mNo);

	Wishlist selectWishlistCookie(Map nos);

	//위시리스트들의 리스트 가져오기
	List<Wishlist> wishlistList(String mNo);

	//위시리스트 제품 삭제하기
	int deleteWishProduct(Map data);

	//다른 리스트로 제품 이동
	int moveWishlist(Map nos);

	//위시리스트 이름 바꾸기
	int wishNameUpdate(Map data);

	//위시리스트 삭제하기
	int deleteWishlist(String wNo, String mNo);

	//위시리스트 추가하기
	int addWishlist(Map data);

	//제품 수량 업하기
	int countUp(Map data);

	//제품 수량 다운하기
	int countDown(Map data);

	//위시리스트에 제품 담기
	int insertWish(Map data);

	//위시리스트 총 개수
//	int wlCount(String mNo);


}
