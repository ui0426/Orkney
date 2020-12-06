package com.palette.orkney.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private String member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private Date enroll_date;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;
	private String phone;
	private int point;
	private String authority;
	private String email_ch;
	
	private ArrayList<Addr> addr; //배송지 담을꺼야
}
