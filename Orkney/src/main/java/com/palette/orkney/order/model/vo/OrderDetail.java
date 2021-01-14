package com.palette.orkney.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDetail {

	private int order_detail_no;
	private String product_no;
	private int product_qty;
	private String order_no;
	private String sort;
	private int refund_qty;
	private String refund_reason;
	private String refund_content;
	private String refund_pic;
	
	//product
	private String product_name;
	private int product_price;
	private String product_color;
	private String product_width;
	private String product_height;
	private String product_depth;
	private String small_category_no;
	private int sale_per;
	
	//product_image
	private String product_pic;

	//small_category
	private String small_category_content;
	
	//member
	private String member_id;
	private String member_name;
	
	//review
	private int review_no;
	
	//point : refund위해서
	private int point_point;
	
		
}