    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<style>
.filebox label { 
	display: inline-block; 
	padding: .5em .75em; 
	color: #999; 
	font-size: inherit; 
	line-height: normal; 
	vertical-align: middle; 
	background-color: #fdfdfd; 
	cursor: pointer; 
	border: 1px solid #ebebeb; 
	border-bottom-color: #e2e2e2; 
	border-radius: .25em; 
} 
.filebox input[type="file"] { /* 파일 필드 숨기기 */
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
}
.filebox input[type="button"] {
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
}
.filebox label {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
}
.sizP{
	flex: 0 0 100% !important;
	max-width: 100% !important;
}

</style>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<div class="container mt-5">


  <!--Section: Content-->
  <section class="dark-grey-text">

  	<div class="card">
      <div class="card-body">

        <!--Grid row-->
        <div class="row">

          <!--Grid column-->
          <div class="col-lg-8 sizP">

            <!-- Pills panels -->
            <div class="tab-content pt-4">

              <!--Panel 1-->
              <div class="tab-pane fade in show active" id="tabCheckoutBilling123" role="tabpanel">

                <!--Card content-->
                <form name="productForm" id="productForm" action="${path }/damin/producUpdateIn.do" method="post" enctype="multipart/form-data">
				<div class="input-group mb-4">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">제품번호 :</span>
                    </div>
                    <input type="text" class="form-control py-0" name="productNo" id="productNo"  aria-describedby="basic-addon1"  value="${list[0].PRODUCT_NO }" required>
                  </div>
				
                
                  <div class="row">
                    <div class="col-md-6 mb-4">
	                    <!--제품명-->
	                    
	      
	                    
	                    <label for="productName" class="">제품명</label>
	                  	<input type="text" name="productName" id="productName" class="form-control mb-4" placeholder="PRODUCT NAME" value="${list[0].PRODUCT_NAME }" required>
                    </div>

                    <div class="col-md-6 mb-2">
                      <!--가격-->
	                    <label for="productPrice" class="">가격</label>
	                  	<input type="text" name="productPrice" id="productPrice" class="form-control mb-4" placeholder="PRODUCT PRICE"value="${list[0].PRODUCT_PRICE }" required>
                    </div>
                  </div>
               
				  <div class="row">
					<div class="col-lg-4 col-md-12 mb-4">
	                    <!--폭-->
	                    <label for="productWidth" class="">폭</label>
	                  	<input type="number" name="productWidth" id="productWidth" class="form-control mb-4" placeholder="cm" value="${list[0].PRODUCT_WIDTH }" required>
                    </div>
					<div class="col-lg-4 col-md-12 mb-4">
	                    <!--높이-->
	                    <label for="productHeight" class="">높이</label>
	                  	<input type="number" name="productHeight" id="productHeight" class="form-control mb-4" placeholder="cm" value="${list[0].PRODUCT_HEIGHT}" required>
                    </div>
					<div class="col-lg-4 col-md-12 mb-4">
	                    <!--깊이-->
	                    <label for="productDepth" class="">깊이</label>
	                  	<input type="number" name="productDepth" id="productDepth" class="form-control mb-4" placeholder="cm" value="${list[0].PRODUCT_DEPTH }" required>
                    </div>
                  </div>
				
				  <div class="row">

					<div class="col-lg-4 col-md-12 mb-4">
	                    <!--색상-->
	                    <label for="productColor" class="">색상</label>
