<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/product/rooms.css">
<section>
	<div>
		<form action="${path}/product/insertRoom.do" id="form-one"
			method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>insert</legend>
				<select id="roomsSelect" name="category" onchange="roomChange(this)">
					<option value="침실">침실</option>
					<option value="거실">거실</option>
					<option value="주방">주방</option>
					<option value="비지니스">비지니스</option>
				</select> <select id="roomsSelectOne" name="category_no"
					onchange="selectChange(this)">
					<option value="">자리선택</option>
				</select> <input type="file" name="room_img" accept="image/*" id="imgInp"
					onchange="fileChange()" /> <select name="select-a"
					onChange="getInputValue(this.value);">
					<option id="nene">개수</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				<div id="img-div">
					<div class="top_lift_a " style="display: none">
						<input type="text" class="rooms_top" name="rooms_top"
							placeholder="top" onkeypress="return isNumberKey(event)"
							onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" />
						<input type="text" class="rooms_left" name="rooms_left"
							placeholder="left" onkeypress="return isNumberKey(event)"
							onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');" />
						<select class="rooms_product" name="rooms_product" />
						<option id="option-product" value="상품번호" style="display: none;">상품번호</option>
						</select>
					</div>
				</div>
				<input type="button" onclick="getInputName();" value="확인하기">
			</fieldset>
			<input type="submit" id="subitIn" value="submit">
		</form>
		<form action="${path}/product/roomsTitle.do" method="post">
			<select id="roomsTitleSelect" name="roomsTitle">
				<option value="침실">침실</option>
				<option value="거실">거실</option>
				<option value="주방">주방</option>
				<option value="비지니스">비지니스</option>
			</select> <select id="roomsTitleSelect" name="roomsSubTitle">
				<option value="top">top</option>
				<option value="bottom">bottom</option>

			</select> <input type="text" id="roomsTitle" name="title" placeholder="title">
			<textarea id="roomsContent" name="content" placeholder="content"
				ows="5" cols="33"></textarea>

			<input type="submit" id="titleSubmit" value="title">
		</form>
		<div class="wrapper">
			<div class="rm-ig-box scdBox noneBox">
				<div id="div-top-left"
					style="position: relative; width: 100%; height: 100%">
					<img id="foo" class="img-bg" src=""
						onerror="this.src='${path}/resources/images/rooms/Burnt-in_timecode.jpg';" />
					<div class="rm-bt" style="display: none;">
						<a class="rm-a"></a>
						<div class="rm-pd-a rm-pd-cl"
							style="transform: translateX(-42%) translateY(-87%) translateY(-1.5rem);">
							<a class="rm-a-a" href="${path}">
								<div class="rm-pd-box">
									<div class="rm-pd-box-box">
										<span class="rm-pb-et-new">NEW</span> <span class="rm-pb-et-p">더
											낮은 새로운 가격</span>

										<div class="rm-bt-pb">
											<div class="rm-bt-name"></div>
											<div class="rm-bt-context">
												<span class="rm-bt-sp"></span>
											</div>
										</div>
									</div>
									<img class="rm-bt-ig"
										src="${path}/resources/images/rooms/KakaoTalk_20201120_194609.png">
								</div>

								<div class="rm-remo">
									<div>
										<div class="rm-bt-price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber  type="currency" value="" />
										</div>
									</div>
									<div>
										<div class="rm-bt-et-price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency" value="" />

										</div>
									</div>
								</div>


								<div class="rm-re-pr">
									<div class="rm-bt-et-price">
										<fmt:setLocale value="ko_KR" />
										<fmt:formatNumber type="currency" value="" />

									</div>
								</div>

							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>



