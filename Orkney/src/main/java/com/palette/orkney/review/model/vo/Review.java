package com.palette.orkney.review.model.vo;

import java.sql.Date;
import java.util.List;

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
	
	private List<ReviewImage> riList;
	
	//product
	private String product_name;
	private int product_price;
	private String product_color;
	private String product_width;
	private String product_height;
	private String product_depth;
	private String small_category_no;
	
	//product_image
	private String product_pic;

	//small_category
	private String small_category_content;
	
	//member
	private String member_name;
	
	//첨부 이미지 갯수
	private int img_count;
}
