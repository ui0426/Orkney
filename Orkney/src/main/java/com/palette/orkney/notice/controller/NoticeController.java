package com.palette.orkney.notice.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.palette.orkney.notice.model.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
		
	@RequestMapping("/notice/question.do")
	public String question(Model m) {
		
		
		
		m.addAttribute("plist",service.popularFAQ());
		m.addAttribute("list",service.totalFAQ());
		
		return "notice/question";
	}
	
	@RequestMapping("/notice/categoryFAQ.do")
	public String categoryFAQ(@RequestParam Map type,Model m) {
		
		m.addAttribute("list",service.categoryFAQ(type));
		
		return "ajax/popularQuestion";
	}
	
}
