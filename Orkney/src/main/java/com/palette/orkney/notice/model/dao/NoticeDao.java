package com.palette.orkney.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface NoticeDao {

	List<Map> popularFAQ(SqlSession session);
	
	List<Map> totalFAQ(SqlSession session);

	List<Map> categoryFAQ(SqlSession session, Map type);

}
