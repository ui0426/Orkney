package com.palette.orkney.wishlist.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

@Repository
public class WishlistDaoImpl implements WishlistDao {

	@Override
	public Wishlist selectWishlist(SqlSession session, String mNo) {
		Wishlist wish = session.selectOne("wishlist.selectWishlist", mNo);
		String wNo = wish.getWishlist_no();
		ArrayList<Wishlist_detail> wide = (ArrayList)session.selectList("wishlist.selectWishlistDetail", wNo);
		wish.setWishlist_detail(wide);
		System.out.println("adhflkajdhfljakd"+wide.size());
		//System.out.println(wish.getWishlist_detail().isEmpty());
		return wish;
	}

	@Override
	public Wishlist selectWishlistCookie(SqlSession session, Map nos) {
		Wishlist wish = session.selectOne("wishlist.selectWishlistCookie", nos);
		if(wish != null) {
			
			String wNo = wish.getWishlist_no();
			ArrayList<Wishlist_detail> wide = (ArrayList)session.selectList("wishlist.selectWishlistDetail", wNo);
			System.out.println(wide);
			wish.setWishlist_detail(wide);
		}
		return wish;
	}

	//위시리스트들의 리스트 가져오기
	@Override
	public List<Wishlist> wishlistList(SqlSession session, String mNo) {
		ArrayList<Wishlist> wls = (ArrayList)session.selectList("wishlist.wishlistList", mNo);
		
		//내가 사용할 wishlist들이 담긴 리스트(wlList)
		ArrayList<Wishlist> wlList = new ArrayList<Wishlist>();
		for(Wishlist wl : wls) {
			String wNo = wl.getWishlist_no();
			ArrayList<Wishlist_detail> wides = (ArrayList)session.selectList("wishlist.selectWishlistDetail", wNo);
			wl.setWishlist_detail(wides);
			System.out.println("adfadfa"+wl);
			wlList.add(wl);
		}
		
		return wlList;
	}

	//위시리스트 제품 삭제하기
	@Override
	public int deleteWishProduct(SqlSession session, Map data) {
		System.out.println(data);
		return session.delete("wishlist.deleteWishProduct", data);
	}

	//다른 리스트로 제품 이동
	@Override
	public int moveWishlist(SqlSession session, Map nos) {
		return session.delete("wishlist.deleteWishProduct", nos);
	}

	//위시리스트에 제품 추가
	@Override
	public int insertWishProduct(SqlSession session, Map nos) {
		return session.insert("wishlist.insertWishProduct", nos);
	}

	//위시리스트 이름 바꾸기
	@Override
	public int wishNameUpdate(SqlSession session, Map data) {
		System.out.println("위시 이름 바꾸기 dao");
		return session.update("wishlist.wishNameUpdate", data);
	}
	
	//위시리스트 삭제하기
	@Override
	public int deleteWishlist(SqlSession session, String wNo) {
		return session.delete("wishlist.deleteWishlist", wNo);
	}

	//위시리스트 추가하기
	@Override
	public int addWishlist(SqlSession session, Map data) {
		return session.insert("wishlist.addWishlist", data);
	}

	//제품 수량 업하기
	@Override
	public int countUp(SqlSession session, Map data) {
		return session.update("wishlist.countUp", data);
	}

	//위시리스트에 특정 제품 있는지 확인
	@Override
	public Wishlist_detail isProductNo(SqlSession session, Map nos) {
		return session.selectOne("wishlist.isProductNo", nos);
	}

	//제품 수량 다운하기
	@Override
	public int countDown(SqlSession session, Map data) {
		return session.update("wishlist.countDown", data);
	}

	//위시리스트 제품 담기
	@Override
	public int insertWish(SqlSession session, Map data) {
		return session.insert("wishlist.insertWish", data);
	}


	

}
