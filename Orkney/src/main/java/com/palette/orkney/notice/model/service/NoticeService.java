package com.palette.orkney.notice.model.service;

import java.util.List;
import java.util.Map;

public interface NoticeService {

	List<Map> popularFAQ();
	
	List<Map> totalFAQ();

	List<Map> categoryFAQ(Map type);

	List<String> categoryList();

	int increasePopular(String no);

}
