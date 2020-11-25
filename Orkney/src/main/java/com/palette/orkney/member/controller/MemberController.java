package com.palette.orkney.member.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//�α��� ���� ����
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
	
	//마이페이지 화면으로 이동(hy)
	@RequestMapping("/member/mypage.do")
	public String mypageView(HttpSession session) {
		//배송지 리스트 받아오기, 주문내역 갯수, 위시리스트 갯수
		//List<Addr> list = service.addrList();
		
		
		return "member/mypage";
	}
	
	//로그아웃(hy)
	@RequestMapping("/member/loginout.do")
	public String loginout(SessionStatus status) {
		if(!status.isComplete()) status.setComplete();
		
		return "redirect:/";
	}
}
