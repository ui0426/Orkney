package com.palette.orkney.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Override
	public Map loginCheck(String id, SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("member.loginCheck",id);
	}

	@Override
	public int insertSnsLogin(SqlSession session, Map snsData) {
		// TODO Auto-generated method stub
		return session.insert("member.insertSnsLogin",snsData);
	}

	@Override
	public Map searchGoogleId(SqlSession session, Map snsData) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchGoogleId",snsData);
	}

	@Override
	public int updateGoogleId(SqlSession session, Map snsData) {
		// TODO Auto-generated method stub
		return session.update("member.updateGoogleId",snsData);
	}

}
