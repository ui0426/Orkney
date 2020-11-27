package com.palette.orkney.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.member.model.vo.Addr;

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

	@Override
	public int insertSignup(SqlSession session, Map userInfo) {
		// TODO Auto-generated method stub
		return session.insert("member.insertSignup",userInfo);
	}

	@Override
	public Map searchUser(SqlSession session, String email) {
		// TODO Auto-generated method stub
		return session.selectOne("member.searchUser",email);
	}

	@Override
	public int addAdr(SqlSession session, Map userInfo) {
		// TODO Auto-generated method stub
		return session.insert("member.addAdr",userInfo);
	}

	@Override
	public List chatRoomNo(SqlSession session, String no) {
		// TODO Auto-generated method stub
		return session.selectList("member.chatRoomNo",no);
	}

	@Override
	public List<Map> chatData(SqlSession session,String chatRoomNo) {
		// TODO Auto-generated method stub
		return session.selectList("member.chatData", chatRoomNo);
	}

	@Override
	public List<Map> chatRoom(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.selectList("member.chatRoom",m);
	}

	//가입 시 주소 가져오기
	@Override
	public String getAddress(SqlSession session, String no) {
		return session.selectOne("member.getAddress", no);
	}

	//추가된 배송지 리스트 가져오기
	@Override
	public List<Addr> addAddrList(SqlSession session, String mNo) {
		return session.selectList("member.addAddrList", mNo);
	}
	
}
