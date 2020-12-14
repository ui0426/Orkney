package com.palette.orkney.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.admin.model.service.AdminService;
import com.palette.orkney.common.page.PageFactory;
import com.palette.orkney.notice.model.service.NoticeService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("/admin/adminChat.do")
	public String adminChat() {
		return "admin/adminChat";
	}
	
	@RequestMapping("/admin/adminChatData.do")
	@ResponseBody
	public List chatData(){
		
		
		List<String> userCount=service.userCount();
		
		List list=new ArrayList();
		
		for(String data:userCount) {
			List<String> rNo=service.roomNo(data);
			List list2=new ArrayList();
			for(String rNo2:rNo) {
				Map m=new HashMap();
				m.put("id",data);
				m.put("rNo",rNo2);
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
	
	@RequestMapping("/admin/orderList.do")
	public ModelAndView orderList(ModelAndView mv) {
		mv.addObject("order", service.selectOrderList());
		mv.setViewName("admin/order/adminOrderList");
		return mv;
	}
	
	@RequestMapping("admin/orderView.do")
	public String orderView() {
		return "admin/order/adminOrderView";
	}
	
	@RequestMapping("admin/question.do")
	public String question(Model m) {
		
		List<Map> list=nService.totalFAQ();
		m.addAttribute("list",list);
		
		List<String> ct=nService.categoryList();
		m.addAttribute("category",ct);
		
		return "admin/notice/adminNotice";
	}
	
	@RequestMapping("admin/FAQcategory.do")
	public String faqCategory(@RequestParam Map type,Model m) {
		
		m.addAttribute("list",nService.categoryFAQ(type));
		
		return "ajax/noticeData";
	}
	
	@RequestMapping("admin/modifyFAQ.do")
	@ResponseBody
	public boolean modifyFAQ(@RequestParam Map data) {
		
		int update=service.modifyFAQ(data);
		boolean flag=false;
		if(update>0) flag=true;
		
		return flag;
	}
	
	@RequestMapping("admin/addFAQ.do")
	@ResponseBody
	public boolean addFAQ(@RequestParam Map data) {
		
		int insert=service.addFAQ(data);
		boolean flag=false;
		if(insert>0) flag=true;
		
		return flag;
	}
	
	@RequestMapping("admin/deleteFAQ.do")
	@ResponseBody
	public boolean deleteFAQ(@RequestParam(value="no") String no) {
		
		int delete=service.deleteFAQ(no);
		boolean flag=false;
		if(delete>0) flag=true;
		
		return flag;
		
	}
	
	@RequestMapping("admin/memberList.do")
	public String memberList(Model m) {
				
		return "admin/member/adminMember";
	}
	
	@RequestMapping("admin/memberListData.do")
	public String memberListData(@RequestParam(value="cPage",defaultValue="0") int cPage,Model m) {
		int numPerPage=10;
		List<Map> list=service.memberList(cPage,numPerPage);
		int totalData=service.totalData();
		String pageBar=PageFactory.getPageBar(totalData,cPage);
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		return "ajax/memberList";
	}
	
	@RequestMapping("admin/orderAddr.do")
	public String orderList(@RequestParam(value="no") String no,Model m) {
		System.out.println(no);
		List<Map> addr=service.memberAddr(no);
		List<Map> order=service.orderList(no);
		System.out.println(addr);
		System.out.println(order);
		m.addAttribute("addr",addr);
		m.addAttribute("order",order);
		return "ajax/orderAddr";
	}
	
	@RequestMapping("admin/deleteMember.do")
	@ResponseBody
	public boolean deleteMember(@RequestParam(value= "no") String no) {
		
		boolean flag=false;
		int delete=service.deleteMember(no);
		if(delete>0) flag=true;
		
		
		return flag;
	}
	
	@RequestMapping("admin/modifyPoint.do")
	@ResponseBody
	public boolean modifyPoint(@RequestParam Map data) {
		
		boolean flag=false;
		
		int modify=service.modifyPoint(data);
		if(modify>0) flag=true;
		
		return flag;
	}
}
