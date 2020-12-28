package com.palette.orkney.order.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
	
	private String order_no;
	private String member_no;
	private Date order_date;
	private String order_name;
	private String order_phone;
	private String order_address;
	private int order_qty;
	private int total_price;
	private String order_state;
	private String order_memo;
	private String payment_method;
	private String cancel_reason;
	private String address_post;
	private String address_addr;
	private String address_detail;
	private int point_no;
	private List<OrderDetail> odList;
	
	//member
	private String member_id;
	private String member_name;

	private String phone;
	
	private String keyword;
	private String search_option;
	
	//point
	private int point_point;
}
