package com.palette.orkney.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.palette.orkney.review.model.vo.Review;

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
	public List<Map> memberList(int cPage,int numPerPage,Map data) {
		// TODO Auto-generated method stub
		return dao.memberList(session,cPage,numPerPage,data);
	}

	@Override
	public int totalData(Map data) {
		// TODO Auto-generated method stub
		return dao.totalData(session,data);
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
		int result = dao.productPutIn(session,list);
		if(result>0) {
			String put = (String)list.get("put");
			if(put.contains("-")) {
				String put2 = put.replaceAll("-", "");
				System.out.println(put2);
				list.put("put",put2);
				list.put("type", "출고");
			}else {
				list.put("type", "입고");
			}
			result = dao.insertShipped(session, list);
		}
		return result;
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
			if(result>0) {
				Map m = new HashMap();
				m.put("pNo", "p"+product.getProductNo());
				m.put("put", product.getProductStock());
				m.put("type","입고");
				dao.insertShipped(session, m);
			}
		}
		
		return result;
	}
	public int selectRefundCount(String oNo) {
		return dao.selectRefundCount(session, oNo);
	}

	@Override
	public int updateStateAndSort(Map m) {
		int result = dao.updateStateAndSort(session, m);
		System.out.println("사용포인트는?"+m.get("point"));
		if(result>0 && m.get("state").equals("취소완료") && m.get("point")!=null) {
			String no = (String)m.get("mNo");
			m.put("no",no);
			m.put("reason","주문취소");
			m.put("type","적립");
			System.out.println("회원번호랑 나와야하는데,.."+m);
			result = dao.modifyPoint(session, m);
			if(result>0) {
				result = dao.pointModify(session, m);
			}
		}
		return result;
	}
	
	//취소할 시 다시 반환처리 해줄 포인트 조회
	@Override
	public int selectPoint(int pNo) {
		return dao.selectPoint(session, pNo);
	}

	@Override
	public List<OrderDetail> selectOrderOngoingList() {
		return dao.selectOrderOngoingList(session);
	}

	@Override
	public int updateSortEnd(Map m) {
		return dao.updateSortEnd(session, m);

	}

	@Override
	public List<Map> productUpdate(String pNo) {
		// TODO Auto-generated method stub
		return dao.productUpdate(session,pNo);
	}

	@Override
	public int producUpdateIn(Product product, List<Product_image> files, String[] img) {
		int result = dao.producUpdateIn(session, product); 
		List<Map> p = dao.productImg(session, product);
		System.out.println("이거 뭐라 나와 ?"+p.get(0).get("PRODUCT_PIC"));
		System.out.println("이거 뭐라 나와 ?"+p.get(0));
	
		int ps=p.size();
		

		int index=0;
		try {
			
			if(result>0) {
				if(files!=null) {
					
					for(Product_image pi : files) {
						pi.setProduct_color(img[index]);
						
						pi.setProduct_no(product.getProductNo());
						
						
						if (ps == 1 && index>0) {
							System.out.println("인써트!!!");
							result = dao.insertProductImage(session, pi);
						}else if(ps == 2 && index>1) {
							System.out.println("인써트!!!");
							result = dao.insertProductImage(session, pi);
						}else if(ps == 3 && index>2) {
							System.out.println("인써트!!!");
							result = dao.insertProductImage(session, pi);
						}
						
						if (ps==1&&index==0) {
							pi.setProductImageName(p.get(index).get("PRODUCT_PIC").toString());
							System.out.println("hh"+pi);
							result = dao.producUpdateInImg(session, pi);
							
						}else if (ps==2&&index >= 0 && index<2) {
							pi.setProductImageName(p.get(index).get("PRODUCT_PIC").toString());
							System.out.println("hh"+pi);
							result = dao.producUpdateInImg(session, pi);
						}else if (ps==3&&index >= 0 && index<3) {
							pi.setProductImageName(p.get(index).get("PRODUCT_PIC").toString());
							System.out.println("hh"+pi);
							result = dao.producUpdateInImg(session, pi);
						}else if (ps==4&&index >= 0 && index<4) {
							pi.setProductImageName(p.get(index).get("PRODUCT_PIC").toString());
							System.out.println("hh"+pi);
							result = dao.producUpdateInImg(session, pi);
						}
					
						
						index++;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Map> sCategoryList(Map<String, Object> list) {
		// TODO Auto-generated method stub
		return dao.sCategoryList(session,list);
	}
	
	
	//by윤나-리뷰row갯수 가져오기
	@Override
	public int totalReview() {
		return dao.selectReviewCount(session);
	}

	//by윤나-adminReview관리페이지 이동
	@Override
	public List<Review> selectReviewList(int cPage, int numPerPage) {
		List<Review> rList = dao.selectReviewList(session, cPage, numPerPage);
		if(rList!=null) {
			for(Review r : rList) {
				r.setRiList(dao.selectReviewImageList(session, r.getReview_no()));
			}
		}
		return rList;
	}
	
	//by윤나-리뷰가져오기
	@Override
	public Review selectReview(int rNo) {
		Review r = dao.selectReview(session, rNo);
		r.setRiList(dao.selectReviewImageList(session, r.getReview_no()));
		return r;
	}
	
	//by윤나-리뷰삭제
	@Override
	public int deleteReview(int rNo) {
		return dao.deleteReview(session, rNo);
	}

	//by윤나-입출고내역조회
	@Override
	public List<Map> selectShippedList(String pNo) {
		return dao.selectShippedList(session, pNo);
	}

	@Override
	public List<Map> productImg(String pNo) {
		// TODO Auto-generated method stub
		List<Map> p = dao.productImg(session, pNo);
		return p;
	}
	
	



	

	
	
	
	
	
}
