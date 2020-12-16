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
	private String cartNo;
	private String oriaddress;
	
	
	private int point;		
	private int predicpoint;
	private int willpoint;	
	private int totalFee;
	
}
