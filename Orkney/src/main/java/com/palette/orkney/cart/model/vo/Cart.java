package com.palette.orkney.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private String memberNo;
	private String cartNo;
	private String productNo;
	private int cartQTY;
	
	private String product_name;
	private int product_price;
	private String product_color;
	private String product_width;
	private String product_height;
	private String product_depth;
	private String big_category;
	private String small_category;
	
	private String product_pic;
	
	private String phone;
	private String member_name;
	private String member_id;
	
	private int point;
	
	
	
}
