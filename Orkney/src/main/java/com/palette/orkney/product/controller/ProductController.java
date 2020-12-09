package com.palette.orkney.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.product.model.service.ProductService;

@Controller
public class ProductController {

	@Autowired()
	ProductService service;

	@RequestMapping("/product/products.do")
	public String product() {
		return "/product/products";
	}

	@RequestMapping("/product/productDetail.do")
	public String productDetail() {
		return "/product/productDetail";
	}

	@RequestMapping("/product/productsCompare.do")
	public String productsCompare() {
		return "/product/productsCompare";
	}

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
