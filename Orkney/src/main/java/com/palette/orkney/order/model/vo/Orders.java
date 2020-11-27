package com.palette.orkney.order.model.vo;

import java.sql.Date;

import com.palette.orkney.member.model.vo.Addr;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orders {
	
	private int order_no;
	private String member_no;
	private Date order_date;
	private String order_name;
	private String order_phone;
	private String order_address;
	private int order_qty;
	private int total_price;
	private String order_state;
	
}
