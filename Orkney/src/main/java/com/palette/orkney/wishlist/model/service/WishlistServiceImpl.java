package com.palette.orkney.wishlist.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.wishlist.model.dao.WishlistDao;
import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired
	private WishlistDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public Wishlist selectWishlist(String mNo) {
		return dao.selectWishlist(session, mNo);
	}

	@Override
	public Wishlist selectWishlistCookie(Map nos) {
		return dao.selectWishlistCookie(session, nos);
	}

	//위시리스트들의 리스트 가져오기
	@Override
	public List<Wishlist> wishlistList(String mNo) {
		return dao.wishlistList(session, mNo);
	}

	//위시리스트 제품 삭제하기
	@Override
	public int deleteWishProduct(Map data) {
		return dao.deleteWishProduct(session, data);
	}
	
	
	//다른 리스트로 제품 이동
	@Override
	public int moveWishlist(Map nos) {
		int result = dao.moveWishlist(session, nos);
		
		if(result > 0) {
			Wishlist_detail wd = dao.isProductNo(session, nos);
			System.out.println("요기요요요요요" + wd);
			if(wd != null) {
				result = dao.countUp(session, nos);
			} else {
				result = dao.insertWishProduct(session, nos);
			}
		}
		
		return result;
	}

	//위시리스트 이름 바꾸기
	@Override
	public int wishNameUpdate(Map data) {
		System.out.println("위시 이름 바꾸기 service");
		return dao.wishNameUpdate(session, data);
	}

	//위시리스트 삭제하기
	@Override
	public int deleteWishlist(String wNo, String mNo) {
		int result = dao.deleteWishlist(session, wNo);
		System.out.println("위시리스트 삭제" + result);
		if(result > 0) {
			ArrayList<Wishlist> wls = (ArrayList)session.selectList("wishlist.wishlistList", mNo);
			System.out.println("위시리스트 삭제" + wls);
			if(wls.size() == 0) {
				System.out.println("위시리스트 삭제" + wls);
				Map data = new HashedMap();
		        data.put("mNo", mNo);
		        data.put("addWName", "위시리스트");
		        
				result = dao.addWishlist(session, data);
			}
		}
		return result;
	}

	//위시리스트 추가하기
	@Override
	public int addWishlist(Map data) {
		return dao.addWishlist(session, data);
	}

	//제품수량 업하기
	@Override
	public int countUp(Map data) {
		return dao.countUp(session, data);
	}

	//제품 수량 다운하기
	@Override
	public int countDown(Map data) {
		return dao.countDown(session, data);
	}

	//위시리스트에 제품 담기
	@Override
	public int insertWish(Map nos) {
		
		Wishlist_detail wd = dao.isProductNo(session, nos);
		int result = 0;
		if(wd != null) {
			result = dao.countUp(session, nos);
		} else {
			result = dao.insertWishProduct(session, nos);
		}
		
		return result;
	}

	//위시리스트 총 개수
//	@Override
//	public int wlCount(String mNo) {
//		return dao.wlCount(session, mNo);
//	}

	
}
