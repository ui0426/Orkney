package com.palette.orkney.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	
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

}
