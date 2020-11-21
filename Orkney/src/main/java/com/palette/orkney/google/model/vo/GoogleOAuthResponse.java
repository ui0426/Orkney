package com.palette.orkney.google.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class GoogleOAuthResponse {
	
	private String access_token;
	private String expires_in;
	private String refresh_token;
	private String scope;
	private String token_type;
	private String id_token;

}
