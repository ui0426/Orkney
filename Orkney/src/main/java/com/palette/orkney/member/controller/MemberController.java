package com.palette.orkney.member.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import com.palette.orkney.member.model.service.MemberService;
import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Point;

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
			adr="error/transError";
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
			String no=(String)login.get("MEMBER_NO");
			
			//가입할 때 주소 가져오기
			Addr adr=service.getAddress(no);
			if(adr!=null) {
			String address=	adr.getAddress();
			login.put("address", address);
			}
			mv.addObject("login",login);
			mv.setViewName("redirect:/");
		}else {
			mv.setViewName("member/login");
		}
		System.out.println("이거이거" +login);
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

//	@RequestMapping("/member/insertSignup.do")
//	public ModelAndView insertSignup(@RequestParam Map userInfo,@RequestParam(value="adr1") String adr1,@RequestParam(value="adr2") String adr2, ModelAndView mv) {
//		String adr=(String)userInfo.get("adr1")+"/"+(String)userInfo.get("adr2")+"/"+(String)userInfo.get("adr3");
//		userInfo.put("adr",adr);
//		userInfo.put("password",pwEncoder.encode((String)userInfo.get("password")));
//		if(userInfo.get("emailCh")==null) {
//			userInfo.put("emailCh","N");
//		}
//		int insertUser=service.insertSignup(userInfo);
//		if(insertUser>0) {
//			Map user=service.searchUser((String)userInfo.get("email"));
//			int wish=service.defaultWishList((String)user.get("MEMBER_NO"));
//			service.addAdr(userInfo);
//			mv.addObject("login",user);
//		}
//		mv.setViewName("redirect:/");
//		return mv;
//	}

	@RequestMapping("/member/chatRoom.do")
	@ResponseBody
	public List<Map> chatRoom(@RequestParam Map m) {
		List<Map> list=service.chatRoom(m);
		
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
	public List<Map> chatAllData(String id){//한 사람의 모든 채팅방 내용
		
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
	

	//이름, 생일 수정
	@RequestMapping("/member/updateMemberPersonal.do")
	@ResponseBody
	public Map updateMemberPersonal(@RequestParam Map<String, Object> updateInformation, HttpSession session) {
		
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		
		String mNo = (String)login.get("MEMBER_NO");
		updateInformation.put("mNo", mNo);
		
		int result = service.updateMemberPersonal(updateInformation);
		
		Map data = new HashMap<String, Object>();
		if(result > 0 ) { //정보수정 성공
			data = updateInformation;
			login.replace("MEMBER_NAME", updateInformation.get("name"));
			login.replace("BIRTHDAY", updateInformation.get("birth"));
			
			String[] b = ((String)updateInformation.get("birth")).split("-");
			System.out.println(b[0] + b[1] + b[2]);
			String birthPar = b[0] + "년도 " + b[1] + "월 " + b[2] + "일";
			data.replace("birth", birthPar);
		} else {
			System.out.println("정보수정 실패 어디로.......");
		}

		return data;
		
	}
	
	//연락처 수정
	@RequestMapping("/member/updateMemberContact.do")
	@ResponseBody
	public Map updateMemberContact(@RequestParam Map<String, Object> updateInformation, HttpSession session) {
		
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		
		String mNo = (String)login.get("MEMBER_NO");
		updateInformation.put("mNo", mNo);
		
		int result = service.updateMemberContact(updateInformation);
		
		Map data = new HashMap<String, Object>();
		if(result > 0 ) { //정보수정 성공
			data = updateInformation;
			login.replace("PHONE", updateInformation.get("phone"));
		} else {
			System.out.println("정보수정 실패 어디로.......");
		}
		
		return data;
		
		
	}
	
	//패스워드 수정
	@RequestMapping("/member/updateMemberPassword.do")
	@ResponseBody
	public int updateMemberPassword(@RequestParam Map<String, Object> updateInformation, HttpSession session) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		
		String mNo = (String)login.get("MEMBER_NO");
		updateInformation.put("mNo", mNo);
		
		String pw = (String)updateInformation.get("originPw"); //입력받은 현재비번
		System.out.println(pw);
		
		String newPw = pwEncoder.encode((String)updateInformation.get("newPw")); //입력받은 새 비번
		
		int result = 0;
		System.out.println("매치값" + pwEncoder.matches(pw, (String)login.get("MEMBER_PWD")));
		if(pwEncoder.matches(pw, (String)login.get("MEMBER_PWD"))) {
			updateInformation.replace("newPwCk", newPw);
			result = service.updateMemberPassword(updateInformation);
			
			if(result > 0 ) { //정보수정 성공
				login.replace("MEMBER_PWD", newPw);
			} else {
				System.out.println("정보수정 실패 어디로.......");
			}
		} else { //현재비번이 틀렸을 경우
			result = -2;
		}
		
		
		return result;
	}
	
	//기본 주소 수정
	@RequestMapping("/member/updateMemberAddress.do")
	@ResponseBody
	public int updateMemberAddress(@RequestParam Map<String, Object> updateInformation, HttpSession session) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		updateInformation.put("mNo", mNo);
		
		String address = (String)updateInformation.get("address_post") + "/" + (String)updateInformation.get("address_addr") + "/" + (String)updateInformation.get("address_detail");
		updateInformation.put("address", address);
		
		System.out.println(updateInformation);
		int result = service.updateMemberAddress(updateInformation);
		
		if(result> 0) {
			if(updateInformation.get("address_name") == null) {
				login.replace("address", address);
			}
		}
		
		return result;
	}
	
	//수정 눌렀을 때 페이지 보여주기
	@RequestMapping("/member/currentMemberInformation.do")
	public String currentMemberInformation(HttpSession session, String param, Model model) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		
		if(param.equals("#personal")) {
			return "member/mypageDiv/personal";
		} else if(param.equals("#contact")) {
			return "member/mypageDiv/contact";
		} else if(param.equals("#password")) {
			return "member/mypageDiv/password";
		} else if(param.equals("#address")) {
			Addr address = service.getAddress(mNo);
			String fullAddr = address.getAddress();

			String[] a=fullAddr.split("/");
			address.setAddress_post(a[0]);
			address.setAddress_addr(a[1]);
			address.setAddress_detail(a[2]);
			
			model.addAttribute("addr", address);
			System.out.println("address" + address);
			return "member/mypageDiv/address";
		}
		
		return ""; //화면에서 널처리를 해줘야 하나?
	}
	

