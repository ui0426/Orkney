package com.palette.orkney.notice.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.notice.model.dao.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao dao;
	@Autowired
	private SqlSession session;
	
	
	@Override
	public List<Map> popularFAQ() {
		// TODO Auto-generated method stub
		return dao.popularFAQ(session);
	}

	@Override
	public List<Map> totalFAQ() {
		// TODO Auto-generated method stub
		return dao.totalFAQ(session);
	}

	@Override
	public List<Map> categoryFAQ(Map type) {
		// TODO Auto-generated method stub
		return dao.categoryFAQ(session,type);
	}

	@Override
	public List<String> categoryList() {
		// TODO Auto-generated method stub
		return dao.categoryList(session);
	}

	@Override
	public int increasePopular(String no) {
		// TODO Auto-generated method stub
		return dao.increasePopular(session,no);
	}

}
