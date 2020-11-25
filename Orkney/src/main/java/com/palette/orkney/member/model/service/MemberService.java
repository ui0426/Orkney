package com.palette.orkney.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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

}
