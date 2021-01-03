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
   @ResponseBody
   @SuppressWarnings("unchecked")
   public ModelAndView products(ModelAndView mv
         ,@RequestParam(name="category") String bigCategory
         ,@RequestParam(value="search-input") String search 
         ,@RequestParam(name="sale") String sale
         ) {
	   
	Map<String, Object> category = new HashMap();
      category.put("category", bigCategory);
      category.put("search", search);
      category.put("sale",sale);
      System.out.println("세일나와~!!!1"+category);
      mv.addObject("list",service.productList(category));
      mv.setViewName("product/products");
      return mv;
   }

//   ▼인기순 정렬▼  전체 정렬로 변경함
   @RequestMapping("/product/bestFilter.do")
   @ResponseBody
   public  List<Map>Filter (@RequestParam Map<String,Object> filter) {
      System.out.println("필털:"+filter);
      System.out.println("나도 필터?"+service.filter(filter));

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
      System.out.println("리뷰img:"+id+":"+service.reviewImg(id));
      
      return service.reviewImg(id);
   }

   @RequestMapping("/product/productDetail.do")
   public ModelAndView productDetail(ModelAndView mv,
                           @RequestParam(name="productno") String productno
         ) {
	   System.out.println("디테일:"+service.productDetail(productno));
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
      System.out.println("제품번호:"+productno);
      System.out.println("댓글:"+service.average(productno));
      return service.average(productno);
   }
	//	===================================================================================


	@RequestMapping("/product/rooms.do")
	public ModelAndView rooms(ModelAndView mv, @RequestParam String type) {
		Map types= new HashMap();
		types.put("type", type);
		mv.addObject("rooms", service.selectRooms(type));
		
		mv.addObject("roomsProduct", service.selectRoomsProduct(types));
		System.out.println(service.selectRoomsProduct(types));
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
		Map types= new HashMap();
		types.put("type", type);
		return service.selectRoomsProduct(types);
	}

	@RequestMapping("/product/listProduct.do")
	@ResponseBody
	public List<Map> listProduct(String type) {

		return service.listProduct(type);
	}

	@RequestMapping("/product/allProductList.do")
	@ResponseBody
	public List<Map> allProductList(String text) {
		Map texts=new HashMap();
		texts.put("text", text);
		return service.allProductList(texts);
	}

	@RequestMapping("/product/productCategory.do")
	@ResponseBody
	public List<Map> productCategory(String text, String type) {

		Map texts = new HashMap();
		texts.put("text", text);
		texts.put("type", type);
		System.out.println(text);
		System.out.println(type);
		System.out.println(service.productCategory(texts));

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
		  return service.buttomProduct(ty); 
		  };
		  
	@RequestMapping("/product/deleteSale.do")
	@ResponseBody public int deleteSale() {
		return service.deleteSale();
	};
	
}
	



