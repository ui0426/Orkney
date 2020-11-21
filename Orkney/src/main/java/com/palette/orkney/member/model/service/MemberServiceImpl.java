package com.palette.orkney.member.model.service;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.member.model.dao.MemberDao;

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

}
