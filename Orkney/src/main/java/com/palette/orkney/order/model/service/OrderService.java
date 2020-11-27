package com.palette.orkney.order.model.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

	List<Map> selectOrderList(String mNo);
}