//	//personal 업데이트 정보
//	@RequestMapping("/member/personalJspUpdate.do")
//	public String personalJspUpdate() {
//		return "member/mypageDiv/personal.jsp";
//	}
	
	@RequestMapping("/member/emailPage.do")//이메일인증페이지 전환용
	public String emailAuth() {
		
		return "member/emailAuth";
	}
	
	@RequestMapping("/member/insertSignup.do")//회원가입 수정함
	public ModelAndView insertSignup(ModelAndView mv,HttpSession session) {
		Map userInfo=(Map)session.getAttribute("userInfo");
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
		session.removeAttribute("userInfo");
		mv.setViewName("redirect:/");
		return mv;
	}
	
	@RequestMapping(value="/member/keyCheck.do",method=RequestMethod.POST)//인증키 확인 ajax
	@ResponseBody
	public boolean keyCheck(@RequestParam(required=false) String key1,@RequestParam(required=false) String key2,
			@RequestParam(required=false) String key3,@RequestParam(required=false) String key4,
			@RequestParam(required=false) String key5,@RequestParam(required=false) String key6,HttpSession session) {
		Map userInfo=(Map)session.getAttribute("userInfo");
		boolean flag=false;
	
		if(key1!=null&&key2!=null&&key3!=null&&key4!=null&&key5!=null&&key6!=null) {
			String key=key1+key2+key3+key4+key5+key6;
			System.out.println(key);
			if(key.equals(userInfo.get("key"))) {
				userInfo.put("auth","Y");
				session.setAttribute("userInfo", userInfo);
				flag = true;
			}else flag = false;
		}
		return flag;
	}
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	//추가된 주소 수정 눌렀을 떄 페이지 보여주기
	@RequestMapping("/member/addAddrInformation.do")
	public String addAddrInformation(HttpSession session, String addrNo, Model model) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		Map data = new HashMap();
		data.put("mNo", mNo);
		data.put("addrNo", addrNo);
		
		System.out.println(mNo + addrNo);
		
		Addr address = service.getAddress(data);
		String fullAddr = address.getAddress();

		String[] a=fullAddr.split("/");
		address.setAddress_post(a[0]);
		address.setAddress_addr(a[1]);
		address.setAddress_detail(a[2]);
		
		model.addAttribute("address", address);
		
		return "member/mypageDiv/addAddr";
	}
	
	//Form 보여주기(주소추가, 회원탈퇴)
	@RequestMapping("/member/insertForm.do")
	public String insertAddrFrom(String form) {
		return form;
	}
	
	@RequestMapping("/test")
	public String test() {
		return "admin/emailTest";
	}
	
	//주소추가하기
	@RequestMapping("/member/insertAddr.do")
	public String insertAddr(@RequestParam Map<String, Object> updateInformation, HttpSession session, Model m) {
		System.out.println("요거" + updateInformation);
		
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		updateInformation.put("mNo", mNo);
		
		String address = (String)updateInformation.get("post") + "/" + (String)updateInformation.get("addr") + "/" + (String)updateInformation.get("detail");
		updateInformation.put("address", address);
		
		int result = service.insertAddr(updateInformation);
		
		if(result > 0) {
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
			m.addAttribute("addrList", list2);
			return "member/mypageDiv/addrList";
		} else {
			return ""; //어디로..........
		}
		
	}
	
	//배송지 삭제하기
	@RequestMapping("/member/deleteAddress.do")
	public String deleteAddress(String addrNo, HttpSession session, Model m) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		Map data = new HashMap();
		data.put("mNo", mNo);
		data.put("addrNo", addrNo);
		
		int result = service.deleteAddress(data);
		
		if(result > 0) {
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
			m.addAttribute("addrList", list2);
			return "member/mypageDiv/addrList";
		} else {
			return ""; //어디......
		}
		
	}
	
	//탈퇴하기
	@RequestMapping("/member/deleteMember.do")
	@ResponseBody
	public int deleteMember(String pwck, HttpSession session) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		String pw = (String)login.get("MEMBER_PWD");
		System.out.println(mNo);
		System.out.println(pw);
		int result = 0;
		if(pwEncoder.matches(pwck, pw)) {
			System.out.println(1);
			result = service.deleteMember(mNo);
			System.out.println(2);
		} else {
			result = -2;
		}
		
		System.out.println(result);
		
		return result;
	}
	
	///포인트 페이지로 이동
	@RequestMapping("/point/pointForm.do")
	public String pointForm() {
		return "member/point";
	}
	
	
	//포인트 페이지로 이동 (month로 조회하기)
	@RequestMapping("/point/point.do")
	public String pointForm(HttpSession session, Model m, @RequestParam(value="startDate", required = false) String startDate,
															@RequestParam(value="endDate", required = false) String endDate,
															@RequestParam(value="type", required = false) String type) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		System.out.println(startDate + endDate + type);
		
