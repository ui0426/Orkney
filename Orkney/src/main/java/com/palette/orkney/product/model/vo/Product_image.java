package com.palette.orkney.product.model.vo;

import com.palette.orkney.review.model.vo.ReviewImage;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product_image {
	
	private String product_pic;
	private String product_no;
	private String product_color;
	
	private String originalFileName;
	private String renamedFileName;

}
