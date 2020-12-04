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
}
