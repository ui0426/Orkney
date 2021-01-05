
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value="" />
</jsp:include>
<link rel="stylesheet"
   href="${path }/resources/css/product/products.css">
<link rel="stylesheet" href="${path}/resources/css/product/rooms.css">   
<script src="<c:url value="/js/egovframework/mbl/cmm/jquery-1.11.2.min.js" />"></script>
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



                  <style>
@media (max-width:700px) {
   #compare_btn{
       width: 458px;
       margin-left: 16px !important;
   }
   #check_clean_but{
       width: 458px !important;
       margin-left: 0rem !important;
   }

   }
    @media (max-width:1470px) { 
    #bottom_img_con{
       width: 100% !important;
       
    }

/* #compare_btn{ */
/*        width: 100%; */
/*        margin-left: 16px !important; */
/*    } */
/*    #check_clean_but{ */
/*        width: 100% !important; */
/*        margin-left: 0rem !important; */
/*    } */
    } 
   .plp-comparison-bar__image {
    width: 82px;
    max-height: 53px;
    margin-right: -17px;
}

                  </style>



<section id="content">




   

<!-- filter 정렬 ajax -->
<script type="text/javascript">

function clean_check() {
//    alert("체크 해제");
   $("#product_list").find('input').prop("checked", false); 
   $("#bottomIMG-Box").html("");
   checkBoxArr = [];
   $("#compare").find("#compare_count").text(checkBoxArr.length+"개 제품 선택 (2개 이상 제품 선택)");
   $("#compare_btn").attr("style","background-color:gray !important; border-radius: 80px; margin: auto; margin-right: 2rem;");
}

function check_PIC(e) {
   

var checkBoxArr = [];
$("input[name=checkboxname]:checked").each(function(i){
checkBoxArr.push($(this).val());
});

if (checkBoxArr.length > 1) {

   $("#compare_btn").attr("style","background-color:black !important; border-radius: 80px; margin: auto; margin-right: 2rem;");
    $("#compare_btn").attr('disabled',false);

}else {
   $("#compare_btn").attr("style","background-color:gray !important; border-radius: 80px; margin: auto; margin-right: 2rem;");
    $("#compare_btn").attr('disabled','disabled');
}


$("#bottomIMG-Box").html("");
for ( var i=0; i<checkBoxArr.length;i++){
   
   let picClone = $("#modarBottom_Pic").clone();

       $(picClone).attr("src","${path}/resources/images/product/"+checkBoxArr[i]);
      
      $("#compare").find("#compare_count").text(checkBoxArr.length+"개 제품 선택(2개 이상 제품 선택)");
     
     $("#bottomIMG-Box").append(picClone);

}

jQuery.noConflict();
$("#frameModalBottomSuccess").modal('show');
// alert(checkBoxArr);
}
</script>
<script type="text/javascript">
$(function() {
filter();   
})
// 더보기


