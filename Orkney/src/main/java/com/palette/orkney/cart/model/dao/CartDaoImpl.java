package com.palette.orkney.cart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

@Repository
public class CartDaoImpl implements CartDao{

	@Override
	public List<Cart> selectCart(SqlSession session, String memberNo) {
		return session.selectList("cart.selectCart",memberNo);
	}
	
	@Override
	public String selectCartNo(SqlSession session, String memberNo) {
		return session.selectOne("cart.selectCartNo",memberNo);
	}

	@Override
	public int deleteProduct(SqlSession session, Map<String, String> param) {
		return session.delete("cart.deleteProduct", param);
	}		


	@Override
	public int updateDetail(SqlSession session, Cart cart) {	
		return session.update("cart.updateDetail",cart);
	}

	@Override
	public int sumPrice(SqlSession session, String cartNo) {	
		return session.selectOne("cart.sumPrice",cartNo);
	}

	@Override
	public int productSum(SqlSession session, Map<String, String> param1) {	
		return session.update("cart.productSum",param1);
	}

	@Override
	public int countCart(SqlSession session, String memberNo) {	
		Map<String, Object>map = new HashMap<String,Object>();		
		map.put("memberNo", memberNo);
		return session.selectOne("cart.countCart",map);
	}

	@Override
	public int updateCart(SqlSession session, Cart cart) {	
		return session.update("cart.updateCart",cart);
	}

	@Override
	public int insertCart(SqlSession session, Cart cart) {	
		return session.insert("cart.insertCart",cart);
	}

	@Override
	public int selectCount(SqlSession session, String cartNo) {	
		return session.selectOne("cart.selectCount",cartNo);
	}

	@Override
	public int cartDelete(SqlSession session, String cartNo) {
		return session.delete("cart.cartDelete",cartNo);
	}

	@Override
	public int insertDetail(SqlSession session, Cart cart) {	
		return session.insert("cart.insertDetail",cart);
	}

	
	
	
	





	
}
