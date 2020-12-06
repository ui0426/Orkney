package com.palette.orkney.product.model.service;

import java.util.List;
import java.util.Map;

public interface ProductService {
	
	List<Map> productList();
	List<Map> filter(Map<String, Object> filter);
	List<Map> lowPriceFilter();
	List<Map> highPriceFilter();
	List<Map> newProductFilter();
	List<Map> nameFilter();

}
