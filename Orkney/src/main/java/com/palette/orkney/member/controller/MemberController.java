package com.palette.orkney.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;

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
			
			//가입할 때 주소 가져오기
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
//		mv.setViewName("member/mypage");
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
	
	//현재 로그인 된 유저 정보 받아오기
	@RequestMapping("/member/currentMemberInformation.do")
	@ResponseBody
	public Member currentMemberInformation(HttpSession session) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO");
		
		
		Member m = service.currentMemberInformation(mNo);
		
		System.out.println(m);
		return m; //화면에서 널처리를 해줘야 하나?
	}
	
//	//personal 업데이트 정보
//	@RequestMapping("/member/personalJspUpdate.do")
//	public String personalJspUpdate() {
//		return "member/mypageDiv/personal.jsp";
//	}
}
