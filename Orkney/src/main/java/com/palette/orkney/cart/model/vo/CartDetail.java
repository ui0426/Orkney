package com.palette.orkney.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartDetail {
	private String memberNo;
	private String phone;
	private String member_name;
	private String member_id;
	private int point;
	private String cartNo;
	
	private int predicpoint;
}
