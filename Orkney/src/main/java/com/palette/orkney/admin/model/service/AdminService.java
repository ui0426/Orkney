package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.order.model.vo.Orders;

public interface AdminService {

	List<Map> chatData(Map m);

	List<String> userCount();

	List<String> roomNo(String data);
	
	List<Orders> selectOrderList();

	int modifyFAQ(Map data);

	int addFAQ(Map data);

	int deleteFAQ(String no);

	List<Map> memberList(int cPage, int numPerPage);

	int totalData();

	List<Map> memberAddr(String no);

	List<Map> orderList(String no);

	int deleteMember(String no);

	int modifyPoint(Map data);

}
