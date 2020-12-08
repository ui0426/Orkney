package com.palette.orkney.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.palette.orkney.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
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
	
}
