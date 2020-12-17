package com.palette.orkney.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface AdminDao {

	List<String> userCount(SqlSession session);

	List<Map> chatData(SqlSession session, Map data);

	List<String> roomNo(SqlSession session, String data);

	List<Orders> selectOrderList(SqlSession session,int cPage, int numPerPage,String search_option,String keyword);

	int modifyFAQ(SqlSession session, Map data);

	int addFAQ(SqlSession session, Map data);

	int deleteFAQ(SqlSession session, String no);

	List<Map> memberList(SqlSession session, int cPage, int numPerPage);

	int totalData(SqlSession session);

	List<Map> memberAddr(SqlSession session, String no);

	List<Map> orderList(SqlSession session, String no);

	int deleteMember(SqlSession session, String no);

	int modifyPoint(SqlSession session, Map data);

	int pointModify(SqlSession session, Map data);
	
	int updateOrderState(SqlSession session, Map o);

	int updateOrderInfo(SqlSession session, Map orderInfo);

	Map countOrderState(SqlSession session);
	
	int totalOrder(SqlSession session);
	
	List<OrderDetail> selectChangeList(SqlSession session);
	
	int updateOrderListState(SqlSession session, Map m);
}
