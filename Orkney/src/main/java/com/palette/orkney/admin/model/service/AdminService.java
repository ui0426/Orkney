package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map> chatData(Map m);

	List<String> userCount();

	List<String> roomNo(String data);

}
