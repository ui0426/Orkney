package com.palette.orkney.product.controller;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.product.model.service.ProductService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class ProductController {

   

   @Autowired
   private ProductService service;


   

   @RequestMapping("/product/products.do")
   public ModelAndView products(ModelAndView mv
         ,@RequestParam(name="category") String bigCategory
         ,@RequestParam(value="search-input") String search 
         ,@RequestParam(name="sale") String sale
         ) {
	   
//	Map<String, Object> category = new HashMap();
//      category.put("category", bigCategory);
//      category.put("search", search);
//      category.put("sale",sale);
//      System.out.println("세일나와~!!!1"+service.productList(category));
//      mv.addObject("list",service.productList(category));
      mv.setViewName("product/products");
      return mv;
   }

//   ▼인기순 정렬▼  <전체 정렬>로 변경함
   @RequestMapping("/product/bestFilter.do")
   @ResponseBody
   public  List<Map>Filter (@RequestParam Map<String,Object> filter) {

      return service.filter(filter);
   }
   
   @RequestMapping("/product/sCategory/.do")
   @ResponseBody
   public  List<Map>sCategory (@RequestParam Map<String,Object> sCategory) {
      return service.sCategory(sCategory);
   }
   @RequestMapping("/product/reviewImg.do")
   @ResponseBody
   public List<Map>reviewImg(@RequestParam Map<String,Object> id){
      
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
   @RequestMapping("/product/average.do")
   @ResponseBody
   public List<Map> average(
         @RequestParam Map<String,Object> productno
         ){
      return service.average(productno);
   }
	//	===================================================================================

   //by진호-showroom 페이지 이동
	@RequestMapping("/product/rooms.do")
	public ModelAndView rooms(ModelAndView mv, @RequestParam String type) {
		Map types= new HashMap();
		types.put("type", type);
		mv.addObject("rooms", service.selectRooms(type));
		mv.addObject("roomsProduct", service.selectRoomsProduct(types));
		mv.addObject("roomsTitle", service.selectRoomsTitle(type));
		mv.setViewName("product/rooms");

		return mv;
	}
	 //by진호-showroom 사진 속 상품정보 가져오기
	@RequestMapping("/product/roomsDetail.do")
	@ResponseBody
	public List<Map> roomsDetail(String type) {
		return service.roomsDetail(type);
	}
	//by진호-showroom 스와이퍼  다시 전체 보기 상품정보 
	@RequestMapping("/product/backRoomsDetail.do")
	@ResponseBody
	public List<Map> backRoomsDetail(String type) {
		Map types= new HashMap();
		types.put("type", type);
		return service.selectRoomsProduct(types);
	}
	//by진호-main 페이지 인기순위 전체상품(페이지 로드시)  
	@RequestMapping("/product/listProduct.do")
	@ResponseBody
	public List<Map> listProduct(String type) {

		return service.listProduct(type);
	}
	//by진호-main 페이지 인기순위 전체상품 
	@RequestMapping("/product/allProductList.do")
	@ResponseBody
	public List<Map> allProductList(String text) {
		Map texts=new HashMap();
		texts.put("text", text);
		return service.allProductList(texts);
	}
	//by진호-main 페이지 인기순위 카테고리
	@RequestMapping("/product/productCategory.do")
	@ResponseBody
	public List<Map> productCategory(String text, String type) {

		Map texts = new HashMap();
		texts.put("text", text);
		texts.put("type", type);
		
		return service.productCategory(texts);
	}
	//by진호-sale 페이지 이동
	@RequestMapping("/product/sale.do")
	public ModelAndView sale(ModelAndView mv) {
		mv.addObject("sale", service.sale());

		mv.setViewName("product/sale");
		return mv;
	}

	//by진호-sale기간이 끝나면 sale삭제(한달)
	@RequestMapping("/product/deleteSale.do")
	@ResponseBody public int deleteSale() {
		return service.deleteSale();
	};
	
}
	



