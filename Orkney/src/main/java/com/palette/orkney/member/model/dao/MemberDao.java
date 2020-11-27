package com.palette.orkney.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.member.model.vo.Addr;

public interface MemberDao {

	Map loginCheck(String id, SqlSession session);

	int insertSnsLogin(SqlSession session, Map snsData);

	Map searchGoogleId(SqlSession session, Map snsData);

	int updateGoogleId(SqlSession session, Map snsData);

	int insertSignup(SqlSession session, Map userInfo);

	Map searchUser(SqlSession session, String email);

	int addAdr(SqlSession session, Map userInfo);

	List chatRoomNo(SqlSession session, String no);

	List<Map> chatData(SqlSession session, String chatRoomNo);

	List<Map> chatRoom(SqlSession session, Map m);

	//가입 시 주소가져오기
	String getAddress(SqlSession session, String no);

	//추가된 배송지 리스트 가져오기
	List<Addr> addAddrList(SqlSession session, String mNo);

}
