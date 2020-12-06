package com.palette.orkney.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.palette.orkney.member.model.service.MemberService;
import com.palette.orkney.member.model.vo.Addr;

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
	
	//이메일로 보낸 a태그 안에 값들이 맞으면 비밀번호 변경 페이지로 이동
	@RequestMapping("/member/transPassword.do")
	public String transPw(@RequestParam(value="key") String key,@RequestParam(value="id") String id,Model m
			,@CookieValue(value="trans") Cookie c,HttpServletResponse response) {
		String adr="";
		if(c.getValue().equals(key)) {
			adr="member/transPw";
		}else {
			adr="member/transError";
		}
		m.addAttribute("id",id);
//		c.setMaxAge(0);
//		c.setPath("/");
//		response.addCookie(c);
		
		return adr;
	}
	@RequestMapping("/member/memberLogout.do")
	public String logout(SessionStatus ss,Model m) {

		Map login=(Map)m.getAttribute("login");
		String type=(String)login.get("SIGNUP_TYPE");
		if(type.equals("구글")) {
		String token=(String)login.get("ACCESS_TOKEN");
		System.out.println(token);
		System.out.println();
		Map<String, String> result = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
				.queryParam("token", token).encode().toUriString();
		final String resultJson = restTemplate.postForObject(requestUrl,null,String.class);
		result.put("result", "success");
		result.put("resultJson", resultJson);
		System.out.println(result);
		}
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
			//가입할 때 주소 가져오기
			String no=(String)login.get("MEMBER_NO");
			String address = service.getAddress(no);
			login.put("address", address);
			
			mv.addObject("login",login);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("member/login");
		}
		
		mv.setViewName("redirect:/");
		
		return mv;
	}
	
	//idcheck
	@RequestMapping("/member/idCheck.do")
	@ResponseBody
	public boolean idCheck(String id, String pw) {
		
		Map login=service.loginCheck(id);
		boolean flag=false;
		if(login!=null&&pwEncoder.matches(pw,(String)login.get("MEMBER_PWD"))) {
				flag=true;
		}else {
				flag=false;
		}
		return flag;
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
			int wish=service.defaultWishList((String)user.get("MEMBER_NO"));
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
	public ModelAndView mypageView(HttpSession session, ModelAndView mv) {
		//배송지 리스트 받아오기, 주문내역 갯수, 위시리스트 갯수
		//System.out.println(session.getAttribute("login"));
		System.out.println(session.getAttribute("login"));
		String mNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
		List<Addr> list = service.addAddrList(mNo);
		
		List<Addr> list2 = new ArrayList<Addr>();
		//주소 떼내기
		for(Addr addr : list) {
			System.out.println(addr);
			String fullAddr = addr.getAddress();
			System.out.println(fullAddr);
			String[] a=fullAddr.split("/");
			addr.setAddress_post(a[0]);
			addr.setAddress_addr(a[1]);
			addr.setAddress_detail(a[2]);
			list2.add(addr);
		}
		System.out.println(list2);
		mv.addObject("addrList", list2);
		mv.setViewName("member/mypage");
		
		return mv;
	}
	
	//로그아웃(hy)
	@RequestMapping("/member/loginout.do")	
	public String loginout(SessionStatus status) {
		
		
		
		if(!status.isComplete()) status.setComplete();
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/chatAllData.do")
	@ResponseBody
	public List<Map> chatAllData(String id){
		
		return service.chatAllData(id);
	}
	
	//비밀번호 찾기 이메일 찾기용
	@RequestMapping("/member/emailCh.do")
	@ResponseBody
	public boolean emailCh(@RequestParam Map data) {
		boolean flag=false;
		
		Map emailCh=service.emailCh(data);
		
		if(emailCh!=null) flag=true;
		
		return flag;
	}
	
	//비밀번호 수정 로직 과정 >> 이메일로 비밀번호 변경시
	@RequestMapping("/member/transPwLast.do")
	public ModelAndView transPwch(ModelAndView mv,@RequestParam Map data,@CookieValue(value="trans") Cookie c
			,HttpServletResponse response) {
		
		String pw=(String)data.get("pw");
		String pwbc=pwEncoder.encode(pw);
		data.put("pw",pwbc);
		
		int pwChange=service.transPwch(data);
		
		if(pwChange>0) {
			mv.setViewName("redirect:/");
			c.setMaxAge(0);
			c.setPath("/");
			response.addCookie(c);
		}else {
			mv.addObject("msg","변경에 실패하였습니다.");
			mv.addObject("loc","redirect:/");
			mv.setViewName("common/msg");
		}
		
			
		return mv;
	}
	
}
