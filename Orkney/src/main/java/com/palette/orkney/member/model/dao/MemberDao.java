package com.palette.orkney.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface MemberDao {

	Map loginCheck(String id, SqlSession session);

	int insertSnsLogin(SqlSession session, Map snsData);

	Map searchGoogleId(SqlSession session, Map snsData);

	int updateGoogleId(SqlSession session, Map snsData);

}