// ★url 파라미터값을 가져올수 있게 하는 함수 
            function getParameterByName(name) {
                name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
                var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                        results = regex.exec(location.search);
                return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
            }

            $(function(){
               
            let category = getParameterByName('category');
            let sale = getParameterByName('sale');
            if (category=="all") {
            }
            if (sale=="sale") {
               $("#filterNone").css("display","none");
               $("#filterNone2").css("display","none");
               
            }
            $.ajax({
               url:"${path}/product/sCategory/.do",
               type:"get",
               async : false,
               data:{
                  "category":category,         
               },
               success:data=>{      
                  for (var i = 0; i < data.length; i++) {
                     let categoryClone = $("#categoryClone").clone();
                     $(categoryClone).find("#categoryCheck").attr("value",data[i]["SMALL_CATEGORY_CONTENT"]);
                     $(categoryClone).find("#categoryName").text(data[i]["SMALL_CATEGORY_CONTENT"]);
                     
                     $("#categoryMenu").append(categoryClone);      
                  }                                      
               }
            })   
         });
            
            function getFormatDate(date){
                var year = date.getFullYear();              //yyyy
                var month = (1 + date.getMonth());          //M
                month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
                var day = date.getDate();                   //d
                day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
                return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
            }
               let start = 17;

            function filter() {
            let sale=getParameterByName('sale');
               // 정렬
            let group1 =$('input[name="group1"]:checked').val();
            //사이즈
            let group2 = $('input[name="group2"]:checked').val();
            //카테고리
            let group3 =$('input[name="group3"]:checked').val();
            //가격
            let group4 = $('input[name="group4"]:checked').val();
            // 색상
            let group5 = $('input[name="group5"]:checked').val();
            let category = getParameterByName('category');
            let search = getParameterByName('search-input');
            



            $.ajax({
               url:"${path}/product/bestFilter.do",
               type:"get",
               async : false,
               data:{
                  "group1":group1,         
                  "group2":group2,         
                  "group3":group3,         
                  "group4":group4,         
                  "group5":group5,
                  "category":category,
                  "start":start,
                  "search":search,
                  "sale":sale
                  
               
               },
               success:data=>{
//                   alert(category);
               $("#product_list").html("");
                 
                  for ( var i=0;i <= data.length;i++){
                	  if (data[i]["PRODUCT_COLOR"]=="normal") {
                          
                          
                          var endDate = new Date(data[i]["PRODUCT_ENROLL_DATE"]);
                          endDate.setDate(endDate.getDate()+7);
                          endDate=getFormatDate(endDate);
                           var today = new Date();
                           today=getFormatDate(today)
                         let productClone = $("#products").clone().attr("id","products"+i);
                    if(today>endDate){
                       $(productClone).find(".rm-pb-et-new").text('');
                     }
                    if(data[i]["SALE_PER"]==data[i]["PRODUCT_PRICE"]){ //할인이 아닐때
                         $(productClone).find(".rm-pb-et-p").text('');
                         $(productClone).find("#pr").text('');
                         $(productClone).find(".ht-four").html("&#8361;"+numberWithCommas(data[i]["PRODUCT_PRICE"]));   
                     }else if(data[i]["SALE_PER"]!=data[i]["PRODUCT_PRICE"]){
                         $(productClone).find("#pr").html("&#8361;"+numberWithCommas(data[i]["PRODUCT_PRICE"]));
                         $(productClone).find(".ht-four").html("&#8361;"+numberWithCommas(data[i]["SALE_PER"])); 
                     }
                    $(productClone).find("#checkbox").val(data[i]["PRODUCT_PIC"]);
                    $(productClone).find("#productMainImg").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
                    $(productClone).find("#product_name").html(data[i]["PRODUCT_NAME"]);
                    $(productClone).find("#category").html(data[i]["BIG_CATEGORY_CONTENT"]);
                    $(productClone).find("#productA").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
                    $(productClone).find("#readMore").attr("onclick","location.href = \'${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]+"\'");
                    $(productClone).find("#btnck").attr("name",data[i]["PRODUCT_NO"]);
                    $(productClone).find("#btnck").attr("title",data[i]["PRODUCT_PRICE"]);
                    
                    $(productClone).find("#btnWish").attr("name",data[i]["PRODUCT_NO"]);
                    $(productClone).find("#btnWish").attr("title",data[i]["PRODUCT_PRICE"]);
                    $(productClone).find("#btnWish").attr("onclick","fn_addWishModal"+"("+"'"+data[i]["PRODUCT_PRICE"]+"'"+","+"'"+data[i]["PRODUCT_NO"]+"'"+");");
                    
                    $(productClone).find("#btnck").attr("onclick","fnbn"+"("+"'"+data[i]["PRODUCT_PRICE"]+"'"+","+"'"+data[i]["PRODUCT_NO"]+"'"+");");

//                   하는중
                    var productNo = data[i]["PRODUCT_NO"];
                    $.ajax({
                        url: "${path}/product/average.do",
                        async: false,
                        data:{
                           "productNo":productNo
                        },
                        success:data2=>{

                           for (var i = 0; i < data.length; i++) {
                              
                           
//                               console.log("데이터2"+data[i]["PRODUCT_NO"]);
                              if (data2[i]["COUNT(REVIEW_NO)"] !=null) {
                                 
                                  $(productClone).find("#average2").text(data2[i]["AVG(PRODUCT_GRADE)"].toFixed(1));
                                  $(productClone).find("#buynum2").text("("+data2[i]["COUNT(REVIEW_NO)"]+")");
                              }
                           if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) > 0 && data2[i]["AVG(PRODUCT_GRADE)"] < 1.5) {
                              
                              $(productClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray2").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray3").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
                           }else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 1.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 2.5) {
                              $(productClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray3").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
                           
                           }else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 2.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 3.5) {
                              $(productClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
                              $(productClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
                           
                           }else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 3.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 4.5) {
                                 
                              $(productClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray4").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
                           
                           }else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 4.5) {
                              $(productClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray4").removeClass("grey-text").addClass("blue-text");
                              $(productClone).find("#starGray5").removeClass("grey-text").addClass("blue-text");
                           }
                        }
                        }
                        
                     });
                   $("#product_list").append(productClone);
                     }
                  }
               }
            })   
            
          }
       function morebtn() {
    	   start = start+12;
    	   filter();
	}

