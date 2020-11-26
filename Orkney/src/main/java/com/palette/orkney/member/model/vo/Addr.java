package com.palette.orkney.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Addr {
	
	private String member_no;
	private String address;
	private int address_type;
	private String address_name;
	private String address_phone;

}
