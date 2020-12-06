package com.palette.orkney.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.palette.orkney.member.model.vo.Addr;
import com.palette.orkney.member.model.vo.Member;

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

	String getAddress(String no);
	
	List<Addr> addAddrList(String mNo);

	//이름,생일 수정
	int updateMemberPersonal(Map updateInformation);

	//연락처수정
	int updateMemberContact(Map<String, Object> updateInformation);

	//패스워드수정
	int updateMemberPassword(Map<String, Object> updateInformation);

	//현재 로그인 된 유저 정보 받아오기
	Member currentMemberInformation(String mNo);

}
