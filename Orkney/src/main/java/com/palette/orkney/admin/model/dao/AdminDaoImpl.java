package com.palette.orkney.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.product.model.vo.Product;
import com.palette.orkney.product.model.vo.Product_image;
import com.palette.orkney.review.model.vo.Review;
import com.palette.orkney.review.model.vo.ReviewImage;

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
	public List<Map> productList(SqlSession session,int cPage, int numPerPage, Map<String,Object> all) {
		// TODO Auto-generated method stub
		RowBounds rs=new RowBounds((cPage-1)*numPerPage,numPerPage);

		System.out.println("dao:"+session.selectList("admin.productList",all,rs));
		return session.selectList("admin.productList",all,rs);
	}
	@Override
	public int productTotalData(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("admin.productTotalData");
	}

	@Override
	public int productPer(SqlSession session, Map<String,Object> list) {
		// TODO Auto-generated method stub
		return session.update("admin.productPer",list);
	}

	public int selectRefundCount(SqlSession session, String oNo) {
		return session.selectOne("admin.selectRefundCount", oNo);
	}

	@Override
	public int updateStateAndSort(SqlSession session, Map m) {
		System.out.println(m);
		return session.update("admin.updateStateAndSort", m);
	}
	
	//취소시 반환할 포인트 조회
	@Override
	public int selectPoint(SqlSession session, int pNo) {
		return session.selectOne("admin.selectPoint", pNo);
	}

	@Override
	public List<OrderDetail> selectOrderOngoingList(SqlSession session) {
		return session.selectList("admin.selectOrderOngoingList");
	}

	@Override
	public int updateSortEnd(SqlSession session, Map m) {
		return session.update("admin.updateSortEnd", m);
	}	

	
	@Override
	public int deleteProduct(SqlSession session,String no) {
		// TODO Auto-generated method stub
		System.out.println(no);
		
		return session.delete("admin.deleteProduct",no);
	}
	@Override
	public int deleteProductImg(SqlSession session,String no) {
		// TODO Auto-generated method stub
		return session.delete("admin.deleteProductImg",no);
	}

	@Override
	public List<Map> productOne(SqlSession session, Map<String, Object> list) {
		// TODO Auto-generated method stub
		
		return session.selectList("admin.productOne",list);
	}

	@Override
	public int productPutIn(SqlSession session, Map<String, Object> list) {
		// TODO Auto-generated method stub
		return session.update("admin.productPutIn",list);
	}

	@Override
	public int productInsert(SqlSession session, Product product) {
		// TODO Auto-generated method stub
		return session.insert("admin.productInsert", product);
	}

	@Override
	public int insertProductImage(SqlSession session, Product_image pi) {
		// TODO Auto-generated method stub
		return session.insert("admin.insertProductImage", pi);
	}

	@Override
	public List<Map> productUpdate(SqlSession session, String pNo) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productUpdateList",pNo);
	}

	@Override
	public int producUpdateIn(SqlSession session, Product product) {
		// TODO Auto-generated method stub
		return session.update("admin.producUpdateIn", product);
	}

	@Override
	public int producUpdateInImg(SqlSession session, Product_image pi) {
		// TODO Auto-generated method stub
		return session.update("admin.producUpdateInImg", pi);
	}

	@Override
	public List<Map> productImg(SqlSession session, Product product) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productImg", product);
	}

	@Override
	public List<Map> sCategoryList(SqlSession session, Map<String, Object> list) {
		// TODO Auto-generated method stub
		return session.selectList("admin.sCategoryList",list);
	}

	//by윤나-리뷰row갯수 가져오기
	@Override
	public int selectReviewCount(SqlSession session) {
		return session.selectOne("admin.selectReviewCount");
	}
	
	//by윤나-리뷰리스트가져오기
	@Override
	public List<Review> selectReviewList(SqlSession session,int cPage, int numPerPage) {
		RowBounds r=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return session.selectList("admin.selectReviewList",null,r);
	}

	//by윤나-리뷰사진 가져오기
	@Override
	public List<ReviewImage> selectReviewImageList(SqlSession session, int rNo) {
		return session.selectList("admin.selectReviewImageList", rNo);
	}

	//by윤나-리뷰가져오기
	@Override
	public Review selectReview(SqlSession session, int rNo) {
		return session.selectOne("admin.selectReview",rNo);
	}

	//by윤나-리뷰삭제
	@Override
	public int deleteReview(SqlSession session, int rNo) {
		return session.delete("admin.deleteReview", rNo);
	}
	
	//by윤나-입출고내역조회
	@Override
	public List<Map> selectShippedList(SqlSession session, String pNo) {
		return session.selectList("admin.selectShippedList", pNo);
	}

	@Override
	public List<Map> productImg(SqlSession session, String pNo) {
		// TODO Auto-generated method stub
		return session.selectList("admin.productImgNo",pNo);
	}	
	
	
	
	
}
