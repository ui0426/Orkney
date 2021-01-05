package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.product.model.vo.Product;
import com.palette.orkney.product.model.vo.Product_image;
import com.palette.orkney.review.model.vo.Review;

public interface AdminService {

	List<Map> chatData(Map m);

	List<String> userCount();

	List<String> roomNo(String data);
		
	List<Orders> selectOrderList(int cPage, int numPerPage,String search_option,String keyword);

	List<Orders> selectOrderChangeList(Map s);
	
	int modifyFAQ(Map data);

	int addFAQ(Map data);

	int deleteFAQ(String no);

	List<Map> memberList(int cPage, int numPerPage, Map data);

	int totalData(Map data);

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

	List<Map> productList(int cPage, int numPerPage, Map<String,Object> all);
	int productTotalData();
	int productPer(Map<String,Object> list);
	int productPutIn(Map<String,Object> list);
	int deleteProduct(String pNo);
	List<Map> productOne(Map<String,Object> list);
	int productInsert(Product product,List<Product_image> files, String[] img);
	List<Map> productUpdate(String pNo);
	int producUpdateIn(Product product,List<Product_image> files, String[] img);
	List<Map> sCategoryList(Map<String,Object> list);
	
	//by윤나-리뷰row갯수 가져오기
	int totalReview();
	//by윤나-리뷰리스트 가져오기
	List<Review> selectReviewList(int cPage, int numPerPage);
	//by윤나-리뷰가져오기
	Review selectReview(int rNo);
	//by윤나-리뷰삭제
	int deleteReview(int rNo);
	//by윤나-입출고내역조회
	List<Map> selectShippedList(String pNo);
	
}