//    3자리 마다 , 표시
   function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}



</script>

   <!-- Modal: 오른쪽 모달 -->

   
      <div class="modal fade right" id="modalPoll-1" tabindex="-1"
         role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div
            class="modal-dialog modal-full-height modal-right modal-notify modal-info"
            role="document">
            <div class="modal-content">
               <!--Header-->
               <div class="modal-header"
                  style="background-color: rgb(190, 190, 190);">
                  <p class="heading lead">
                     <strong>FILTER</strong>
                  </p>

                  <button type="button" class="close" data-dismiss="modal"
                     aria-label="Close">
                     <span aria-hidden="true" class="white-text">×</span>
                  </button>
               </div>

               <!--Body-->
               <div class="modal-body">
                  <div class="text-center">
                     <i class="fas fa-check fa-4x mb-3 animated rotateIn color-Gray1"></i>
                     <i class="fas fa-check fa-2x animated rotateIn color-Gray2"></i>
                     <i class="fas fa-check animated rotateIn color-Gray3"></i>
                     <H5>
                        <strong>CHECK</strong>
                     </H5>


                  </div>
                  <!--           ====================슬라이드 토글================ -->

                  <div class="">
                     <div class="row" id="filterNone">
                        <div class="btn-group col-12 row">
                           <button type="button" id="sort" class="btn  col-12 buttonColor"
                              data-toggle="dropdown" aria-expanded="false">
                              <div class="row filterBtn">
                                 <p class="fontborder">정렬</p>
                                 <span class="caret dropdown-toggle "></span>
                              </div>
                           </button>

                           <div id="sortMenu" style="display: none;" class="col-12">
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group1" type="radio" id="bestP" value="best" onclick="filter();" checked="checked">
                                    <label class="form-check-label fontborder " for="bestP" >인기제품</label>
                              </div>
                              
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group1" type="radio" id="sale" value="sale" onclick="filter();">
                                    <label class="form-check-label fontborder " for="sale" >더 낮은 새로운 가격</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group1" type="radio"
                                    id="lowP" value="lowPrice" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="lowP">낮은가격</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group1" type="radio"
                                    id="highP" value="highPrice" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="highP">높은가격</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group1" type="radio"
                                    id="newP" value="newProduct" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="newP">최신</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group1" type="radio"
                                    id="nameP" value="name" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="nameP">이름</label>
                              </div>
                           </div>

                        </div>
                     </div>


                     <div class="row">
                        <div class="btn-group col-12 row">
                           <button type="button" id="size" class="btn col-12"
                              data-toggle="dropdown" aria-expanded="false">
                              <div class="row filterBtn">
                                 <p class="fontborder">사이즈</p>
                                 <span class="caret dropdown-toggle "></span>
                              </div>
                           </button>

                           <div id="sizeMenu" style="display: none;"col-12"">

                              
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group2" type="radio" value="null" id="allSize"  onclick="filter();"> 
                                 <label   class="form-check-label fontborder " for="allSize">전체 사이즈</label>
                              </div>
                              
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group2" type="radio" id="60x120" value="40" onclick="filter();"> 
                                 <label   class="form-check-label fontborder " for="60x120">40cm</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="70x160" value="80" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="70x160">80cm</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="80x200" value="100" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="80x200">100cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="90x200" value="120" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="90x200">120cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="120x200" value="130" onclick="filter();"> 
                                    <label class="form-check-label fontborder" for="120x200">130cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="140x200" value="140" onclick="filter();"> 
                                    <label class="form-check-label fontborder" for="140x200">140cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="150" value="150" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="150">150cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="150x200" value="180" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="150x200">180cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="180x200" value="200" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="180x200">200cm</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group2" type="radio" id="207x99x182" value="230" onclick="filter();"> 
                                 <label class="form-check-label fontborder" for="207x99x182">230cm</label>
                              </div>
                           </div>

                        </div>
                     </div>
                     <div class="row" id="categoryNone">
                        <div class="btn-group col-12 row">
                           <button type="button" id="category" class="btn col-12"
                              data-toggle="dropdown" aria-expanded="false">
                              <div class="row filterBtn">
                                 <p class="fontborder">카테고리</p>
                                 <span class="caret dropdown-toggle "></span>
                              </div>
                           </button>

                           <div id="categoryMenu" style="display: none;"col-12">
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group3" type="radio" value="null" id="allCategory"  onclick="filter();"> 
                                 <label   class="form-check-label fontborder " for="allCategory">전체 선택</label>
                              </div>
                           <div style="display: none">
                              <div class="form-check mb-4" id="categoryClone">
                                 
                                 <label class="form-check-label fontborder">
                                 <input class="form-check-input " name="group3" type="radio" id="categoryCheck"  onclick="filter();">
                                    <strong id="categoryName"></strong>
                                 </label>
                              </div>
                           </div>
                           </div>

                        </div>
                     </div>
                     <div class="row">
                        <div class="btn-group col-12 row">
                           <button type="button" id="price" class="btn col-12"
                              data-toggle="dropdown" aria-expanded="false">
                              <div class="row filterBtn">
                                 <p class="fontborder">가격</p>
                                 <span class="caret dropdown-toggle "></span>
                              </div>
                           </button>
                           <div id="priceMenu" style="display: none;">
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group4" type="radio" value="null"
                                    id="allPrice"  onclick="filter();"> <label
                                    class="form-check-label fontborder " for="allPrice">전체가격</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input " name="group4" type="radio"
                                    id="Price1" value="39990" onclick="filter();"> <label
                                    class="form-check-label fontborder " for="Price1">₩0
                                    - 39,999</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group4" type="radio"
                                    id="Price2" value="49999" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="Price2">₩40,000
                                    - 49,999</label>
                              </div>

                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group4" type="radio"
                                    id="Price3" value="59999" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="Price3">₩50,000
                                    - 59,999</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group4" type="radio"
                                    id="Price4" value="69999" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="Price4">₩60,000
                                    - 69,999</label>
                              </div>
                              <div class="form-check mb-4">
                                 <input class="form-check-input" name="group4" type="radio"
                                    id="Price5" value="79999" onclick="filter();"> <label
                                    class="form-check-label fontborder" for="Price5">₩70,000+</label>
                              </div>
                           </div>

                        </div>
                     </div>
                     <div class="row">
                        <div class="btn-group col-12 row">
                           <button type="button" id="color" class="btn col-12"
                              data-toggle="dropdown" aria-expanded="false">
                              <div class="row filterBtn">
                                 <p class="fontborder">색상</p>
                                 <span class="caret dropdown-toggle "></span>
                              </div>
                           </button>
                           <div id="colorMenu" style="display: none;"col-12"">
                              <div class="btn-group row" data-toggle="buttons">

                                 <label class="btn btn-success col-12 leftMargin" style="background-color: white !important;"> 
                                    <span style="color: black;">전체 색상</spqn> 
                                    <input type="radio" name="group5" id="group5" autocomplete="off" value="null" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label class="btn btn-success col-12 leftMargin" style="background-color: white !important;"> 
                                    <span style="color: black;">화이트</spqn> 
                                    <input type="radio" name="group5" id="group5" autocomplete="off" value="white" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label class="btn btn-primary col-12 leftMargin" style="background-color: black !important;"> 
                                    <span style="color: white;">블랙</spqn>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="group5" id="option2" autocomplete="off" value="black" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label class="btn btn-info col-12 leftMargin" style="background-color: beige !important;"> 
                                    <span style="color: black;">베이지</spqn> 
                                    <input type="radio" name="group5" id="option2" autocomplete="off" value="beige" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label class="btn btn-default col-12 leftMargin" style="background-color: brown !important;"> 
                                    <span style="color: white;">브라운</spqn> 
                                    <input type="radio"   name="group5" id="option2" autocomplete="off" value="brown" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label   class="btn btn-warning col-12 leftMargin" style="background-color: gray !important;"> 
                                    <span style="color: white;">그레이</spqn> 
                                    <input type="radio" name="group5" id="option2" autocomplete="off" value="gray" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label> 
                                 <label class="btn btn-danger col-12 leftMargin" style="background-color: blue !important;"> 
                                    <span style="color: white;">블루</spqn>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="group5" id="option2" autocomplete="off" value="blue" onclick="filter();"> 
                                    <span class="glyphicon glyphicon-ok"></span>
                                 </label>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!--           ====================슬라이드 토글 end================ -->
               </div>

               <!--Footer-->
               <div class="modal-footer justify-content-center">

                  <a type="button"
                     class="btn btn-outline-primary waves-effect color-Gray1 fontSiz2"
                     style="border: 1px solid darkgray !important;"
                     data-dismiss="modal">확인</a>
               </div>
            </div>
         </div>
      </div>

   <!-- 모달 필터 -->




   <!-- 헤더 필터 (버튼) -->
   <div class="container">

      <div name="filter" class="row headerFilter"
         style="background-color: white;">
         <hr>
         <button type="button" id="filterNone2"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#modalPoll-1">
            <span class="fontborder fontColorGray">정렬</span>
         </button>
         <button type="button"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#frameModalBottomSuccess" onclick="checkbox_all()">
            <span class="fontborder fontColorGray">비교</span>
         </button>
         <button type="button"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#modalPoll-1">
            <span class="fontborder fontColorGray">사이즈</span>
         </button>
         <button type="button"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#modalPoll-1">
            <span class="fontborder fontColorGray">카테고리</span>
         </button>
         <button type="button"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#modalPoll-1">
            <span class="fontborder fontColorGray">가격</span>
         </button>
         <button type="button"
            class="btn round col-2 filterSiz col-md-1 btnH35"
            data-toggle="modal" data-target="#modalPoll-1">
            <span class="fontborder fontColorGray">색상</span>
         </button>
         <hr>
      </div>
      <!-- 헤더 필터 버튼 end -->



            <form action="${path}/product/productsCompare.do" method="get">
            
      <!-- 제품 목록 -->
      <div class="row row-cols-1 row-cols-md-3 row-cols-sm-2 row-cols-lg-4 " id="product_list">
      


      </div>
      <button type="button" class="btn filterSiz  btnH35 waves-effect waves-light" style="width: 100%; background-color: rgb(238, 237, 237);" onclick="morebtn();">
            <span class="fontborder fontColorGray">더보기</span>
         </button>
      <!-- 제품 목록 -->