function numberWithCommas(x) {
	   return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	
$(document).ready(function() {
	$(".rm-a").hover(function(){
		console.log('??????????????');
		$(this).find(".rm-pd-cl").css({"opacity": "1", "visibility": "visible","z-index": "1"});
	});
	$("#titleSubmit").submit(function(){
		if($("#roomsTitle").val()==''){
			alert('(title)을 입력해 주세요');
			$(this).focus();
			return false;
		}else if($("#roomsContent").val()==''){
			alert('(content)을 입력해 주세요');
			$(this).focus();
			return false;
		}
	}); 
    $('#form-one').submit(function() {
    	
  	 
     	if($('#imgInp').val()==''){
    		
        	alert('첨부파일은 필수!');
        	
            return false;
    	}
    	
    		
    	 for(let i=1;i<=5;i++){ 
         if (!$(".top_lift_a").hasClass("rudfhr")) {
        	console.log('submit','1');
        	alert('(top,left,produst)를  입력하셔야 합니다');
            return false;
        }else  if ($('#inputTop'+i+'').val() == '') {
        	console.log($('#inputTop'+i+'').val());
        	alert('(top)을  입력하셔야 합니다');
            return false;
        }else if ($('#inputLeft'+i+'').val() == '') {
        	console.log($('.top_lift_b').find('#inputLeft'+i+''));
        	alert('(left)를  입력하셔야 합니다');
            return false;
        }else if ($('#inputProduct'+i+'').val() == '상품번호') {
        	console.log($('.top_lift_b').find('#inputProduct'+i+''));
        	alert('(product)를  선택하셔야 합니다');
            return false;
        }
    	 }
    
    }); // end submit()
}); // end ready()
$("#imgInp").click(function(){
	if($("#roomsSelectOne").val()=='자리선택'){
		alert('자리선택을 하셔야 합니다');
		
		return false;
	}
	fileChange();
});
	
function fileChange(){
	
var imgFile = $("#imgInp").val();
var fileForm = /(.*?)\.(webp|jpg|jpeg|png|gif|bmp|pdf)$/;
var maxSize = 20* 1024 * 1024;
var fileSize;

if($("#imgInp").val() == "") {
	alert("첨부파일은 필수!");
    $("#imgInp").focus();
    return;
}


 

if(imgFile != "" && imgFile != null) {
	fileSize = document.getElementById("imgInp").files[0].size;
    
    if(!imgFile.match(fileForm)) {
    	alert("이미지 파일만 업로드 가능");
    	 $("#imgInp").val("");
        return;
    } else if(fileSize>maxSize) {
    	alert("파일 사이즈는20MB까지 가능");
    	 $("#imgInp").val("");
    	 return;
    }
};
};

		
function getInputName(){
	  for(let i=1;i<=5;i++){ 
	if ($('#inputProduct'+i+'').val() == '상품번호') {
    	console.log($('.top_lift_b').find('#inputProduct'+i+''));
    	alert('(product)를  선택하셔야 합니다');
        return false;
    }else if($("#imgInp").val()==''||$("#imgInp").val()==null){
		alert("첨부파일은 필수!!!!");
		return false;
	}else  if (!$(".top_lift_a").hasClass("rudfhr")) {
    	
    	alert('(top,left,produst)를  입력하셔야 합니다');
        return false;
    }
	 } 
	 for(let i=1;i<=5;i++){ 
         if (!$(".top_lift_a").hasClass("rudfhr")) {
        	console.log('submit','1');
        	alert('(top,left,produst)를  입력하셔야 합니다');
            return false;
        }else  if ($('#inputTop'+i+'').val() == '') {
        	console.log($('#inputTop'+i+'').val());
        	alert('(top)을  입력하셔야 합니다');
            return false;
        }else if ($('#inputLeft'+i+'').val() == '') {
        	console.log($('.top_lift_b').find('#inputLeft'+i+''));
        	alert('(left)를  입력하셔야 합니다');
            return false;
        }else if ($('#inputProduct'+i+'').val() == '상품번호') {
        	console.log($('.top_lift_b').find('#inputProduct'+i+''));
        	alert('(product)를  선택하셔야 합니다');
            return false;
        }
    	 }
	var type=new Array();
	for(let r=0;r<5;r++){
		let th= $("#inputProduct"+r+"").val();
			 type.push(th);
			 type = type.filter(function(item) {
		return item !== null && item !== undefined && item !== '';
				});
			};
			 console.log(type);
	$.ajax({
		
		url:'${path}/product/buttomProduct.do',
		data: {'type': type},
		type: "post",
		 async: false,
		success: function(data){
			console.log(data); 
			
	var top=new Array();
	var left=new Array();
	
	$(".rm-bts").remove();
	 
	for(let i=0;i<$("input[name='productInput_top[]']").length;i++){
	 top.push($("input[name='productInput_top[]']")[i].value);
	 left.push($("input[name='productInput_left[]']")[i].value);
	}
	 
		
		 for(let t=0;t<$("input[name='productInput_top[]']").length;t++){
			let cl=$(".rm-bt").clone();
			$(cl).removeClass("rm-bt");
			$(cl).addClass("rm-bts");
			$(cl).attr("style", 'display:block; position: absolute;  top:'+((top[t]>0.4)?top[t]:0.4)+'%; left:'+((left[t]<94)?left[t]:94)+"%; ");
			$(cl).find(".rm-a").css({"opacity":"1","visibility": "visible"});
			if(data[t]["SALE_PER"]==''||data[t]["SALE_PER"]==null){
				console.log('위');
			$(cl).find(".rm-pb-et-p").remove();
			}
			$(cl).find(".rm-bt-name").html(data[t]["PRODUCT_NAME"]);
			$(cl).find(".rm-bt-sp").html(data[t]["PRODUCT_INFO"]);
			if(data[t]["SALE_PER"]==''||data[t]["SALE_PER"]==null){
				console.log('한놈만');
			$(cl).find(".rm-remo").remove();
			$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));
			}else if(data[t]["SALE_PER"]!=''||data[t]["SALE_PER"]!=null){
				console.log('아래');
			$(cl).find(".rm-re-pr").remove();
			$(cl).find(".rm-bt-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));
			$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]*(data[t]["SALE_PER"]/100))); 
			
			}
			$("#div-top-left").append(cl);
		} 
			
			
	 
		}
	});  
} ;
	
	function getInputValue(inputNo){
		
		$.ajax({
			
		    url: '${path}/product/roomChange.do', 
		    type: 'post',                             
			
		    success: function(data){
		    	console.log(data);
		    	$(".option-product-two").remove();
		    	
		    	
		$("#nene").remove();
		$(".option-remove").remove();
		 $(".top_lift_a").css("display","none"); 
		$(".top_lift_b").remove();
		 $(".top_lift_a").addClass("rudfhr"); 
		for (var i=1; i <= inputNo; i++) {
		let a=$(".top_lift_a").clone();
		 $(a).css("display","block"); 
		$(a).removeClass("top_lift_a");
		$(a).addClass("top_lift_b");
		$(a).css("display","block");
		$(a).find(".rooms_top").attr({name:"productInput_top[]",id:"inputTop"+i+""});
		$(a).find(".rooms_left").attr({name:"productInput_left[]",id:"inputLeft"+i+""});
		$(a).find(".rooms_product").attr({name:"productInput_product[]",id:"inputProduct"+i+""});
		
		$("#img-div").append(a); 
		}
		for(let q=0;q<data.length;q++){
			console.log('왜또');
    		let c=$("#option-product").clone();
    		
    		$(c).addClass("option-remove");
    		$(c).addClass("option-product-two"+q+"");
    		$(c).css("display","block");
    		$(c).val(data[q]["PRODUCT_NO"]);
    		$(c).text(data[q]["PRODUCT_NO"]);
    		$(".rooms_product").append(c);
    	}
		 var dl=new Array();
		
			for(let r=0;r<5;r++){
			 $("#inputProduct"+r+"").focusout(function(){
				 let th=$(this).val();
					 dl.push(th);
					 var set = new Set(dl);
					 
					  console.log(set.size,'size');
					 console.log(dl.length,'length');
					 console.log(dl);
					 console.log(set); 
					
					if($(this).val()!='상품번호'&&dl.length!==set.size){
						alert("중복된 상품번호 입니다");
						 $(this).val('상품번호');
						 dl.splice(r-1);
					}
					 
					 				 });
			};
			
			
			 
			
			
				
			
			/*  let kd=$(this).parent().siblings().children('.rooms_product '); */
			
			 
					 
				
				
				 
			
			  
		
		    }
		 });
		};
		
	  $( document ).ready(function() {
	$("#roomsSelect").trigger("change"); 
	   /* roomChange(e);    */
	  
}); 

