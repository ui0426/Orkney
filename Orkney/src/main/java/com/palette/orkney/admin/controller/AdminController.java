package com.palette.orkney.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.admin.model.service.AdminService;
import com.palette.orkney.common.page.PageFactory;
import com.palette.orkney.notice.model.service.NoticeService;
import com.palette.orkney.order.model.service.OrderService;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

@Controller
public class AdminController {

	@Autowired
	private AdminService service;
	@Autowired
	private NoticeService nService;
	@Autowired
	private OrderService oservice;

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

		System.out.println("list:" + list);

		int totalOrder = service.totalOrder();
		String pageBar = PageFactory.getPageBar(totalOrder, cPage);
				
		mv.addObject("order", list);
		mv.addObject("pageBar", pageBar);
		mv.setViewName("ajax/orderList");
		return mv;
	}

	@RequestMapping("/admin/orderChangeList.do")
	public ModelAndView orderChangeList(ModelAndView mv) {

		List<OrderDetail> list = service.selectChangeList();
		System.out.println(list);
		mv.addObject("change", list);
		mv.setViewName("ajax/orderChangeList");
		return mv;
	}

	@RequestMapping("admin/orderView.do")
	public ModelAndView orderView(String oNo, ModelAndView mv) {
		System.out.println(oNo);
		Orders order = oservice.selectOrder(oNo);
		System.out.println(order);
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
	public String memberListData(@RequestParam(value = "cPage", defaultValue = "0") int cPage, Model m) {
		int numPerPage = 10;
		List<Map> list = service.memberList(cPage, numPerPage);
		int totalData = service.totalData();
		String pageBar = PageFactory.getPageBar(totalData, cPage);
		m.addAttribute("list", list);
		m.addAttribute("pageBar", pageBar);
		return "ajax/memberList";
	}

	@RequestMapping("admin/orderAddr.do")
	public String orderList(@RequestParam(value = "no") String no, Model m) {
		System.out.println(no);
		List<Map> addr = service.memberAddr(no);
		List<Map> order = service.orderList(no);
		System.out.println(addr);
		System.out.println(order);
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
		System.out.println(oNo);
		Map o = new HashMap();
		o.put("oNo", oNo);
		o.put("state", state);
		int result = service.updateOrderState(o);

		return result > 0 ? state : "실패";
	}

	@RequestMapping(value = "/admin/updateOrderInfo.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String updateOrderInfo(@RequestParam Map<String, Object> orderInfo) {
		System.out.println(orderInfo);
		String address = (String) orderInfo.get("post") + "/" + (String) orderInfo.get("addr") + "/" + (String) orderInfo.get("detail");
		orderInfo.put("address", address);
		int result = service.updateOrderInfo(orderInfo);

		return result > 0 ? "성공" : "실패";
	}

	@RequestMapping("/admin/updateOrderListState.do")
	@ResponseBody
	public ModelAndView updateOrderListState(@RequestParam(value = "state") String state, @RequestParam(value = "oNos[]") List<String> oNos, @RequestParam(value = "cPage", defaultValue = "0") int cPage, ModelAndView mv) {

		int numPerPage = 10;
		Map m = new HashMap();
		m.put("oNos", oNos);
		m.put("state", state);
		System.out.println(m);
		
		 List<Orders> list = service.updateOrderListState(cPage, numPerPage, m);
		  
		//List<Orders> list=service.selectOrderList(cPage,numPerPage);
		 
		 System.out.println("list:"+list);
		  
		 int totalOrder = service.totalOrder(); 
		 
		 String pageBar=PageFactory.getPageBar(totalOrder, cPage);
		  
		 mv.addObject("order", list); mv.addObject("pageBar", pageBar); mv.setViewName("ajax/orderList");
		 
		return mv;
	}
}