<div id="removeProducts" style="display: none;">
            <div class="col products " id="products" onmouseover="checkbox_Over()" onmouseout="checkbox_Out()">


               <!-- Card -->
               <div class="card shadow-hidden" style="margin: 4px;">
                  <!--Card image-->
<div class="plp-checkbox" id="plp-checkbox"  onclick="check_PIC();">
<input type="checkbox" name="checkboxname" id="checkbox" black="true" value="${p.PRODUCT_PIC}">
</div>
                  <div class="view overlay zoom productSizing">
                  

                     <img class="card-img-top imgHeight" id="productMainImg"
                        src="${path}/resources/images/product/${p.PRODUCT_PIC}"
                        alt="Card image cap"> <a id="productA"
                        href="">
                        <div class="mask rgba-white-slight"></div>
                     </a>
                  </div>
                  <!--Card content-->
                  <div class="card-body" style="height:auto;">
                     <span class="rm-pb-et-new ">NEW</span>
                     <span class="rm-pb-et-p"> 더 낮은 새로운 가격</span>      
                     <!--Title-->
                     <h6 class="card-title event-product-name" id="product_name" >
                        <c:out value="${p.PRODUCT_NAME}" />
                     </h6>
                     <!--Text-->
                     <p class="card-text marginZero  ht-three" id="category">
                        <c:out value="${p.BIG_CATEGORY_NO }"></c:out>
                     </p>
                     <p class="card-text marginZero">
                     <div class="marginZero">
                        <div class="col row">
                           <div id="pr" class="event-price"></div>
                           
                        </div>
                        <div class="col row fontR" style="font-size: 14px;">                        
                           <div id="" class="ht-four product-price"></div>
                           
                        </div>
                     </div>
                     </p>



