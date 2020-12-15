package com.palette.orkney.cart.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

public interface CartService {
	//장바구니 비었는지 확인
	int countCart(String prodictNo,String memberNo);
	
	//장바구니 리스트 검색
	List<Cart> selectCart(String memberNo);
	
	//장바구니 수정(물품 추가시 증가)
	int updateCart(Cart cart);
	
	//장바구니 추가(상품디테일에서 해당상품 구매 클릭시)
	int insertCart(Cart cart);
	
	//장바구니 삭제를 위해 cartNo 가져옴 (ajax처리전)
	String selectCartNo(String memberNo);

	//장바구니 상품만 삭제
	int deleteProduct(Map<String, String> param);					
	
	//장바구니 수량 저장을 위한 수정
	int updateDetail(Cart cart);
	
	//장바구니 총 가격 (수량*상품*각상품수)
	int sumPrice(String cartNo);
	
	//상품가격(수량*상품)
	int productSum(Map<String, String> param1);
	
	//상품 종류 수량
	int selectCount(String cartNo);
	
	//카트삭제
	int cartDelete(String cartNo);
	
}
