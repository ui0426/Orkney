package com.palette.orkney.product.model.service;

import java.util.List;
import java.util.Map;

public interface ProductService {

	List<Map> selectRooms(String type);
	List<Map> selectRoomsProduct(String type);
	List<Map> roomsDetail(String type);
	List<Map> selectRoomsTitle(String type); 
}
