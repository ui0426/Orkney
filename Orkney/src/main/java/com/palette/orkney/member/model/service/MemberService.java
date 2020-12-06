package com.palette.orkney.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.palette.orkney.member.model.vo.Addr;

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

	int insertSignup(Map userData, Map snsData);

	Map snsUserInfo(String userId);

	int updateSnsId(Map snsData);

	int defaultWishList(String mNo);

	Map emailCh(Map data);

	int transPwch(Map data);
}
