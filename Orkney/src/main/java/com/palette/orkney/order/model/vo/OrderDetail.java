package com.palette.orkney.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {

	private int order_detail_no;
	private String product_no;
	private int product_qty;
	private String order_no;
	
	//product
	private String product_name;
	private int product_price;
	private String product_color;
	private String small_category_no;
	
	//product_image
	private String product_pic;

	//small_category
	private String small_category_content;
}