package com.palette.orkney.admin.controller;

import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.admin.model.service.AdminService;
import com.palette.orkney.common.page.PageFactory;
import com.palette.orkney.notice.model.service.NoticeService;
import com.palette.orkney.order.model.service.OrderService;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.product.model.service.ProductService;
import com.palette.orkney.product.model.vo.Product;
import com.palette.orkney.product.model.vo.Product_image;


@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Autowired
	private NoticeService nService;
	@Autowired
	private OrderService oservice;
	@Autowired
	private ProductService pService;
	@RequestMapping("/admin/adminChat.do")
	public String adminChat() {
		return "admin/adminChat";
	}

	@RequestMapping("/admin/adminChatData.do")
	@ResponseBody
	public List chatData() {

		List<String> userCount = service.userCount();

		List list = new ArrayList();

		for (String data : userCount) {
			List<String> rNo = service.roomNo(data);
			List list2 = new ArrayList();
			for (String rNo2 : rNo) {
				Map m = new HashMap();
				m.put("id", data);
				m.put("rNo", rNo2);
				list2.add(service.chatData(m));
			}
			list.add(list2);
		}
		System.out.println(list);
		return list;
	}

	@RequestMapping("/admin/adminPage.do")
	public String adminPage() {

		return "admin/adminBasic";
	}

	//주문리스트
	@RequestMapping("/admin/orderList.do")
	public ModelAndView orderList(ModelAndView mv) {
		Map rs = service.countOrderState();
		mv.addObject("count", rs);
		mv.setViewName("admin/order/adminOrderList");
		return mv;
	}

	@RequestMapping("/admin/orderListData.do")
	public ModelAndView orderListData(ModelAndView mv, 
			@RequestParam(value = "cPage", defaultValue = "0") int cPage,
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword) {
		int numPerPage = 10;
		
		List<Orders> list = service.selectOrderList(cPage, numPerPage,search_option,keyword);

		

		int totalOrder = service.totalOrder();
		String pageBar = PageFactory.getPageBar(totalOrder, cPage);
				
		mv.addObject("order", list);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("ajax/orderList");
		return mv;
	}

	@RequestMapping("/admin/selectOrderChangeList.do")
	public ModelAndView orderChangeList(String state, ModelAndView mv) {
		
		Map s = new HashMap();
		s.put("state", state);
		List<Orders> list = service.selectOrderChangeList(s);
		
		mv.addObject("order", list);
		mv.setViewName("ajax/orderChangeList");
		return mv;
	}
	
	@RequestMapping("/admin/selectOrderDetailChangeList.do")
	public ModelAndView orderDetailChangeList(String state, ModelAndView mv) {
		
		List<OrderDetail> list = service.selectOrderDetailChangeList(state);
		
		mv.addObject("orderDetail", list);
		mv.setViewName("ajax/orderChangeList");
		return mv;
	}
	
	@RequestMapping("/admin/selectRefundList.do")
	@ResponseBody
	public int selectRefundPoint(String oNo, int rPoint) {
		System.out.println(oNo + rPoint);
		int refundCount = service.selectRefundCount(oNo);
		System.out.println(refundCount);
		if(refundCount != 1) {
			rPoint = 0;
		}
		System.out.println(rPoint);
		return rPoint;
	}

	@RequestMapping("admin/orderView.do")
	public ModelAndView orderView(String oNo, ModelAndView mv) {
		
		Orders order = oservice.selectOrder(oNo);
	
		String[] addr = order.getOrder_address().split("/");
		order.setAddress_post(addr[0]);
		order.setAddress_addr(addr[1]);
		order.setAddress_detail(addr[2]);
		order.setOdList(oservice.selectOrderDetail(oNo));
		mv.addObject("order", order);
		mv.setViewName("admin/order/adminOrderView");
		return mv;
	}

	@RequestMapping("admin/question.do")
	public String question(Model m) {

		List<Map> list = nService.totalFAQ();
		m.addAttribute("list", list);

		List<String> ct = nService.categoryList();
		m.addAttribute("category", ct);

		return "admin/notice/adminNotice";
	}

	@RequestMapping("admin/FAQcategory.do")
	public String faqCategory(@RequestParam Map type, Model m) {

		m.addAttribute("list", nService.categoryFAQ(type));

		return "ajax/noticeData";
	}

	@RequestMapping("admin/modifyFAQ.do")
	@ResponseBody
	public boolean modifyFAQ(@RequestParam Map data) {

		int update = service.modifyFAQ(data);
		boolean flag = false;
		if (update > 0)
			flag = true;

		return flag;
	}

	@RequestMapping("admin/addFAQ.do")
	@ResponseBody
	public boolean addFAQ(@RequestParam Map data) {

		int insert = service.addFAQ(data);
		boolean flag = false;
		if (insert > 0)
			flag = true;

		return flag;
	}

	@RequestMapping("admin/deleteFAQ.do")
	@ResponseBody
	public boolean deleteFAQ(@RequestParam(value = "no") String no) {

		int delete = service.deleteFAQ(no);
		boolean flag = false;
		if (delete > 0)
			flag = true;

		return flag;

	}

	@RequestMapping("admin/memberList.do")
	public String memberList(Model m) {

		return "admin/member/adminMember";
	}

	@RequestMapping("admin/memberListData.do")
	public String memberListData(@RequestParam(value = "cPage", defaultValue = "0") int cPage
			,@RequestParam Map data, Model m) {
		int numPerPage = 10;
		List<Map> list = service.memberList(cPage, numPerPage,data);
		int totalData = service.totalData(data);
		String pageBar = PageFactory.getPageBar(totalData, cPage);
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		return "ajax/memberList";
	}

	@RequestMapping("admin/orderAddr.do")
	public String orderList(@RequestParam(value = "no") String no, Model m) {
		
		List<Map> addr = service.memberAddr(no);
		List<Map> order = service.orderList(no);
		
		m.addAttribute("addr", addr);
		m.addAttribute("order", order);
		return "ajax/orderAddr";
	}

	@RequestMapping("admin/deleteMember.do")
	@ResponseBody
	public boolean deleteMember(@RequestParam(value = "no") String no) {

		boolean flag = false;
		int delete = service.deleteMember(no);
		if (delete > 0)
			flag = true;

		return flag;
	}

	@RequestMapping("admin/modifyPoint.do")
	@ResponseBody
	public boolean modifyPoint(@RequestParam Map data) {

		boolean flag = false;

		int modify = service.modifyPoint(data);
		if (modify > 0)
			flag = true;

		return flag;
	}

	@RequestMapping(value = "/admin/updateOrderState.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOrderState(String oNo, String state) {
	
		Map o = new HashMap();
		o.put("oNo", oNo);
		o.put("state", state);
		int result = service.updateOrderState(o);

		return result > 0 ? state : "실패";
	}

	@RequestMapping(value = "/admin/updateOrderInfo.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOrderInfo(@RequestParam Map<String, Object> orderInfo) {
		
		String address = (String) orderInfo.get("post") + "/" + (String) orderInfo.get("addr") + "/" + (String) orderInfo.get("detail");
		orderInfo.put("address", address);
		int result = service.updateOrderInfo(orderInfo);

		return result > 0 ? "성공" : "실패";
	}

	@RequestMapping("/admin/updateOrderListState.do")
	@ResponseBody
	public ModelAndView updateOrderListState(@RequestParam(value = "state") String state, 
			@RequestParam(value = "oNos[]") List<String> oNos, 
			@RequestParam(value = "cPage", defaultValue = "0") int cPage, 
			@RequestParam(defaultValue="all") String search_option,
			@RequestParam(defaultValue="") String keyword, ModelAndView mv) {

		int numPerPage = 10;
		Map m = new HashMap();
		m.put("oNos", oNos);
		m.put("state", state);
		
		
		 List<Orders> list = service.updateOrderListState(cPage, numPerPage, m, search_option, keyword);
		  
		//List<Orders> list=service.selectOrderList(cPage,numPerPage);
		 
		
		  
		 int totalOrder = service.totalOrder(); 
		 
		 String pageBar=PageFactory.getPageBar(totalOrder, cPage);
		  
		 mv.addObject("order", list); 
		 mv.addObject("pageBar", pageBar); 
		 mv.setViewName("ajax/orderList");
		 
		return mv;
	}

	@RequestMapping("/admin/adminShowrooms.do")
	public String adminShowrooms() {
		return "admin/rooms/adminRoom";
	}
	@RequestMapping("/admin/delectRoom.do")
	@ResponseBody
	public  List<Map> delectRoom() {
		
		return pService.delectSelectRoom();
		
	}
	@RequestMapping("/admin/insertRoom.do")
	public ModelAndView insertRoom(ModelAndView mv, @RequestParam(value = "productInput_product[]", required = true) String[] rooms_product, @RequestParam(value = "productInput_top[]", required = true) String[] rooms_top, @RequestParam(value = "productInput_left[]", required = true) String[] rooms_left, @RequestParam String category, @RequestParam(value="toggleInsert", defaultValue = "0") String toggleInsert, @RequestParam String category_no, @RequestParam(value = "room_img", required = false) MultipartFile multi, HttpSession session) {
		Map<String, Object> room = new HashMap<String, Object>();
		Map<String, Object> rooms = new HashMap<String, Object>(); 
		System.out.println(toggleInsert);
		System.out.println(multi);
		List one = new ArrayList();
		List two = new ArrayList();
		List three = new ArrayList();
		List four = new ArrayList();
		List five = new ArrayList();
		/*List rooms = new ArrayList();*/
		String[] categoryNo = new String[rooms_top.length];

		for (int i = 0; i < rooms_top.length; i++) {
			categoryNo[i] = category_no;

			if (i == 0) {
				one.add(rooms_product[i]);
				one.add(rooms_top[i]);
				one.add(rooms_left[i]);
				one.add(categoryNo[i]);
				
			} else if (i == 1) {
				
				two.add(rooms_product[i]);
				two.add(rooms_top[i]);
				two.add(rooms_left[i]);
				two.add(categoryNo[i]);
				
			} else if (i == 2) {
				
				three.add(rooms_product[i]);
				three.add(rooms_top[i]);
				three.add(rooms_left[i]);
				three.add(categoryNo[i]);
				
			} else if (i == 3) {
				
				four.add(rooms_product[i]);
				four.add(rooms_top[i]);
				four.add(rooms_left[i]);
				four.add(categoryNo[i]);
				
			} else if (i == 4) {
				
				five.add(rooms_product[i]);
				five.add(rooms_top[i]);
				five.add(rooms_left[i]);
				five.add(categoryNo[i]);
			}
		}
			
		
		if (rooms_top.length>=1) {
		
			rooms.put("one",one);
		}
		if (rooms_top.length>=2) {
		
			rooms.put("two",two);
		}
		if (rooms_top.length>=3) {
		
			rooms.put("three",three);
		}
		if (rooms_top.length>=4) {
			
			rooms.put("four",four);
		}
		if (rooms_top.length==5) {
			
			rooms.put("five",five);
		} ;

		room.put("categoryNo", category_no);
		room.put("category", category);
		if(!multi.isEmpty()) {
		String path = session.getServletContext().getRealPath("/resources/images/rooms");

		File dir = new File(path);

		if (!dir.exists())
			dir.mkdirs();

		if (!multi.isEmpty()) {
			String originalName = multi.getOriginalFilename();
			try {
				multi.transferTo(new File(path + "/" + originalName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			room.put("roomsImg", originalName);
			/* rooms.put("rooms_img", img); */
			
		}
		
		int result=0;
	
		result = pService.insertRoom(room);
		}
		int results=0;
		if(toggleInsert.equals("0")) {
		
			 results= pService.deleteRoom(room);
			}
	
		 int resultTwo = pService.updateRoom(rooms);
		
		mv.setViewName("redirect:/admin/adminShowrooms.do");

		return mv;
	}
	@RequestMapping("/admin/roomsTitle.do")
	public ModelAndView roomsTitle(ModelAndView mv, @RequestParam String title, @RequestParam String content, @RequestParam String roomsTitle, @RequestParam String roomsSubTitle) {
		
		Map titles = new HashMap();
		titles.put("title", title);
		titles.put("content", content);
		titles.put("roomsTitle", roomsTitle);
		titles.put("roomsSubTitle", roomsSubTitle);
		int result = pService.roomsTitle(titles);
		mv.setViewName("redirect:/admin/adminShowrooms.do");
		return mv;
	}

	@RequestMapping("/admin/buttomProduct.do")
	@ResponseBody
	public List<Map> buttomProduct(@RequestParam(value = "type[]") String[] type) {
		Map ty = new HashMap();
		ty.put("type", type);
		System.out.println(ty);
		return pService.buttomProduct(ty);
	};
	
	@RequestMapping("/admin/roomChange.do")
	@ResponseBody
	public List<Map> roomChange() {
		return pService.roomChange();
	}
	@RequestMapping("/admin/selectAll.do")
	@ResponseBody
	public List<Map> selectAll(@RequestParam String typeTo) {
		Map types= new HashMap();
		types.put("typeTo", typeTo);
		return pService.selectRoomsProduct(types);
	}
	@RequestMapping("/admin/delectShowroom.do")
	public String delectShowroom(@RequestParam String deleteRoom) {
		int resule = pService.delectShowroom(deleteRoom);
		return "redirect:/admin/adminShowrooms.do"; 
	}	


//	제품관리 페이지
	@RequestMapping("/admin/adminProduct.do")
	@ResponseBody
	public ModelAndView products(ModelAndView mv,
			@RequestParam(value = "cPage", defaultValue = "0") int cPage, 
			@RequestParam Map<String,Object> all
			){
		
		int numPerPage = 10;
		List<Map> list = service.productList(cPage, numPerPage,all);
		int totalData = service.productTotalData();
		String pageBar = PageFactory.getPageBar(totalData, cPage);
		
		mv.addObject("list",list);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("ajax/adminProductList");
		return mv;
	}
	//제품 관리 페이지 메인
	@RequestMapping("/admin/product.do")
	public ModelAndView product(ModelAndView mv) {
		mv.setViewName("admin/product/adminProduct");
		return mv;
	}
	//제품 관리 페이지 메인
	@RequestMapping("/admin/adminProductInsert.do")
	public ModelAndView adminProductInsert(ModelAndView mv) {
		mv.setViewName("admin/product/adminProductInsert");
		return mv;
	}
//	할인 적용
	@RequestMapping("/admin/productPer.do")
	@ResponseBody
	public int productPer (@RequestParam Map<String,Object> list) {
		return service.productPer(list);
	}
//	입고
	@RequestMapping("/admin/productPutIn.do")
	@ResponseBody
	public int productPutIn (@RequestParam Map<String,Object> list) {
		return service.productPutIn(list);
	}
//	제품 삭제
	@RequestMapping("/admin/deleteProduct.do")
	@ResponseBody
	public int deleteProduct (@RequestParam Map<String,Object> list,
			@RequestParam(value = "pNo") String pNo
			) {
		return service.deleteProduct(pNo);
	}
//	적용된 제품 리스트 업데이트
	@RequestMapping("/admin/productOne.do")
	@ResponseBody
	public List<Map> productOne (@RequestParam Map<String,Object> list) {
		return service.productOne(list);
	}

//	제품 추가
	@RequestMapping(value="/damin/productInsert.do", method = RequestMethod.POST)
	public ModelAndView productInsert(Product product, ModelAndView mv,
			 @RequestParam(value="productImg", required=false) MultipartFile[] productImg, 
			 @RequestParam(value="mainImg", required=false) String img0, 
			 @RequestParam(value="img1", required=false) String img1, 			 
			 @RequestParam(value="img2", required=false) String img2, 			 
			 @RequestParam(value="img3", required=false) String img3, 			 
			 HttpSession session
			){
		String[] img = {img0,img1,img2,img3};

		
		System.out.println("압로드:"+productImg);
		String path=session.getServletContext().getRealPath("/resources/images/product");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<Product_image> files=new ArrayList();
		
		for(MultipartFile f : productImg) {
			if(!f.isEmpty()) {
				String originalName = f.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				Product_image ri=Product_image.builder().originalFileName(originalName).renamedFileName(reName).build();
				files.add(ri);


			}

		}
		
		int result=service.productInsert(product, files, img);
		
		
		
		mv.setViewName("admin/product/adminProduct");
		return mv;
	}

//	제품 업데이트
	@RequestMapping(value="/damin/producUpdateIn.do", method = RequestMethod.POST)
	public ModelAndView producUpdateIn(Product product, ModelAndView mv,
			@RequestParam(value="productImg", required=false) MultipartFile[] productImg, 
			@RequestParam(value="mainImg", required=false) String img0, 
			@RequestParam(value="img1", required=false) String img1, 			 
			@RequestParam(value="img2", required=false) String img2, 			 
			@RequestParam(value="img3", required=false) String img3, 			 
			HttpSession session
			){
		String[] img = {img0,img1,img2,img3};
		System.out.println("쨔까만:"+product);
		String path=session.getServletContext().getRealPath("/resources/images/product");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		List<Product_image> files=new ArrayList();
		
		for(MultipartFile f : productImg) {
			if(!f.isEmpty()) {
				String originalName = f.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".")+1);
				
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int)(Math.random()*10000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
				try {
					f.transferTo(new File(path+"/"+reName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				Product_image ri=Product_image.builder().originalFileName(originalName).renamedFileName(reName).build();
				files.add(ri);
				
				
			}
			
		}
		
		int result=service.producUpdateIn(product, files, img);
		
		
		
		mv.setViewName("admin/product/adminProduct");
		return mv;
	}


	
	@RequestMapping("/admin/allowStateAndSort.do")
	@ResponseBody
	public boolean allowStateAndSort(String state, String no) {
		System.out.println("넘긴 값 : "+state+" 번호 "+no);
		Map m = new HashMap();
		m.put("state", state);
		m.put("no", no);
		int result = service.updateStateAndSort(m);
		if(result > 0) return true;
		else return false;
	}
	
	@RequestMapping("/admin/orderOngoingData.do")
	@ResponseBody
	public ModelAndView orderOngoingData() {
		ModelAndView mv = new ModelAndView();
		List<OrderDetail> list = service.selectOrderOngoingList();
		mv.addObject("list", list);
		mv.setViewName("ajax/orderOngoingList");
		return mv;
	}
	
	@RequestMapping("/admin/orderRefundEnd.do")
	@ResponseBody
	public boolean orderRefundEnd(String sort, int no) {
		if(sort.equals("교환처리중")) sort="교환완료";
		else sort="반품완료";
		Map m = new HashMap();
		m.put("sort", sort);
		m.put("no", no);
		int result = service.updateSortEnd(m);
		if(result >0) return true;
		else return false;


	}
	
	//제품 업데이트
		@RequestMapping("/admin/productUpdate.do")
		public ModelAndView productUpdate(ModelAndView mv,
				@RequestParam(name="pNo") String pNo
			
				){

			mv.addObject("list",service.productUpdate(pNo));
			mv.setViewName("admin/product/adminProductUpdate");
			return mv;
		}
		
		@RequestMapping("/admin/sCategoryList.do")
		@ResponseBody
		public List<Map> sCategoryList (@RequestParam Map<String,Object> list) {
			System.out.println("왜 안됨?");
			return service.sCategoryList(list);
		}
}
