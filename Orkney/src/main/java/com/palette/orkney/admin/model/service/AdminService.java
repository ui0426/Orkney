package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface AdminService {

	List<Map> chatData(Map m);

	List<String> userCount();

	List<String> roomNo(String data);
		
	List<Orders> selectOrderList(int cPage, int numPerPage,String search_option,String keyword);

	List<Orders> selectOrderChangeList(Map s);
	
	int modifyFAQ(Map data);

	int addFAQ(Map data);

	int deleteFAQ(String no);

	List<Map> memberList(int cPage, int numPerPage);

	int totalData();

	List<Map> memberAddr(String no);

	List<Map> orderList(String no);

	int deleteMember(String no);

	int modifyPoint(Map data);
	
	int updateOrderState(Map o);
	
	int updateOrderInfo(Map orderInfo);

	Map countOrderState();
	
	int totalOrder();
	
	List<Orders> updateOrderListState(int cPage, int numPerPage, Map m, String search_option, String keyword);
	
	List<OrderDetail> selectOrderDetailChangeList(String state);
	
	int selectRefundCount(String oNo);
	
	int updateStateAndSort(Map m);
	
	List<OrderDetail> selectOrderOngoingList();
	
	int updateSortEnd(Map m);

}
