package com.palette.orkney.cart.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private String member_no;
	private String cart_no;
	private String product_no;
	private String cart_qty;
	
	private String product_name;
	private int product_price;
	private String product_color;
	private String product_width;
	private String product_height;
	private String product_depth;
	private String big_category;
	private String small_category;
	
	private String product_pic;
}
