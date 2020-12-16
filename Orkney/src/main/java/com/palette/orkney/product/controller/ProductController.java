package com.palette.orkney.product.controller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView products(ModelAndView mv
			,@RequestParam(name="category") String bicCategory
			) {
		
		Map<String, Object> category = new HashMap();
		category.put("category", bicCategory);
		System.out.println(category);
		
		mv.addObject("list",service.productList(category));
		mv.setViewName("product/products");
		return mv;
	}

//	▼인기순 정렬▼  전체 정렬로 변경함
	@RequestMapping("/product/bestFilter.do")
	@ResponseBody
	public  List<Map>Filter (@RequestParam Map<String,Object> filter) {
		System.out.println(filter);
		return service.filter(filter);
	}
	
	@RequestMapping("/product/sCategory/.do")
	@ResponseBody
	public  List<Map>sCategory (@RequestParam Map<String,Object> sCategory) {
		System.out.println("카테고리 나와?"+sCategory);
		return service.sCategory(sCategory);
	}
	@RequestMapping("/product/reviewImg.do")
	@ResponseBody
	public List<Map>reviewImg(@RequestParam Map<String,Object> id){
		System.out.println("아이디:"+id+":"+service.reviewImg(id));
		
		return service.reviewImg(id);
	}

	@RequestMapping("/product/productDetail.do")
	public ModelAndView productDetail(ModelAndView mv,
									@RequestParam(name="productno") String productno
			) {
		mv.addObject("review",service.review(productno));
		mv.addObject("list", service.productDetail(productno));
		mv.setViewName("/product/productDetail");
		return mv;
	}

	@RequestMapping("/product/productsCompare.do")
	public ModelAndView productsCompare(ModelAndView mv,
			@RequestParam(name = "checkboxname")ArrayList<String> checkboxname) {

		mv.addObject("list",service.checkProduct(checkboxname));
		mv.setViewName("/product/productsCompare");
		return mv;

	}

	public String productsCompare() {
		return "/product/productsCompare";


	}
	
//	===================================================================================
	
	
	
	

	@RequestMapping("/product/rooms.do")
	public ModelAndView rooms(ModelAndView mv, @RequestParam String type) {
		mv.addObject("rooms", service.selectRooms(type));
		mv.addObject("roomsProduct", service.selectRoomsProduct(type));
		mv.addObject("roomsTitle", service.selectRoomsTitle(type));
		mv.setViewName("product/rooms");

		return mv;
	}

	@RequestMapping("/product/roomsDetail.do")
	@ResponseBody
	public List<Map> roomsDetail(String type) {
		return service.roomsDetail(type);
	}

	@RequestMapping("/product/backRoomsDetail.do")
	@ResponseBody
	public List<Map> backRoomsDetail(String type) {

		return service.selectRoomsProduct(type);
	}

	@RequestMapping("/product/listProduct.do")
	@ResponseBody
	public List<Map> listProduct(String type) {

		return service.listProduct(type);
	}

	@RequestMapping("/product/allProductList.do")
	@ResponseBody
	public String allProductList() {

		return service.allProductList();
	}

	@RequestMapping("/product/productCategory.do")
	@ResponseBody
	public List<Map> productCategory(String text, String type) {
		System.out.println(text);
		System.out.println(type);
		Map texts = new HashMap();
		texts.put("text", text);
		texts.put("type", type);

		return service.productCategory(texts);
	}

	@RequestMapping("/product/sale.do")
	public ModelAndView sale(ModelAndView mv) {
		mv.addObject("sale",service.sale());
		System.out.println(service.sale());
		mv.setViewName("product/sale");
		return mv;
	}
	
	
	/* @RequestMapping("/product/insertRoom.do") */
	 
	 
}
