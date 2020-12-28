package com.palette.orkney.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;
import com.palette.orkney.member.model.vo.Point;

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

	@Override
	public List<Map> chatAllData(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.selectList("member.chatAllData",id);
	}

	@Override
	public int chatDataSave(SqlSession session, Map m) {
		// TODO Auto-generated method stub
		return session.insert("member.chatDataSave",m);
	}
	
	//가입 시 주소 가져오기
	@Override
	public Addr getAddress(SqlSession session, String no) {
		return session.selectOne("member.getBasicAddress", no);
	}

	@Override
	public String newRoomNo(SqlSession session,int newNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.newRoomNo",newNo);
	}
	
	//추가된 배송지 리스트 가져오기
	@Override
	public List<Addr> addAddrList(SqlSession session, String mNo) {
		return session.selectList("member.addAddrList", mNo);
	}


	@Override
	public Map snsUserInfo(SqlSession session, String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("member.snsUserInfo",userId);
	}

	@Override
	public int updateSnsId(SqlSession session, Map snsData) {
		// TODO Auto-generated method stub
		return session.update("member.updateSnsId",snsData);
	}

	@Override
	public int defaultWishList(SqlSession session, String mNo) {
		// TODO Auto-generated method stub
		return session.insert("member.defaultWishList",mNo);
	}

	@Override
	public Map emailCh(SqlSession session, Map id) {
		// TODO Auto-generated method stub
		return session.selectOne("member.emailCh",id);
	}

	@Override
	public int transPwch(SqlSession session, Map data) {
		// TODO Auto-generated method stub
		return session.update("member.transPwch",data);
	}

	//이름, 생일 수정
	@Override
	public int updateMemberPersonal(SqlSession session, Map updateInformation) {
		System.out.println("daoimpl");
		return session.update("member.updateMemberPersonal", updateInformation);
	}

	//연락처 수정
	@Override
	public int updateMemberContact(SqlSession session, Map<String, Object> updateInformation) {
		return session.update("member.updateMemberContact", updateInformation);
	}

	//현재 로그인 된 유저 정보 받아오기
	@Override
	public Member currentMemberInformation(SqlSession session, String mNo) {
		return session.selectOne("member.currentMemberInformation", mNo);
	}

	//패스워드 수정
	@Override
	public int updateMemberPassword(SqlSession session, Map<String, Object> updateInformation) {
		return session.update("member.updateMemberPassword", updateInformation);
	}
	
	//포인트 업데이트
	@Override
	public int updatePoint(SqlSession session, Map<String, Object> uppo) {
		return session.update("member.updatePoint",uppo);
	}

	//기본주소수정
	@Override
	public int updateMemberAddress(SqlSession session, Map<String, Object> updateInformation) {
		return session.update("member.updateMemberAddress", updateInformation);
	}

	//주소넘으로 주소가져오기
	@Override
	public Addr getAddress(SqlSession session, Map data) {
		return session.selectOne("member.getAddress", data);
	}

	//주소 추가하기
	@Override
	public int insertAddr(SqlSession session, Map<String, Object> updateInformation) {
		return session.insert("member.insertAddr", updateInformation);
	}

	//배송지 삭제
	@Override
	public int deleteAddress(SqlSession session, Map data) {
		return session.delete("member.deleteAddress", data);
	}

	//탈퇴하기
	@Override
	public int deleteMember(SqlSession session, String mNo) {
		return session.delete("member.deleteMember", mNo);
	}

	//포인트 내역 가져오기
	@Override
	public List<Point> pointList(SqlSession session, Map data) {
		return session.selectList("member.pointList", data);
	}

	@Override
	public int emailAuth(SqlSession session, String id) {
		// TODO Auto-generated method stub
		return session.update("member.emailAuth",id);
	}
	//이메일 수신 체크
	@Override
	public int emailCk(SqlSession session, Map data) {
		return session.update("member.emailCk", data);
	}

	//이메일 인증하기
	@Override
	public int updateMemberAuth(SqlSession session, Map updateInformation) {
		return session.update("member.updateMemberAuth", updateInformation);
	}

	//수신 동의한 이메일 리스트 가져오기
	@Override
	public List<String> emailAgree(SqlSession session) {
		return session.selectList("member.emailAgree");
	}
	
}
