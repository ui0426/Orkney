package com.palette.orkney.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface AdminDao {

	List<String> userCount(SqlSession session);

	List<Map> chatData(SqlSession session, Map data);

	List<String> roomNo(SqlSession session, String data);

}
