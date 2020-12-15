package com.palette.orkney.order.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
	@Override
	public List<Map> selectOrderList(String mNo) {
		return dao.selectOrderList(session, mNo);
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
	public int updateSort(OrderDetail od) {
		int result =  dao.updateSort(session, od);
		if(result>0 && od.getSort().equals("구매확정")) {
			result = dao.insertShipped(session, od);
			if(result >0) {
				int pStock=0;
				for(Map p : pDao.productDetail(session, od.getProduct_no())){
					pStock=Integer.parseInt(String.valueOf(p.get("PRODUCT_STOCK")));
				}
				System.out.println("출고 전 재고 : "+pStock);
				Map m = new HashMap();
				m.put("stock", String.valueOf(pStock-(int)od.getProduct_qty()));
				m.put("no", od.getProduct_no());
				pDao.updateStock(session, m);
			}
		}
		return result;
	}

	

	
	

}
