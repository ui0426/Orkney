package com.palette.orkney.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;
import com.palette.orkney.member.model.vo.Point;

@Service
public interface MemberService {

	Map loginCheck(String id);

	int insertSnsLogin(Map snsData);

	Map searchGoogleId(Map snsData, boolean flag);

	int insertSignup(Map userInfo);

	Map searchUser(String email);

	int addAdr(Map userInfo);

	List chatRoomNo(String no);

	List chatData(List<String> chatRoomNo);

	List<Map> chatRoom(Map m);

	List<Map> chatAllData(String id);

	List chatDataSave(Map m);

	Addr getAddress(String no);
	
	List<Addr> addAddrList(String mNo);


	int insertSignup(Map userData, Map snsData);

	Map snsUserInfo(String userId);

	int updateSnsId(Map snsData);

	int defaultWishList(String mNo);

	Map emailCh(Map data);

	int transPwch(Map data);

	//이름,생일 수정
	int updateMemberPersonal(Map updateInformation);

	//연락처수정
	int updateMemberContact(Map<String, Object> updateInformation);

	//패스워드수정
	int updateMemberPassword(Map<String, Object> updateInformation);

	//현재 로그인 된 유저 정보 받아오기
	Member currentMemberInformation(String mNo);
	
	//포인트 업데이트
	int updatePoint(Map<String,Object> uppo);	


	//기본주소 수정
	int updateMemberAddress(Map<String, Object> updateInformation);

	//주소넘으로 주소가져오기
	Addr getAddress(Map data);
	
	//주소 추가하기
	int insertAddr(Map<String, Object> updateInformation);

	//배송지 삭제
	int deleteAddress(Map data);

	//탈퇴하기
	int deleteMember(String mNo);

	//포인트 내역 가져오기
	List<Point> pointList(Map data);

	//이메일 수신 체크
	int emailCk(Map data);

	//이메일 인증하기
	int updateMemberAuth(Map updateInformation);

	//수신 동의한 이메일 리스트 가져오기
	List<String> emailAgree();


}
