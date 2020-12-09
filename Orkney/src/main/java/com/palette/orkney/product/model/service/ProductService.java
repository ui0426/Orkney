package com.palette.orkney.product.model.service;

import java.util.List;
import java.util.Map;

public interface ProductService {

//	경록
	List<Map> productList();
	List<Map> filter(Map<String, Object> filter);
	List<Map> lowPriceFilter();
	List<Map> highPriceFilter();
	List<Map> newProductFilter();
	List<Map> nameFilter();


//	진호
	List<Map> selectRooms(String type);
	List<Map> selectRoomsProduct(String type);
	List<Map> roomsDetail(String type);
	List<Map> selectRoomsTitle(String type); 
	List<Map> listProduct(String type);
	String allProductList();
	List<Map> productCategory(Map texts);
	List<Map> sale();



}
