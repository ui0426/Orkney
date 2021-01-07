package com.palette.orkney.order.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.admin.model.dao.AdminDao;
import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.vo.Point;
import com.palette.orkney.order.model.dao.OrderDao;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.product.model.dao.ProductDao;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;
	@Autowired
	private SqlSession session;
	@Autowired
	private ProductDao pDao;
	@Autowired
	private AdminDao aDao;
		
	@Override
	public List<Map> selectOrderList(String mNo) {
		return dao.selectOrderList(session, mNo);
	}
	
	@Override
	public List<Map> selectOrderEndList(String mNo) {
		return dao.selectOrderEndList(session, mNo);
	}



	@Override
	public Orders selectOrder(String oNo) {
		return dao.selectOrder(session, oNo);
	}

	@Override
	public List<OrderDetail> selectOrderDetail(String oNo) {
		return dao.selectOrderDetail(session, oNo);
	}
	

	@Override
	public int cancelRequest(Orders order) {
		return dao.cancelRequest(session, order);
	}

	@Override
	public String selectEmail(String oNo) {
		return dao.selectEmail(session, oNo);
	}
	

	@Override
	public int orderConfirm(OrderDetail od, String mNo) {
		int result =  dao.orderConfirm(session, od);
		if(result>0) {
			int p = (int) (od.getProduct_qty()*od.getProduct_price()*0.05);
			System.out.println("적립포인트는? "+p);
			Map data = new HashMap();
			data.put("type", "적립");
			data.put("point", p);
			data.put("no", mNo);
			result = aDao.pointModify(session, data);
			if(result > 0) {
				System.out.println("멤버 테이블에 포인트 적립 완료");
				data.put("reason", od.getSort());
				result = aDao.modifyPoint(session, data);
				System.out.println("포인트 적립내역 추가 완료");
			}
		}
		return result;
	}

	@Override
	public int insertOrders(Orders orders, List<Cart> c) {
		int result =dao.insertOrders(session, orders);
		if(result>0) {
			for(Cart cart : c) {
				cart.setCartNo(orders.getOrder_no());
				result =dao.insertDetail(session,cart );
			}			
		}		
		return result;
	}

	@Override
	public int insertPoint(Map<String, Object> point) {
		return dao.insertPoint(session,point);
	}

	@Override
	public String selectOno(Orders orders) {	
		return dao.selectOno(session, orders);
	}

	@Override
	public int updateRefund(OrderDetail od) {
		return dao.updateRefund(session, od);
	}

//	@Override
//	public int insertPoint2(Map<String, Object> point2) {
//		// TODO Auto-generated method stub
//		return dao.insertPoint2(session, point2);
//	}

	
	

}
