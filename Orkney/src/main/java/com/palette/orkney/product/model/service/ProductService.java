package com.palette.orkney.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface ProductService {

//	경록
	List<Map> sCategory(Map<String, Object> sCategory);
	List<Map> reviewImg(Map<String, Object> id);
	List<Map> productList(Map<String, Object> category);
	List<Map> checkProduct(ArrayList<String> checkboxname);
	List<Map> filter(Map<String, Object> filter);
	List<Map> productDetail(String productno);
	List<Map> review(String productno);



//	진호
	List<Map> selectRooms(String type);
	List<Map> selectRoomsProduct(Map types);
	List<Map> roomsDetail(String type);
	List<Map> selectRoomsTitle(String type); 
	List<Map> listProduct(String type);
	String allProductList();
	List<Map> productCategory(Map texts);
	List<Map> sale();
	int insertRoom(Map<String, Object> room);
	List<Map> roomChange();
	int updateRoom(Map rooms);
	int roomsTitle(Map titles);
	 List<Map> buttomProduct(Map ty); 
	int deleteRoom(Map room); 
	List <Map> delectSelectRoom();
	int delectShowroom( String deleteRoom);
	

}
