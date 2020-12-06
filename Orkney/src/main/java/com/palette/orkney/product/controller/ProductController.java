package com.palette.orkney.product.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/product/products.do")
	@ResponseBody
	public ModelAndView products(ModelAndView mv) {
		mv.addObject("list",service.productList());
		mv.setViewName("product/products");
		return mv;
	}
//	▼인기순 정렬▼  추후 확인 바람 db 에서 어떻게 할지
	@RequestMapping("/product/bestFilter.do")
	@ResponseBody
	public  List<Map>Filter (@RequestParam Map<String,Object> filter) {
		System.out.println("나오냐고 !!!:"+filter);
//		Map filter = new HashMap();
//		filter.put("group1",group1);
//		filter.put("group2",group2);
//		filter.put("group3",group3);
//		filter.put("group4",group4);
//		filter.put("group5",group5);
	
		return service.filter(filter);
	}
//	▼낮은 가격순 정렬▼
	@RequestMapping("/product/lowPriceFilter.do")
	@ResponseBody
	public  List<Map>lowPriceFilter(@RequestParam(value = "group1") String group1){
		
		System.out.println("찍힘? :" +group1);
		return service.lowPriceFilter();
	}
//	▼높은 가격순 정렬▼
	@RequestMapping("/product/highPriceFilter.do")
	@ResponseBody
	public  List<Map>highPriceFilter(@RequestParam(value = "group1") String group1){
		
		System.out.println("찍힘? :" +group1);
		return service.highPriceFilter();
	}
//	▼최신순 정렬▼
	@RequestMapping("/product/newProductFilter.do")
	@ResponseBody
	public  List<Map>newProductFilter(@RequestParam(value = "group1") String group1){
		
		System.out.println("찍힘? :" +group1);
		return service.newProductFilter();
	}
//	▼이름순 정렬▼
	@RequestMapping("/product/nameFilter.do")
	@ResponseBody
	public  List<Map>nameFilter(@RequestParam(value = "group1") String group1){
		
		System.out.println("찍힘? :" +group1);
		return service.nameFilter();
	}
	
	
	
	@RequestMapping("/product/productDetail.do")
	public String productDetail() {
		return "/product/productDetail";
	}
	@RequestMapping("/product/productsCompare.do")
	public String productsCompare() {
		return "/product/productsCompare";
	}

}
