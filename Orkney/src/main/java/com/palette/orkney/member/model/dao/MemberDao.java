package com.palette.orkney.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;

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


	List<Map> chatAllData(SqlSession session, String id);

	int chatDataSave(SqlSession session, Map m);


	String newRoomNo(SqlSession session,int newNo);

	//가입 시 주소가져오기
	String getAddress(SqlSession session, String no);
	
	//추가된 배송지 리스트 가져오기
	List<Addr> addAddrList(SqlSession session, String mNo);

	//이름, 생일 수정
	int updateMemberPersonal(SqlSession session, Map updateInformation);

	//연락처 수정
	int updateMemberContact(SqlSession session, Map<String, Object> updateInformation);

	//현재 로그인 된 유저 정보 받아오기
	Member currentMemberInformation(SqlSession session, String mNo);

	//패스워드 수정
	int updateMemberPassword(SqlSession session, Map<String, Object> updateInformation);


}