function roomChange(e) {
	
	var room_a = ["자리선택","침실1", "침실2", "침실3", "침실4","침실5"];
	  var room_b = ["자리선택","거실1", "거실2", "거실3", "거실4","거실5"];
	  var room_c = ["자리선택","주방1", "주방2", "주방3", "주방4", "주방5"];
	  var room_d = ["자리선택","비지니스1", "비지니스2", "비지니스3", "비지니스4", "비지니스5"];
	  var target = $("#roomsSelectOne")[0];
	 
	  if(e.value == "침실"){ 
		  var d = room_a;
	  }else if(e.value == "거실"){ 
		  var d = room_b;
	  }else if(e.value == "주방"){
		  var d = room_c;
	  }else if(e.value == "비지니스"){ 
		  var d = room_d;
	  
	  }
	  target.options.length = 0;
	 
	  for (x in d) {
	    var opt = document.createElement("option");
	    opt.value = d[x];
	    opt.innerHTML = d[x];
	    target.appendChild(opt);
	
   } 
	 
	 
};

	$("#roomsSelectOne").on('focus',function(){
		$("#roomsSelectOne option:eq(0)").css("display","none");

		
	});

	 function selectChange(e){
		 $('h1').remove();
		
		 var imgSrc = $("#foo").attr("src").trim();
		
		
		 $(".removeClass").remove();
		$(".noneBox").css("display","block");
		 var cla=['one','two','three','four','five'];
		var f=e.value;
		if(f.indexOf("1")>-1){ 
			 $(".rm-ig-box").removeClass("two three four five").addClass("one");
			  
			 $(".one").find("#div-top-left").append('<h1>이미지를 삽입해 주세요</h1>').css({"display":"flex","justify-content":"center","align-items":"center"});
			 if (imgSrc != "") {
				
				 $('h1').remove();
			 }
			 for(let i=0;i<5;i++){
			 let ce=$(".scdBox").clone();
			 $(ce).removeClass("scdBox");
			 $(ce).addClass("removeClass");
			 if(i!=0){
			 $(ce).addClass(cla[i]);
			 }else if(i==0){
				 $(ce).addClass("ddam");
				}
			 $(".ddam").css("display","none");
			  $(ce).removeClass("one"); 
			 $(ce).css("background-color","aliceblue");
			  $(ce).find("#foo").remove(); 
			  $(ce).find(".rm-bt").remove();
			   if($(ce).hasClass("two")){
				  $(ce).text('2');
			  }else if($(ce).hasClass("three")){
				  $(ce).text('3');
			  }else if($(ce).hasClass("four")){
				  $(ce).text('4');
			  }else if($(ce).hasClass("five")){
				  $(ce).text('5');
			  }
			 $(".wrapper").append(ce);
			 }
		  }else if(f.indexOf("2")>-1){ 
			  $(".rm-ig-box").removeClass("one three four five").addClass("two");
				 $(".two").find("#div-top-left").append('<h1>이미지를 삽입해 주세요</h1>').css({"display":"flex","justify-content":"center","align-items":"center"});
				/*  $("#div-top-left").find(h1).addClass("none-h1");		 */	 
				 if ( imgSrc != '') {
					
					 $('h1').remove();
				 }
				 for(let i=0;i<5;i++){
					 let ce=$(".scdBox").clone();
					 $(ce).removeClass("scdBox");
					 $(ce).addClass("removeClass");
					 if(i!=1){
					 $(ce).addClass(cla[i]);
					 }else if(i==1){
						 $(ce).addClass("ddam");
						
					 }
					 $(".ddam").css("display","none");
					  $(ce).removeClass("two"); 
					 $(ce).css("background-color","aliceblue");
					  $(ce).find("#foo").remove(); 
					  $(ce).find(".rm-bt").remove();
					  if($(ce).hasClass("one")){
						  $(ce).text('1');
					  }else if($(ce).hasClass("three")){
						  $(ce).text('3');
					  }else if($(ce).hasClass("four")){
						  $(ce).text('4');
					  }else if($(ce).hasClass("five")){
						  $(ce).text('5');
					  }
					 $(".wrapper").append(ce);
			  }
			 
		  }else if(f.indexOf("3")>-1){
			  $(".rm-ig-box").removeClass("one two four five").addClass("three");
				 $(".three").find("#div-top-left").append('<h1>이미지를 삽입해 주세요</h1>').css({"display":"flex","justify-content":"center","align-items":"center"});
				 if ( imgSrc != '') {
					
					 $('h1').remove();
				 }
				 for(let i=0;i<5;i++){
					 let ce=$(".scdBox").clone();
					 $(ce).removeClass("scdBox");
					 $(ce).addClass("removeClass");
					 if(i!=2){
					 $(ce).addClass(cla[i]);
					 }else if(i==2){
						 $(ce).addClass("ddam");
						
					 }
					 $(".ddam").css("display","none");
					  $(ce).removeClass("three");
					  $(ce).addClass("removeClass");
					 $(ce).css("background-color","aliceblue");
					  $(ce).find("#foo").remove(); 
					  $(ce).find(".rm-bt").remove();
					  if($(ce).hasClass("two")){
						  $(ce).text('2');
					  }else if($(ce).hasClass("one")){
						  $(ce).text('1');
					  }else if($(ce).hasClass("four")){
						  $(ce).text('4');
					  }else if($(ce).hasClass("five")){
						  $(ce).text('5');
					  }
					 $(".wrapper").append(ce);
					 }
			 
		  }else if(f.indexOf("4")>-1){ 
			  $(".rm-ig-box").removeClass("one two three five").addClass("four");
				 $(".four").find("#div-top-left").append('<h1>이미지를 삽입해 주세요</h1>').css({"display":"flex","justify-content":"center","align-items":"center"});
				 if (imgSrc != '') {
					 
					 $('h1').remove();
				 }
				 for(let i=0;i<5;i++){
					 let ce=$(".scdBox").clone();
					 $(ce).removeClass("scdBox");
					 $(ce).addClass("removeClass");
					 if(i!=3){
					 $(ce).addClass(cla[i]);
					 }else if(i==3){
						 $(ce).addClass("ddam");
						
					 }
					 $(".ddam").css("display","none");
					  $(ce).removeClass("four");
					  $(ce).addClass("removeClass");
					 $(ce).css("background-color","aliceblue");
					  $(ce).find("#foo").remove(); 
					  $(ce).find(".rm-bt").remove();
					  if($(ce).hasClass("two")){
						  $(ce).text('2');
					  }else if($(ce).hasClass("three")){
						  $(ce).text('3');
					  }else if($(ce).hasClass("one")){
						  $(ce).text('1');
					  }else if($(ce).hasClass("five")){
						  $(ce).text('5');
					  }
					 $(".wrapper").append(ce);
					 }
			  
		  }else if(f.indexOf("5")>-1){ 
			  $(".rm-ig-box").removeClass("one two three four").addClass("five");
				 $(".five").find("#div-top-left").append('<h1>이미지를 삽입해 주세요</h1>').css({"display":"flex","justify-content":"center","align-items":"center"});
				 if ( imgSrc != '') {
				
					 $('h1').remove();
				 }
				 for(let i=0;i<4;i++){
					 let ce=$(".scdBox").clone();
					 $(ce).removeClass("scdBox");
					 $(ce).addClass("removeClass");
					 if(i!=4){
					 $(ce).addClass(cla[i]);
					 }/*else  if(i==4){
						 $(ce).addClass("ddam");
					 }
					 $(".ddam").css("display","none"); */
					  $(ce).removeClass("five");
					  $(ce).addClass("removeClass");
					 $(ce).css("background-color","aliceblue");
					  $(ce).find("#foo").remove(); 
					  $(ce).find(".rm-bt").remove();
					  if($(ce).hasClass("two")){
						  $(ce).text('2');
					  }else if($(ce).hasClass("three")){
						  $(ce).text('3');
					  }else if($(ce).hasClass("one")){
						  $(ce).text('1');
					  }else if($(ce).hasClass("four")){
						  $(ce).text('4');
					  }
					  
					 $(".wrapper").append(ce);
			
		  
		}
	} ;
	
	 };

function isNumberKey(evt) {

    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)){

        return false;

    // Textbox value    
    }
    var _value = event.srcElement.value;    
	// 소수점(.)이 두번 이상 나오지 못하게

    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가

    if (_pattern0.test(_value)) {

        if (charCode == 46) {

            return false;

        }

    }
	// 1000 이하의 숫자만 입력가능

    var _pattern1 = /^\d{2}$/; // 현재 value값이 3자리 숫자이면 . 만 입력가능

    if (_pattern1.test(_value)) {

        if (charCode != 46) {

            alert("100 미만의 숫자만 입력가능합니다");

            return false;

        }

    }
    // 소수점 둘째자리까지만 입력가능

    var _pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가

    if (_pattern2.test(_value)) {

        alert("소수점 둘째자리까지만 입력가능합니다.");

        return false;
    }  
  return true;
}
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
        	 
        	$('#foo').attr('src', e.target.result);
        	
        }
        reader.readAsDataURL(input.files[0]);
       
    }
}

$("#imgInp").change(function() {
    readURL(this);
    
    $('h1').remove(); 
	
   /*  if(typeof tw != "undefined"){
    	console.log('어째서?');
    $("#div-top-left").find("#foo").css("display","block");
    }; */
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />