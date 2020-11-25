package com.palette.orkney.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		System.out.println(pwEncoder.encode("1234"));
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
	@RequestMapping("/member/memberLogout.do")
	public String logout(SessionStatus ss) {
		System.out.println(1234);
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		return "redirect:/";
	}
	//로그인
	@RequestMapping(value="/member/login.do")
	public ModelAndView login(ModelAndView mv,@RequestParam(value="userId") String id,@RequestParam(value="userPw") String pw) {
		
		Map login=service.loginCheck(id);
		
		if(login!=null&&pwEncoder.matches(pw,(String)login.get("MEMBER_PWD"))) {
			String no=(String)login.get("MEMBER_NO");
			List<String> chatRoomNo=service.chatRoomNo(no);
			List chatData=service.chatData(chatRoomNo);
			login.put("chatData",chatData);
			mv.addObject("login",login);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("member/login");
		}
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	

	@RequestMapping("/member/insertSignup.do")
	public ModelAndView insertSignup(@RequestParam Map userInfo,@RequestParam(value="adr1") String adr1,@RequestParam(value="adr2") String adr2, ModelAndView mv) {
		String adr=(String)userInfo.get("adr1")+"/"+(String)userInfo.get("adr2")+"/"+(String)userInfo.get("adr3");
		userInfo.put("adr",adr);
		userInfo.put("password",pwEncoder.encode((String)userInfo.get("password")));
		if(userInfo.get("emailCh")==null) {
			userInfo.put("emailCh","N");
		}
		int insertUser=service.insertSignup(userInfo);
		if(insertUser>0) {
			Map user=service.searchUser((String)userInfo.get("email"));
			service.addAdr(userInfo);
			mv.addObject("login",user);
		}
		mv.setViewName("redirect:/");
		return mv;
	}
	@RequestMapping("/member/chatRoom.do")
	@ResponseBody
	public List<Map> chatRoom(@RequestParam Map m) {
		List<Map> list=service.chatRoom(m);
		System.out.println(list);
		return list;
	}
	
	//마이페이지 화면으로 이동
	@RequestMapping("/member/mypage.do")
	public String mypageView() {
		return "member/mypage";
	}
}
