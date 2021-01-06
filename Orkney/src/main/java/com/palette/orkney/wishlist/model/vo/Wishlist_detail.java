package com.palette.orkney.wishlist.model.vo;

import com.palette.orkney.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wishlist_detail {
	
	private String wishlist_no;
	private String product_no;
	private int product_qty;
	private String big_category_content;
	private Product product;
	

}
