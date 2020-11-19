package com.palette.orkney.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.palette.orkney.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("/member/memberLogin.do")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/member/signup.do")
	public String signup() {
		return "member/signup";
	}
	
	@RequestMapping("/member/transPassword.do")
	public String transPw() {
		return "member/transPw";
	}
}