<%-- 	                  	<input type="text" name="productColor" id="productColor" class="form-control mb-4" placeholder="COLOR(영문 소문자 입력)" value="${list.PRODUCT_COLOR }" required> --%>
                    	<select name="productColor" class="mdb-select colorful-select dropdown-info mb-4 form-control" id="productColor" required >
			                      <option value="no">색상선택</option>
			                      <option value="white">white</option>
			                      <option value="black">black</option>
			                      <option value="beige">beige</option>
			                      <option value="brown">brown</option>
			                      <option value="gray">gray</option>
			                      <option value="blue">blue</option>
			                      <option value="green">green</option>
			                      <option value="red">red</option>
			                      <option value="pink">pink</option>
			                      <option value="yellow">yellow</option>
			                      <option value="multicolor">multicolor</option>
			                      <option value="orange">orange</option>
			                      <option value="mint">mint</option>
			                      <option value="lilac">lilac</option>
			             </select>
                    </div>
                    
                    <div class="col-lg-4 col-md-12 mb-4">
                      <label for="productBigCategoryNo">카테고리</label>
                      <select class="custom-select d-block w-100" onchange="categoryBic();" name="productBigCategoryNo" id="productBigCategoryNo" value="${list[0].BIG_CATEGORY_NO }" required>
                        <option value="bc1">침대</option>
                        <option value="bc2">책장/선반유닛</option>
                        <option value="bc3">서랍</option>
                        <option value="bc4">의자</option>
                        <option value="bc5">바테이블/의자</option>
                        <option value="bc6">카페가구</option>
                        <option value="bc7">이동식선반</option>
                        <option value="bc8">옷장</option>
                        <option value="bc9">수납장/장식장</option>
                        <option value="bc10">거실장/찬장/콘솔테이블</option>
                        <option value="bc11">TV/멀티미디어가구</option>
                        <option value="bc12">소파/암체어</option>
                        <option value="bc13">조명</option>
                        <option value="bc14">식탁책상</option>
                      </select>
                      <div class="invalid-feedback">
                        Please select a valid country.
                      </div>
                    </div>
                    <div style="display: none"><option value="" id="sC"></option></div>
                    <div class="col-lg-4 col-md-12 mb-4">
                      <label for="productSmallCategoryNo">S카테고리</label>
                      <select class="custom-select d-block w-100" name="productSmallCategoryNo" id="productSmallCategoryNo" value="${list[0].SMALL_CATEGORY_NO }" required>
                        <option value="sc31">더블</option>
                        <option value="sc32">싱글</option>
                        <option value="sc33">수납장</option>
                        <option value="sc34">2층침대</option>
                        <option value="sc35">어린이</option>
                        <option value="sc36">유아</option>
                      </select>
                      <div class="invalid-feedback">
                        Please select a valid country.
                      </div>
                    </div>
                  </div>
            
				  
               
                  <div class="input-group mb-4">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="basic-addon1">재고</span>
                    </div>
                    <input type="number" class="form-control py-0" name="productStock" id="productStock" placeholder="재고 수량 " aria-describedby="basic-addon1" value="${list[0].PRODUCT_STOCK }" required>
                  </div>
                  
                  <label for="productInfo" class="">제품설명</label>
                  <textarea id="productInfo" placeholder="PRODUCT INFO" name="productInfo" class="form-control mb-4" rows="" cols="" required>${list[0].PRODUCT_INFO }</textarea>
              

               
				  <hr>
	              <!--Panel 2-->
	              <div class="tab-pane" id="tabCheckoutAddons123" >
				  
	
	                  <div class="col-md-7 mb-4">
	                    <h5 class="mb-3 h5">메인 이미지</h5>
	                    <select name="mainImg" class="mdb-select colorful-select dropdown-info" required>
	                      <option value="normal" selected>normal</option>
	                    </select>
	                  </div>
	                <div class="row">
	                  <div class="col-md-5 mb-4">

	                    <img src="${path}/resources/images/product/${i.PRODUCT_PIC}" class="img-fluid z-depth-1-half"
	                      alt="" id="mainImg">
	       
	                  </div>
	                  
	                  <div class="filebox"> 
		                    <label for="mainImgInput">사진업로드</label> 
		                  <input type="file" id="mainImgInput" name="productImg" required/> 
	                  </div>
<!-- 	                  <div class="filebox">  -->
<!-- 		                    <label for="x">x</label>  -->
<!-- 		                  <input type="button" id="x"/>  -->
<!-- 	                  </div> -->
	                </div>
	                
	                <hr class="mb-5">
	                <div class="row">
	                	<div class="col">
			                  <div class="col-md-7 mb-4">
			                    <h5 class="mb-3 h5">제품 이미지</h5>
			                    <select name="img1" class="mdb-select colorful-select dropdown-info" >
			                      <option value="" disabled>색상선택</option>
			                      <option value="white">white</option>
			                      <option value="black">black</option>
			                      <option value="beige">beige</option>
			                      <option value="brown">brown</option>
			                      <option value="gray">gray</option>
			                      <option value="blue">blue</option>
			                      <option value="green">green</option>
			                      <option value="red">red</option>
			                      <option value="pink">pink</option>
			                      <option value="yellow">yellow</option>
			                      <option value="multicolor">multicolor</option>
			                      <option value="orange">orange</option>
			                      <option value="mint">mint</option>
			                      <option value="lilac">lilac</option>
			                    </select>
			                  </div>
			                <div class="row review-file">
			                  <div class="col-md-5 mb-4">
			                    <img  class="img-fluid z-depth-1-half"
			                       id="image_section">
			                  </div>
			                  <div class="filebox"> 
				                    <label for="imgInput">사진업로드</label> 
				                  <input type="file" id="imgInput" name="productImg"/> 
			                  </div>
			                </div>
	                	</div>
	                	
	                	<div class="col">
			                  <div class="col-md-7 mb-4">
			                    <h5 class="mb-3 h5">제품 이미지</h5>
			                    <select name="img2" class="mdb-select colorful-select dropdown-info" >
			                      <option value="" disabled>색상선택</option>
			                      <option value="white">white</option>
			                      <option value="black">black</option>
			                      <option value="beige">beige</option>
			                      <option value="brown">brown</option>
			                      <option value="gray">gray</option>
			                      <option value="blue">blue</option>
			                      <option value="green">green</option>
			                      <option value="red">red</option>
			                      <option value="pink">pink</option>
			                      <option value="yellow">yellow</option>
			                      <option value="multicolor">multicolor</option>
			                      <option value="orange">orange</option>
			                      <option value="mint">mint</option>
			                      <option value="lilac">lilac</option>
			                    </select>
			                  </div>
			                <div class="row review-file">
			                  <div class="col-md-5 mb-4">
			                    <img  class="img-fluid z-depth-1-half"
			                       id="image_section2">
			                  </div>
			                  <div class="filebox"> 
				                    <label for="imgInput2">사진업로드</label> 
				                  <input type="file" id="imgInput2" name="productImg"/> 
			                  </div>
			                </div>
	                	</div>
	                	<div class="col">
			                  <div class="col-md-7 mb-4">
			                    <h5 class="mb-3 h5">제품 이미지</h5>
			                    <select name="img3" class="mdb-select colorful-select dropdown-info" >
			                      <option value="" disabled>색상선택</option>
			                      <option value="white">white</option>
			                      <option value="black">black</option>
			                      <option value="beige">beige</option>
			                      <option value="brown">brown</option>
			                      <option value="gray">gray</option>
			                      <option value="blue">blue</option>
			                      <option value="green">green</option>
			                      <option value="red">red</option>
			                      <option value="pink">pink</option>
			                      <option value="yellow">yellow</option>
			                      <option value="multicolor">multicolor</option>
			                      <option value="orange">orange</option>
			                      <option value="mint">mint</option>
			                      <option value="lilac">lilac</option>
			                    </select>
			                  </div>
			                <div class="row review-file">
			                  <div class="col-md-5 mb-4">
			                    <img  class="img-fluid z-depth-1-half"
			                       id="image_section3">
			                  </div>
			                  <div class="filebox"> 
				                    <label for="imgInput3">사진업로드</label> 
				                  <input type="file" id="imgInput3" name="productImg"/> 
			                  </div>
			                </div>
	                	</div>
	
	                </div>
					
			
					
	                <hr class="mb-4">
	
	                <button class="btn btn-primary btn-lg btn-block" type="submit">제품 수정</button>
	
	              </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


