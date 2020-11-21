package com.palette.orkney.member.model.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface MemberService {

	Map loginCheck(String id);

	int insertSnsLogin(Map snsData);

	Map searchGoogleId(Map snsData, boolean flag);

}
