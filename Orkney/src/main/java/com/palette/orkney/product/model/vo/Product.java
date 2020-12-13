package com.palette.orkney.product.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {

   private String productNo;
   private String productName;
   private int productPrice;
   private String productColor;
   private String productWidth;
   private String productHeight;
   private String productDepth;
   private int productStock;
   private String productInfo;
   private Date productEnrolldate;
   private String productBigCategoryNo;
   private String productSmallCategoryNo;
   private String eventCode;
   private Product_image product_image;
   
}