</div>
<script type="text/javascript">
	$(function() {
		<c:forEach items="${list}" var="r" varStatus="s" >
		if ("${s.index}"==0) {
			$("#mainImg").attr("src","${path}/resources/images/product/"+"${r.PRODUCT_PIC}");
		}
		if ("${s.index}"==1) {
			$("#image_section").attr("src","${path}/resources/images/product/"+"${r.PRODUCT_PIC}");
			
		}
		if ("${s.index}"==2) {
			$("#image_section1").attr("src","${path}/resources/images/product/"+"${r.PRODUCT_PIC}");
			
		}
		if ("${s.index}"==3) {
			$("#image_section2").attr("src","${path}/resources/images/product/"+"${r.PRODUCT_PIC}");
			
		}
		</c:forEach>
	})
	 
	// 이벤트를 바인딩해서 input에 파일이 올라올때 위의 함수를 this context로 실행합니다.
	$("#imgInput").change(function(){
	   readURL(this);
	   function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#image_section').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
	});
	$("#imgInput2").change(function(){
	   readURL(this);
	   function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#image_section2').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
	});
	$("#imgInput3").change(function(){
	   readURL(this);
	   function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#image_section3').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
	});
	$("#mainImgInput").change(function(){
	   readURL(this);
	   function readURL(input) {
			 if (input.files && input.files[0]) {
			  var reader = new FileReader();
			  
			  reader.onload = function (e) {
			   $('#mainImg').attr('src', e.target.result);  
			  }
			  
			  reader.readAsDataURL(input.files[0]);
			  }
			}
	});
	
// function insertAjax() {
// 	let productName = $("#productName").val();
// 	let productPrice = $("#productPrice").val();
// 	let productWidth = $("#productWidth").val();
// 	let productHeight = $("#productHeight").val();
// 	let productDepth = $("#productDepth").val();
// 	let productColor = $("#productColor").val();
// 	let bigCategoryNo = $("#bigCategoryNo").val();
// 	let sCategoryNo = $("#sCategoryNo").val();
// 	let sCategoryNo = $("#sCategoryNo").val();
// 	let productStock = $("#productStock").val();
// 	let info = $("#info").val();
	
// 	var formData = new FormData();

	
// 	alert(productName);
// }


//Material Select Initialization
$(document).ready(function() {
	$('.mdb-select').material_select();
});
</script>
<script type="text/javascript">
function categoryBic() {
               	
	let category=$("#productBigCategoryNo").val();
	$("#productSmallCategoryNo").html("");

	
	$.ajax({
		url:"${path}/admin/sCategoryList.do",
		data:{
			"category":category
		},
		success:data=>{
			
			for (var i = 0; i < data.length; i++) {
				let sCClone=$("#sC").clone();
				$(sCClone).attr("value",data[i]["SMALL_CATEGORY_NO"]);
				$(sCClone).text(data[i]["SMALL_CATEGORY_CONTENT"]);
				$("#productSmallCategoryNo").append(sCClone);
			}
		}
	});
}	
$("#productInfo").bind("keyup",function(){
//	 var re = /[~!@\#$%^&*\()\-\.\,\'"'\;=+_']/gi; 
	 var re = /[\n]/gi; 
//	 ("\n", "<br>");
	 var temp=$("#productInfo").val();

	 if(re.test(temp)){ //특수문자가 포함되면 삭제하여 값으로 다시셋팅

	 $("#productInfo").val(temp.replace(re,"")); } });                       
</script>
	<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>