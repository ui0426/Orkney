package com.palette.orkney.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.member.model.service.MemberService;

@SessionAttributes("login")
@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
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
	@RequestMapping("/member/memberLogout/do")
	public String logout(SessionStatus ss) {
		System.out.println(1234);
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}
	//로그인 로직 구성
	@RequestMapping(value="/member/login.do")
	public ModelAndView login(ModelAndView mv,@RequestParam(value="userId") String id,@RequestParam(value="userPw") String pw) {
		
		Map login=service.loginCheck(id);
		if(login!=null&&pwEncoder.matches(pw,(String)login.get("PASSWORD"))) {
			mv.addObject("login",login);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("member/login");
		}
		
		return mv;
	}
}
