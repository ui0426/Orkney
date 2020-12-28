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
	
	private String productName;
	private int productPrice;
	private String product_color;
	private String product_width;
	private String product_height;
	private String product_depth;
	private String big_category;
	private String small_category;
	private String sale_per;
	
	private String product_pic;
	
	
	private int point;
	private String totalPrice;
	
	
	private String phone;
	private String member_name;
	private String member_id;
	
	private String small_category_content;
	
}
