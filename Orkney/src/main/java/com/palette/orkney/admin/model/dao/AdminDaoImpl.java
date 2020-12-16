package com.palette.orkney.admin.model.dao;

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
	public List<Orders> selectOrderList(SqlSession session,int cPage,int numPerPage) {
		RowBounds rs=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectOrderList",null,rs);
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
	public List<Map> memberList(SqlSession session,int cPage,int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds r=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.memberList",null,r);
	}

	@Override
	public int totalData(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.totalData");
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
	public int totalOrder(SqlSession session) {	
		return session.selectOne("admin.totalOrder");
	}

	@Override
	public List<OrderDetail> selectChangeList(SqlSession session) {	
		return session.selectList("admin.selectChangeList");
	}

	@Override
	public int updateOrderListState(SqlSession session, Map m) {
		return session.update("admin.updateOrderListState", m);
	}	
	
	
	
}