//		Calendar c = Calendar.getInstance();
//		if(month != null) { //month가 null 아닐 때
//			month = month.substring(0, month.length()-1);
//			if(month.length() == 1) {
//				
//				month = "0" + month;
//			}
//			
//			month = c.get(Calendar.YEAR) + month;
//		}
//		
//		
//		System.out.println(month);
		Map data = new HashMap();
		data.put("mNo", mNo);
		data.put("sd", startDate);
		data.put("ed", endDate);
		data.put("type", type);
		
		List<Point> list = service.pointList(data);
		
		List<Point> list2 = new ArrayList<Point>();
		
		HashSet months = new HashSet();
		for(Point p : list) {
			String[] dateStr = p.getPoint_date().split(" ");
			p.setPoint_date(dateStr[0]);
			list2.add(p);
			
			months.add(p.getPoint_date().substring(0, 7));
		}
		
		System.out.println(list2);
		m.addAttribute("list", list2);
		m.addAttribute("months", months);
		
		
		return "member/pointList";
	}
	
	//month로 조회하기
//	@RequestMapping("/member/selectMonthPoint")
//	@ResponseBody
//	public String selectMonthPoint(String month, HttpSession session) {
//		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
//		String mNo = (String)login.get("MEMBER_NO");
//		
//		Calendar c = Calendar.getInstance();
//		month = month.substring(0, month.length()-1);
//		if(month.length() == 1) {
//			month = "0" + month;
//		}
//		System.out.println(c.get(Calendar.YEAR) + month);
//		
//		Map data = new HashMap();
//		data.put("mNo", mNo);
//		data.put("month", month);
//		
//		List<Point> list = service.selectMonthPoint(data);
//		System.out.println(list);
//		
//		
//		return "";
//	}
	
	//검색하기
	@RequestMapping("/searchAuto.do")
	@ResponseBody
	public List searchAuto(String str) {
		
		List list = new ArrayList();
		list.add("가");
		list.add("가방");
		list.add("가구");
		list.add("조명");
		list.add("조명스탠드");
		list.add("찰또기");
		list.add("찰찰또기또기");

	      
	      return list;
		
	}
	
	//이메일 수신 체크
	@RequestMapping("/member/emailCk.do")
	@ResponseBody
	public String emailCk(String ck, HttpSession session) {
		System.out.println(ck);
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		Map data = new HashMap();
		data.put("mNo", mNo);
		data.put("ck", ck);
		
		int result = service.emailCk(data);
		return "성공";
	}
}
