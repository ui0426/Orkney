package com.palette.orkney.google.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.google.gson.Gson;
import com.palette.orkney.google.model.vo.GoogleOAuthRequest;
import com.palette.orkney.google.model.vo.GoogleOAuthResponse;
import com.palette.orkney.member.model.service.MemberService;

@SessionAttributes("login")
@Controller
public class GoogleController {
	
	@Autowired
	private MemberService service;
	

	@RequestMapping("/login/google/auth")
	public String googleAuth(Model model, @RequestParam(value = "code") String authCode)
			throws JsonProcessingException {
		
		//HTTP Request를 위한 RestTemplate
		RestTemplate restTemplate = new RestTemplate();
		//Google OAuth Access Token 요청을 위한 파라미터 세팅
		GoogleOAuthRequest googleOAuthRequestParam = GoogleOAuthRequest
				.builder()
				.clientId("63421017718-97poh5dtj10hbv1ul6q80h9g51tpov1d.apps.googleusercontent.com")
				.clientSecret("RlqoutVI0qC4Zw8CPuo3UBwC")
				.code(authCode)
				.redirectUri("http://localhost:9090/orkney/login/google/auth")
				.grantType("authorization_code").build();
				
		
		//JSON 파싱을 위한 기본값 세팅
				//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
		ObjectMapper mapper = new ObjectMapper();
		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
		mapper.setSerializationInclusion(Include.NON_NULL);
		
//		https://www.googleapis.com/oauth2/v4/token
			
		//AccessToken 발급 요청
		ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);
		
		GoogleOAuthResponse result=new Gson().fromJson(resultEntity.getBody(),GoogleOAuthResponse.class);
		System.out.println(result);
		//Token Request
//		GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {});

		
		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
		String jwtToken = result.getId_token();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
		.queryParam("id_token", jwtToken).encode().toUriString();
		
		String resultJson = restTemplate.getForObject(requestUrl, String.class);
		
		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
		System.out.println(userInfo);
		
		String userId=userInfo.get("sub");
		Map exist=service.loginCheck(userId);
		
		Map snsData=new HashMap();
		snsData.put("id",userInfo.get("email"));
		snsData.put("name",userInfo.get("name"));
		snsData.put("profile",userInfo.get("picture"));
		snsData.put("aToken",result.getAccess_token());
		snsData.put("rToken",result.getRefresh_token());
		
		if(exist==null) {
			Map userData=new HashMap();
			userData.put("email",userId);
			userData.put("password","");
			userData.put("f_name",userInfo.get("family_name"));
			userData.put("g_name",userInfo.get("given_name"));
			userData.put("birthday","00/01/01");
			userData.put("phone",userInfo.get("exp"));
			userData.put("emailCh","N");
			userData.put("type","구글");
			
			int insertId=service.insertSignup(userData,snsData);
			
			if(insertId>0) model.addAttribute("login",service.snsUserInfo(userId));
			
		}else {
				int update=service.updateSnsId(snsData);
				model.addAttribute("login",service.snsUserInfo(userId));
		}
		
		
		return "redirect:/";

	}
	
	@GetMapping("/google/revoke/token")
	public String revokeToken(SessionStatus ss,Model m) throws JsonProcessingException {
		Map login=(Map)m.getAttribute("login");
		String token=(String)login.get("ACCESS_TOKEN");
		
		
		System.out.println(token);
		
		Map<String, String> result = new HashMap<>();
		RestTemplate restTemplate = new RestTemplate();
		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
				.queryParam("token", token).encode().toUriString();
		final String resultJson = restTemplate.postForObject(requestUrl,null,String.class);
		result.put("result", "success");
		result.put("resultJson", resultJson);
		System.out.println(resultJson);
		if(!ss.isComplete()) {
			ss.setComplete();
		}
		
		
		return "redirect:/";

	}
}