<!-- 하는중 -->
                     <div class="">
<!--                         별점  -->
                        <ul class="rating mb-2 row"  id="starnum">
<!--                            <li><i class="fas fa-star blue-text"></i></li> -->
<!--                            <li><i class="fas fa-star blue-text"></i></li> -->
<!--                            <li><i class="fas fa-star blue-text"></i></li> -->
<!--                            <li><i class="fas fa-star blue-text"></i></li> -->
<!--                               ★1점★ -->
<!--                            <li><i class="fas fa-star blue-text"></i></li> -->
<!--                               ★0점★ -->
                           <li><i id="starGray1" class="fas fa-star grey-text"></i></li>
                           <li><i id="starGray2" class="fas fa-star grey-text"></i></li>
                           <li><i id="starGray3" class="fas fa-star grey-text"></i></li>
                           <li><i id="starGray4" class="fas fa-star grey-text"></i></li>
                           <li><i id="starGray5" class="fas fa-star grey-text"></i></li>
                           
                           <p class="" id="average2"></p>
                           <p class="" id="buynum2"></p>
                        </ul>
                        
                        <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

                        <!-- Card footer -->
                  
                     </div>
                     <div>
                        <hr>
                        <div class="row">
                          <!--  <button type="button" class="btn  btn-md color-Gray1 " id="readMore"
                              style="border: 1px solid darkgray !important;" >Read
                              more</button> -->
                           <div class="row heartCart_icon" style="margin: auto;">
