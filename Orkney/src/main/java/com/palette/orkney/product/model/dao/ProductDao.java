package com.palette.orkney.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ProductDao {

		List<Map> productList(SqlSession session);
		List<Map> filter(SqlSession session,Map<String, Object> filter);
		List<Map> lowPriceFilter(SqlSession session);
		List<Map> highPriceFilter(SqlSession session);
		List<Map> newProductFilter(SqlSession session);
		List<Map> nameFilter(SqlSession session);
}
