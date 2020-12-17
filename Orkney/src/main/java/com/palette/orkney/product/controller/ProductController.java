package com.palette.orkney.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
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
	@ResponseBody
	public ModelAndView products(ModelAndView mv) {
		mv.addObject("list", service.productList());
		mv.setViewName("product/products");
		return mv;
	}

	//	▼인기순 정렬▼  추후 확인 바람 db 에서 어떻게 할지
	@RequestMapping("/product/bestFilter.do")
	@ResponseBody
	public List<Map> Filter(@RequestParam Map<String, Object> filter) {
		System.out.println("나오냐고 !!!:" + filter);
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
	public List<Map> lowPriceFilter(@RequestParam(value = "group1") String group1) {

		System.out.println("찍힘? :" + group1);
		return service.lowPriceFilter();
	}

	//	▼높은 가격순 정렬▼
	@RequestMapping("/product/highPriceFilter.do")
	@ResponseBody
	public List<Map> highPriceFilter(@RequestParam(value = "group1") String group1) {

		System.out.println("찍힘? :" + group1);
		return service.highPriceFilter();
	}

	//	▼최신순 정렬▼
	@RequestMapping("/product/newProductFilter.do")
	@ResponseBody
	public List<Map> newProductFilter(@RequestParam(value = "group1") String group1) {

		System.out.println("찍힘? :" + group1);
		return service.newProductFilter();
	}

	//	▼이름순 정렬▼
	@RequestMapping("/product/nameFilter.do")
	@ResponseBody
	public List<Map> nameFilter(@RequestParam(value = "group1") String group1) {

		System.out.println("찍힘? :" + group1);
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

	//	===================================================================================

	@RequestMapping("/product/rooms.do")
	public ModelAndView rooms(ModelAndView mv, @RequestParam String type) {
		mv.addObject("rooms", service.selectRooms(type));
		mv.addObject("roomsProduct", service.selectRoomsProduct(type));
		System.out.println(type);
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
		
		Map texts = new HashMap();
		texts.put("text", text);
		texts.put("type", type);

		return service.productCategory(texts);
	}

	@RequestMapping("/product/sale.do")
	public ModelAndView sale(ModelAndView mv) {
		mv.addObject("sale", service.sale());
		
		mv.setViewName("product/sale");
		return mv;
	}

	@RequestMapping("/product/insertRoom.do2")
	public String insertRoom2() {
		return "product/insertRoom";
	}

	@RequestMapping("/product/roomChange.do")
	@ResponseBody
	public List<Map> roomChange() {
		return service.roomChange();
	}

	@RequestMapping("/product/insertRoom.do")
	public ModelAndView insertRoom(ModelAndView mv, @RequestParam(value = "productInput_product[]", required = true) String[] rooms_product, @RequestParam(value = "productInput_top[]", required = true) String[] rooms_top, @RequestParam(value = "productInput_left[]", required = true) String[] rooms_left, @RequestParam String category, @RequestParam String category_no, @RequestParam(value = "room_img", required = false) MultipartFile multi, HttpSession session) {
		Map<String, Object> room = new HashMap<String, Object>();
		Map<String, Object> rooms = new HashMap<String, Object>(); 

		List one = new ArrayList();
		List two = new ArrayList();
		List three = new ArrayList();
		List four = new ArrayList();
		List five = new ArrayList();
		/*List rooms = new ArrayList();*/
		String[] categoryNo = new String[rooms_top.length];

		for (int i = 0; i < rooms_top.length; i++) {
			categoryNo[i] = category_no;

			if (i == 0) {
				one.add(rooms_product[i]);
				one.add(rooms_top[i]);
				one.add(rooms_left[i]);
				one.add(categoryNo[i]);
				System.out.println("1");
			} else if (i == 1) {
				
				two.add(rooms_product[i]);
				two.add(rooms_top[i]);
				two.add(rooms_left[i]);
				two.add(categoryNo[i]);
				System.out.println("2");
			} else if (i == 2) {
				
				three.add(rooms_product[i]);
				three.add(rooms_top[i]);
				three.add(rooms_left[i]);
				three.add(categoryNo[i]);
				System.out.println("3");
			} else if (i == 3) {
				
				four.add(rooms_product[i]);
				four.add(rooms_top[i]);
				four.add(rooms_left[i]);
				four.add(categoryNo[i]);
				System.out.println("4");
			} else if (i == 4) {
				System.out.println("5");
				five.add(rooms_product[i]);
				five.add(rooms_top[i]);
				five.add(rooms_left[i]);
				five.add(categoryNo[i]);
			}
		}
			System.out.println(rooms_top.length);
		
		if (rooms_top.length>=1) {
			System.out.println("11");
			rooms.put("one",one);
		}
		if (rooms_top.length>=2) {
			System.out.println("22");
			rooms.put("two",two);
		}
		if (rooms_top.length>=3) {
			System.out.println("33");
			rooms.put("three",three);
		}
		if (rooms_top.length>=4) {
			System.out.println("44");
			rooms.put("four",four);
		}
		if (rooms_top.length==5) {
			System.out.println("55");
			rooms.put("five",five);
		} ;

		room.put("categoryNo", category_no);
		room.put("category", category);
		String path = session.getServletContext().getRealPath("/resources/images/rooms");

		File dir = new File(path);

		if (!dir.exists())
			dir.mkdirs();

		if (!multi.isEmpty()) {
			String originalName = multi.getOriginalFilename();
			try {
				multi.transferTo(new File(path + "/" + originalName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			room.put("roomsImg", originalName);
			/* rooms.put("rooms_img", img); */
			System.out.println(rooms);
		}

		int result = service.insertRoom(room);
		int resultTwo = service.updateRoom(rooms);
		mv.setViewName("product/insertRoom");

		return mv;
	}
	
	@RequestMapping("/product/roomsTitle.do")									
	public ModelAndView roomsTitle(ModelAndView mv,@RequestParam String title, @RequestParam String content, @RequestParam String roomsTitle, @RequestParam String roomsSubTitle) {
		System.out.println(title);
		System.out.println(content);
		System.out.println(roomsTitle);
		System.out.println(roomsSubTitle);
		Map titles=new HashMap();
		titles.put("title",title );
		titles.put("content",content );
		titles.put("roomsTitle",roomsTitle );
		titles.put("roomsSubTitle",roomsSubTitle );
		int result=service.roomsTitle(titles);
		mv.setViewName("product/insetRoom");
		return mv;
	}

	
	  @RequestMapping("/product/buttomProduct.do")
	  
	  @ResponseBody public List<Map> buttomProduct(@RequestParam(value="type[]")String[] type){ 
		  Map ty=new HashMap(); 
		  ty.put("type", type); 
		  System.out.println(ty); 
		  return service.buttomProduct(ty); };
	

}