<a class="material-tooltip-main " data-placement="top" title="Add to Cart" id="btnck"  data-toggle="modal" data-target="#modalAbandonedCart"> <i class="fas fa-shopping-cart grey-text ml-3"></i></a> 
<a class="material-tooltip-main heart_icon" data-placement="top" title="Add to Wishlist" id="btnWish" data-toggle="modal" data-target="#modalAddWish"> <i class="fas fa-heart grey-text ml-3"></i></a>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- Card -->
               <hr>
            </div>
</div>
<!-- Modal: modalAbandonedCart-->
<div class="modal fade right" id="modalAbandonedCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <p class="heading">장바구니</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="row">
          <div class="col-3">                                   
          </div>
          <div class="col-9">
            <p>장바구니에 추가되었습니다.</p>
            <p>상품을 더 구매하시겠습니까??</p>          
        </div>
      </div>
      <!--Footer-->
      <div class="modal-footer justify-content-center">
        <a type="button" class="btn btn-info" onclick="location.href='${path}/cart/cart.do'" >장바구니로 가기</a>        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
</div>
<!-- Modal: modalAbandonedCart-->

<!-- Modal: modalAbandonedCart-->
<!-- <div class="modal fade right" id="modalAddWish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" -->
<!--   aria-hidden="true" data-backdrop="false"> -->
<!--   <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document"> -->
<!--     Content -->
<!--     <div class="modal-content" id="insertWish"> -->
<!--     </div> -->
    
    
<!--     /.Content -->
<!--   </div> -->
<!-- </div> -->

<!-- 위시리스트에 담기 모달 -->
<div class="wl-do-modal">
</div>
<!-- Modal: modalAbandonedCart-->         
            
