package com.palette.orkney.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<String> userCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.userCount");
	}

	@Override
	public List<Map> chatData(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.selectList("admin.chatData",data);
	}

	@Override
	public List<String> roomNo(SqlSession session, String data) {
		// TODO Auto-generated method stub
		return session.selectList("admin.roomNo",data);
	}

	@Override
	public List<Orders> selectOrderList(SqlSession session,int cPage,int numPerPage,String search_option,String keyword) {
		RowBounds rs=new RowBounds((cPage-1)*numPerPage,numPerPage);
		
	    Map<String,Object> map = new HashMap<>();
        map.put("search_option", search_option);
        map.put("keyword", keyword);              
		return session.selectList("admin.selectOrderList",map,rs);
	}

	@Override
	public int modifyFAQ(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.update("admin.modifyFAQ",data);
	}

	@Override
	public int addFAQ(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.insert("admin.addFAQ",data);
	}

	@Override
	public int deleteFAQ(SqlSession session, String no) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteFAQ",no);
	}

	@Override
	public List<Map> memberList(SqlSession session,int cPage,int numPerPage,Map data) {		
		RowBounds r=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.memberList",data,r);
	}

	@Override
	public int totalData(SqlSession session,Map data) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.totalData",data);
	}

	@Override
	public List<Map> memberAddr(SqlSession session,String no) {
		// TODO Auto-generated method stub
		return session.selectList("admin.memberAddr",no);
	}

	@Override
	public List<Map> orderList(SqlSession session, String no) {
		// TODO Auto-generated method stub
		return session.selectList("admin.orderList",no);
	}

	@Override
	public int deleteMember(SqlSession session, String no) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteMember",no);
	}

	@Override
	public int modifyPoint(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.insert("admin.modifyPoint",data);
	}

	@Override
	public int pointModify(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.update("admin.pointModify",data);
	}

	public int updateOrderState(SqlSession session, Map o) {
		return session.update("admin.updateOrderState", o);
	}

	@Override
	public int updateOrderInfo(SqlSession session, Map orderInfo) {
		return session.update("admin.updateOrderInfo", orderInfo);
	}

	@Override
	public Map countOrderState(SqlSession session) {	
		return session.selectOne("admin.countOrderState");
	}

	@Override
	public Map countOrderDetailState(SqlSession session) {
		return session.selectOne("admin.countOrderDetailState");
	}

	@Override
	public int totalOrder(SqlSession session) {	
		return session.selectOne("admin.totalOrder");
	}

	@Override
	public List<Orders> selectOrderChangeList(SqlSession session, Map s) {	
		return session.selectList("admin.selectOrderChangeList", s);
	}

	@Override
	public int updateOrderListState(SqlSession session, Map m) {
		return session.update("admin.updateOrderListState", m);
	}

	@Override
	public List<OrderDetail> selectOrderDetailChangeList(SqlSession session, String state) {
		return session.selectList("admin.selectOrderDetailChangeList", state);
	}

	@Override
	public int selectRefundCount(SqlSession session, String oNo) {
		return session.selectOne("admin.selectRefundCount", oNo);
	}

	@Override
	public int updateStateAndSort(SqlSession session, Map m) {
		System.out.println(m);
		return session.update("admin.updateStateAndSort", m);
	}

	@Override
	public List<OrderDetail> selectOrderOngoingList(SqlSession session) {
		return session.selectList("admin.selectOrderOngoingList");
	}

	@Override
	public int updateSortEnd(SqlSession session, Map m) {
		return session.update("admin.updateSortEnd", m);
	}	
	
	
	
	
}
