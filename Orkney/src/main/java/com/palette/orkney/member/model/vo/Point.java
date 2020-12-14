package com.palette.orkney.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	
	private String point_no;
	private String member_no;
	private String point_date;
	
	private int point_point;	
	
	private String point_type;
	private String point_content;

}
