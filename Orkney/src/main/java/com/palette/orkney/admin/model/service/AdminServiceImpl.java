package com.palette.orkney.admin.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.admin.model.dao.AdminDao;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.product.model.vo.Product;
import com.palette.orkney.product.model.vo.Product_image;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map> chatData(Map data) {
		
		return dao.chatData(session,data);
	}
	
	@Override
	public List<String> userCount() {
		
		return dao.userCount(session);
	}

	@Override
	public List<String> roomNo(String data) {
		// TODO Auto-generated method stub
		return dao.roomNo(session,data);
	}

	@Override
	public List<Orders> selectOrderList(int cPage,int numPerPage,String search_option,String keyword) {
		return dao.selectOrderList(session,cPage,numPerPage,search_option,keyword);
	}

	@Override
	public int modifyFAQ(Map data) {
		// TODO Auto-generated method stub
		return dao.modifyFAQ(session,data);
	}

	@Override
	public int addFAQ(Map data) {
		// TODO Auto-generated method stub
		return dao.addFAQ(session,data);
	}

	@Override
	public int deleteFAQ(String no) {
		// TODO Auto-generated method stub
		return dao.deleteFAQ(session,no);
	}

	@Override
	public List<Map> memberList(int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		return dao.memberList(session,cPage,numPerPage);
	}

	@Override
	public int totalData() {
		// TODO Auto-generated method stub
		return dao.totalData(session);
	}

	@Override
	public List<Map> memberAddr(String no) {
		// TODO Auto-generated method stub
		return dao.memberAddr(session,no);
	}

	@Override
	public List<Map> orderList(String no) {
		// TODO Auto-generated method stub
		return dao.orderList(session,no);
	}

	@Override
	public int deleteMember(String no) {
		// TODO Auto-generated method stub
		return dao.deleteMember(session,no);
	}

	@Override
	public int modifyPoint(Map data) {
		// TODO Auto-generated method stub
		int result=dao.modifyPoint(session,data);
		int result2=0;
		if(result>0) {
			result2=dao.pointModify(session,data);
		}		
		return result;
	}
	
	public int updateOrderState(Map o) {
		return dao.updateOrderState(session, o);
	}

	@Override
	public int updateOrderInfo(Map orderInfo) {
		return dao.updateOrderInfo(session, orderInfo);
	}
	
	@Override
	public Map countOrderState() {	
		Map m = dao.countOrderState(session);
		Map m2 = dao.countOrderDetailState(session);
		m2.put("주문확인", m.get("주문확인"));
		m2.put("취소신청",m.get("취소신청"));
		return m2;
	}

	@Override
	public int totalOrder() {	
		return dao.totalOrder(session);
	}

	@Override
	public List<Orders> selectOrderChangeList(Map s) {	
			return dao.selectOrderChangeList(session, s);
	}

	@Override
	public List<Orders> updateOrderListState(int cPage, int numPerPage, Map m, String search_option, String keyword) {
		int result = dao.updateOrderListState(session, m);
		System.out.println("업데이트 결과 값"+result);
		List<Orders> list = new ArrayList();
		if(result != 0) {
			list = dao.selectOrderList(session,cPage,numPerPage, search_option, keyword);
			System.out.println("리스트 갱신 : "+list);
		}
		return list;
	}

	@Override
	public List<OrderDetail> selectOrderDetailChangeList(String state) {
		return dao.selectOrderDetailChangeList(session, state);
	}

	@Override
	public List<Map> productList(int cPage, int numPerPage, Map<String,Object> all) {
		List<Map> list = new ArrayList<Map>();
		list = dao.productList(session,cPage, numPerPage, all);
		
		return list;
	}
	
	@Override
	public int productTotalData() {

		return dao.productTotalData(session);
	}

	@Override
	public int productPer(Map<String, Object> list) {
		// TODO Auto-generated method stub
		return dao.productPer(session,list);
	}
	
	@Override
	public int deleteProduct(String pNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteProductImg(session,pNo);
		return dao.deleteProduct(session,pNo);
	}

	@Override
	public List<Map> productOne(Map<String, Object> list) {
		// TODO Auto-generated method stub
		return dao.productOne(session,list);
	}

	@Override
	public int productPutIn(Map<String, Object> list) {
		// TODO Auto-generated method stub
		return dao.productPutIn(session,list);
	}

	@Override
	public int productInsert(Product product, List<Product_image> files, String[] img) {
		// TODO Auto-generated method stub
		int result = dao.productInsert(session, product); 
		System.out.println("반환값:"+result);
		System.out.println("반환값:2"+product);
//		Product_image pi = new Product_image();
		int index=0;
		if(result>0) {
			if(files!=null) {
//				for (int i = 0; i < files.size(); i++) {
//					pi.setRenamedFileName();
//					pi.setProduct_no("p"+product.getProductNo());
//					pi.setProduct_color(img[i]);
//					System.out.println("가자:"+pi);
//				}
				for(Product_image pi : files) {
					pi.setProduct_color(img[index]);
					index++;
					pi.setProduct_no("p"+product.getProductNo());
					System.out.println("가자:"+pi);
					result = dao.insertProductImage(session, pi);
				}
			}
		}
		
		return result;
	}
	public int selectRefundCount(String oNo) {
		return dao.selectRefundCount(session, oNo);
	}

	@Override
	public int updateStateAndSort(Map m) {
		return dao.updateStateAndSort(session, m);
	}

	@Override
	public List<OrderDetail> selectOrderOngoingList() {
		return dao.selectOrderOngoingList(session);
	}

	@Override
	public int updateSortEnd(Map m) {
		return dao.updateSortEnd(session, m);

	}
	
	
	
	
	
	
}
