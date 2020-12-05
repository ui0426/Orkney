package com.palette.orkney.wishlist.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wishlist {
	
	private String wishlist_no;
	private String member_no;
	private String wishlist_name;
	private ArrayList<Wishlist_detail> wishlist_detail;

}
