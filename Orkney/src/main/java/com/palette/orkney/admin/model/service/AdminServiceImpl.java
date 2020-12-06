package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map> chatData(Map data) {
		
		return dao.chatData(session,data);
	}
	
	@Override
	public List<String> userCount() {
		
		return dao.userCount(session);
	}

	@Override
	public List<String> roomNo(String data) {
		// TODO Auto-generated method stub
		return dao.roomNo(session,data);
	}
	
}
