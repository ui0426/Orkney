package com.palette.orkney.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;
import com.palette.orkney.member.model.vo.Point;

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
	Addr getAddress(SqlSession session, String no);
	
	//추가된 배송지 리스트 가져오기
	List<Addr> addAddrList(SqlSession session, String mNo);


	Map snsUserInfo(SqlSession session, String userId);

	int updateSnsId(SqlSession session, Map snsData);

	int defaultWishList(SqlSession session, String mNo);

	Map emailCh(SqlSession session, Map id);

	int transPwch(SqlSession session, Map data);

	//이름, 생일 수정
	int updateMemberPersonal(SqlSession session, Map updateInformation);

	//연락처 수정
	int updateMemberContact(SqlSession session, Map<String, Object> updateInformation);

	//현재 로그인 된 유저 정보 받아오기
	Member currentMemberInformation(SqlSession session, String mNo);

	//패스워드 수정
	int updateMemberPassword(SqlSession session, Map<String, Object> updateInformation);
	
	//포인트 업데이트
	int updatePoint(SqlSession session,Map<String,Object> uppo);


	//기본 주소 수정
	int updateMemberAddress(SqlSession session, Map<String, Object> updateInformation);
	
	//주소넘으로 주소가져오기
	Addr getAddress(SqlSession session, Map data);

	//주소 추가하기
	int insertAddr(SqlSession session, Map<String, Object> updateInformation);

	//배송지 삭제
	int deleteAddress(SqlSession session, Map data);

	//탈퇴하기
	int deleteMember(SqlSession session, String mNo);

	//포인트 내역 가져오기
	List<Point> pointList(SqlSession session, Map data);



}
