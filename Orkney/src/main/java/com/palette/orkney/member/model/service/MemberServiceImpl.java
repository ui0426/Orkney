package com.palette.orkney.member.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.member.model.dao.MemberDao;
import com.palette.orkney.member.model.vo.Addr;

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
	public List chatRoomNo(String no) {
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
	public List<Map> chatRoom(Map m) {
		// TODO Auto-generated method stub
		return dao.chatRoom(session, m);
	}

	//가입 시 주소 가져오기
	@Override
	public String getAddress(String no) {
		return dao.getAddress(session, no);
	}

	//추가된 배송지 리스트 가져오기
	@Override
	public List<Addr> addAddrList(String mNo) {
		return dao.addAddrList(session, mNo);
	}
	
}
