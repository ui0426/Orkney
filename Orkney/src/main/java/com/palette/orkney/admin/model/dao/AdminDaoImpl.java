package com.palette.orkney.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {

	@Override
	public List<String> userCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("admin.userCount");
	}

	@Override
	public List<Map> chatData(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.selectList("admin.chatData",data);
	}

	@Override
	public List<String> roomNo(SqlSession session, String data) {
		// TODO Auto-generated method stub
		return session.selectList("admin.roomNo",data);
	}
	
	
}