<script>
function fn_addWishModal(price,pNo){

	$('.wl-do-modal').addClass('wl-do-modal-show');
	let login = '${sessionScope.login}';
	console.log(login);
// 	alert('dd');
	if(login == ''){
// 		let ck = confirm('로그인이 필요한 서비스 입니다. 로그인 화면으로 이동하시겠습니까?');
// 		console.log(ck);
// 		if(ck == true){
			location.href='${path}/member/memberLogin.do';
// 		}
		return;
	}
	
	$.ajax({
		type: 'post',
		url: '${ path }/wishlist/insertWishModal.do',
		data: {pNo:pNo},
		success: function(data){
			console.log(data);
			if(data == ''){
				
			}
			$('.wl-do-modal').html(data);
		}
		
	})
}

function fnbn(a,b){
    $.ajax({
      url:"${path }/cart/cartInsert.do",
      data:{
         productNo:b,
         productPrice:a
         },
      success:data=>{
//          console.log("나와라");               
      }
   })
 }     
</script>




<!-- 모달 필터  아래 모달 비교-->
   <div class="modal fade bottom" id="frameModalBottomSuccess"
      tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
      aria-hidden="true"   data-backdrop="false"  style=" pointer-events:none;" >
      <div
         class=" modal-frame modal-bottom modal-notify modal-success modal-dialog bottomSiz"
         role="document" id="modar_bottom" >
         <!--Content-->
         <div class="modal-content">
            <!--Body-->
            <div class="modal-body container" style="display: contents;">
               <div class="row px-4 jagan">
                     <a type="button"
                        class="btn btn-success waves-effect waves-light btnBol color-Gray1"
                        style="background-color: white !important;  border-radius: 80px; margin-left: 1.3rem; width: 144px; height: 50px;"
                         onclick="clean_check()" id="check_clean_but">선택해제
                     </a>
                     <div id="bottom_img_con" style="width: 59%">
                     
                     
                     
                        <div id="bottomIMG-BoxClone" style="display: none;" class="row" >
                        <img src=""class="plp-comparison-bar__image col" id="modarBottom_Pic">    
                        </div>
                        
                        <div id="bottomIMG-Box" class="col" style=" margin-top: 7px;overflow:auto;">
                        </div>
                  
                  
                     
                     </div>

                  <div class="row" id="compare">
                     <p style="margin-top: 1.7rem; margin-right: 1rem; margin-left: 1rem;"  id="compare_count"></p>

                     <button type="submit"
                        class="btn btn-success waves-effect waves-light btnBol text-white" id="compare_btn"
                        style="background-color: gray !important; margin: auto; margin-right: 2rem; border-radius: 80px;"
                         disabled="disabled"> 제품비교 <i
                        class="far fa-gem ml-1 text-white"></i>
                     </button>
                  </div>
               </div>
            </div>
         </div>
         <!--/.Content-->
      </div>
   </div>
            </form>




</div>




</section>


      <script>
//       @화면 로드시 체크박스 해제
      $(function(){
//       $('input[name="group1"]:checked').prop('checked', false);
      $('input[name="group2"]:checked').prop('checked', false);
      $('input[name="group3"]:checked').prop('checked', false);
      $('input[name="group4"]:checked').prop('checked', false);
      $('input[name="group5"]:checked').prop('checked', false);
      $('input[name="checkboxname"]:checked').prop('checked', false);
      });
      
         $(document).ready(function() {

            $('#sort').click(function() {
               $('#sortMenu').slideToggle();
            })
            $('#size').click(function() {
               $('#sizeMenu').slideToggle();
            })
            $('#category').click(function() {
               $('#categoryMenu').slideToggle();
            })
            $('#price').click(function() {
               $('#priceMenu').slideToggle();
            })
            $('#color').click(function() {
               $('#colorMenu').slideToggle();
            })

         })
      </script>
<!--       제품 체크박스 hover 이벤트  -->
      <script type="text/javascript">
      function checkbox_Over(e) {
         $(".plp-checkbox").css({"z-index": "1"});
         
      }
      function checkbox_Out(e) {
         $(".plp-checkbox").css("z-index", "0");
         
      }
      function checkbox_all() {
         $(".plp-checkbox").css("z-index", "1");
      }

       
      </script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />