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
		return dao.countOrderState(session);
	}

	@Override
	public int totalOrder() {	
		return dao.totalOrder(session);
	}

	@Override
	public List<OrderDetail> selectChangeList() {	
		return dao.selectChangeList(session);
	}

	@Override
	public List<Orders> updateOrderListState(int cPage, int numPerPage, Map m) {
		int result = dao.updateOrderListState(session, m);
		List<Orders> list = new ArrayList();
		if(result > 0) {
//			list = dao.selectOrderList(session,cPage,numPerPage);
		}
		return list;
	}
	
	
	
	
}
