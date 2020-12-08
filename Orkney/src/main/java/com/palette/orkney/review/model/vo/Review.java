package com.palette.orkney.review.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
	private int review_no;
	private int product_grade;
	private String review_content;
	private String member_no;
	private String product_no;
	private Date review_date;
	private int order_detail_no;
}
