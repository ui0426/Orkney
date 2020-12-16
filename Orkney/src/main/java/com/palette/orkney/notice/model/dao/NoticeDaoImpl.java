package com.palette.orkney.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Map> popularFAQ(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.popularFAQ");
	}

	@Override
	public List<Map> totalFAQ(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.totalFAQ");
	}

	@Override
	public List<Map> categoryFAQ(SqlSession session, Map type) {
		// TODO Auto-generated method stub
		return session.selectList("notice.categoryFAQ",type);
	}

	@Override
	public List<String> categoryList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("notice.categoryList");
	}

	@Override
	public int increasePopular(SqlSession session, String no) {
		// TODO Auto-generated method stub
		return session.update("notice.increasePopular",no);
	}
	
}
