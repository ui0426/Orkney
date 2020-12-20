package com.palette.orkney.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.palette.orkney.member.model.dao.MemberDao;
import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;
import com.palette.orkney.member.model.vo.Point;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public Map loginCheck(String id) {
		// TODO Auto-generated method stub
		return dao.loginCheck(id,session);
	}

	@Override
	public int insertSnsLogin(Map snsData) {
		// TODO Auto-generated method stub
		return dao.insertSnsLogin(session,snsData);
	}

	@Override
	public Map searchGoogleId(Map snsData,boolean flag) {
		// TODO Auto-generated method stub
		if(flag) {
			dao.updateGoogleId(session,snsData);
		}
		
		return dao.searchGoogleId(session,snsData);
	}

	@Override
	public int insertSignup(Map userInfo) {
		return dao.insertSignup(session,userInfo);
	}

	@Override
	public Map searchUser(String email) {
		// TODO Auto-generated method stub
		return dao.searchUser(session,email);
	}

	@Override
	public int addAdr(Map userInfo) {
		// TODO Auto-generated method stub
		return dao.addAdr(session,userInfo);
	}

	@Override
	public List chatRoomNo(String no) {//한 명의 채팅방 개수
		// TODO Auto-generated method stub
		return dao.chatRoomNo(session,no);
	}

	@Override
	public List chatData(List<String> chatRoomNo) {
		List list=new ArrayList();
		for(String s:chatRoomNo) {
			List<Map> chat=dao.chatData(session,s);
			list.add(chat);
		}
		return list;
	}

	@Override
	public List<Map> chatRoom(Map m) {//한 회원의 하나의 채팅방 내용
		// TODO Auto-generated method stub
		return dao.chatRoom(session, m);
	}

	@Override
	public List<Map> chatAllData(String id) {//일반 사용자에게 처음 값을 뿌려주는 데이터 (한 사람의 전체 채팅방 내용)
		List<String> no=dao.chatRoomNo(session, id);
		List list=new ArrayList();
		for(String s:no) {
			List<Map> chat=dao.chatData(session,s);
			list.add(chat);
		}
		return list;
	}
	
	@Transactional
	@Override
	public List chatDataSave(Map m) {
		// TODO Auto-generated method stub
		List result=new ArrayList();
		int a=dao.chatDataSave(session,m);
		String b="";
		if(a>0) {
		b=dao.newRoomNo(session,(int)(m.get("newNo")));
		}
		result.add(a);
		result.add(b);
		return result;
	}
	
	//가입 시 주소 가져오기
	@Override
	public Addr getAddress(String no) {
		return dao.getAddress(session, no);
	}

	//추가된 배송지 리스트 가져오기
	@Override
	public List<Addr> addAddrList(String mNo) {
		return dao.addAddrList(session, mNo);
		
	}
	
	@Transactional
	@Override
	public int insertSignup(Map userData, Map snsData) {
		// TODO Auto-generated method stub
		int result=dao.insertSignup(session, userData);
		if(result>0) {
			snsData.put("mNo",userData.get("mNo"));
			dao.insertSnsLogin(session, snsData);
		}
		return result;
	}

	@Override
	public Map snsUserInfo(String userId) {
		// TODO Auto-generated method stub
		return dao.snsUserInfo(session,userId);
	}

	@Override
	public int updateSnsId(Map snsData) {
		// TODO Auto-generated method stub
		return dao.updateSnsId(session,snsData);
	}

	@Override
	public int defaultWishList(String mNo) {
		// TODO Auto-generated method stub
		return dao.defaultWishList(session, mNo);
	}

	@Override
	public Map emailCh(Map id) {
		// TODO Auto-generated method stub
		return dao.emailCh(session,id);
	}

	@Override
	public int transPwch(Map data) {
		// TODO Auto-generated method stub
		return dao.transPwch(session,data);
	}

	public int updateMemberPersonal(Map updateInformation) {
		return dao.updateMemberPersonal(session, updateInformation);
	}

	//연락처 수정
	@Override
	public int updateMemberContact(Map<String, Object> updateInformation) {
		return dao.updateMemberContact(session, updateInformation);
	}

	//현재 로그인 된 유저 정보 받아오기
	@Override
	public Member currentMemberInformation(String mNo) {
		return dao.currentMemberInformation(session, mNo);
	}

	//패스워드 수정
	@Override
	public int updateMemberPassword(Map<String, Object> updateInformation) {
		return dao.updateMemberPassword(session, updateInformation);
	}


	//포인트 업데이트
	@Override
	public int updatePoint(Map<String, Object> uppo) {
		return dao.updatePoint(session,uppo);
	}
	

	//기본 주소 수정
	@Override
	public int updateMemberAddress(Map<String, Object> updateInformation) {
		return dao.updateMemberAddress(session, updateInformation);
	}

	//주소넘으로 주소가져오기
	@Override
	public Addr getAddress(Map data) {
		return dao.getAddress(session, data);
	}

	//주소추가하기
	@Override
	public int insertAddr(Map<String, Object> updateInformation) {
		return dao.insertAddr(session, updateInformation);
	}

	//배송지 삭제
	@Override
	public int deleteAddress(Map data) {
		return dao.deleteAddress(session, data);
	}

	//탈퇴하기
	@Override
	public int deleteMember(String mNo) {
		return dao.deleteMember(session, mNo);
	}

	//포인트 내역 가져오기
	@Override
	public List<Point> pointList(Map data) {
		return dao.pointList(session, data);
	}


	
	
}
