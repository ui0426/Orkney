package com.palette.orkney.product.controller;

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
	@RequestMapping("/product/rooms.do")
	public ModelAndView rooms(ModelAndView mv,@RequestParam String type) {
		mv.addObject("rooms",service.selectRooms(type));
		System.out.println(service.selectRooms(type));
		 mv.addObject("roomsProduct",service.selectRoomsProduct()); 
			 mv.addObject("roomsTitle",service.selectRoomsTitle(type)); 
		mv.setViewName("product/rooms");
	
		return mv ;
	}
	  @RequestMapping("/product/roomsDetail.do")
	  @ResponseBody 
	  public List<Map> roomsDetail(String type) {
	 return service.roomsDetail(type); 
	  }
	  @RequestMapping("product/backRoomsDetail.do")
	  @ResponseBody
	  public List<Map> backRoomsDetail(){
		  return service.selectRoomsProduct();
	  }
	 
}
