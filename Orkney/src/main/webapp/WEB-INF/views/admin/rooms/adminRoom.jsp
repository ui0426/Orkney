<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp" />
<link rel="stylesheet" href="${path}/resources/css/admin/order.css">
<link rel="stylesheet" href="${path}/resources/css/product/rooms.css">
<section>
   <div id="map-map">
      <div class="wrapper" style="margin-top: 40px; display: none;">
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
                                 <fmt:formatNumber type="currency" value="" />
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
      <div id="map-div">
         <div class="border-px">
            <form action="${path}/admin/insertRoom.do" id="form-one"
               method="post" enctype="multipart/form-data">
               <fieldset>
                  <h2 class="show-h2">SHOWROOM</h2>

                  <select id="roomsSelect" class="browser-default custom-select"
                     name="category" onchange="roomChange(this)">
                     <option value="침실">침실</option>
                     <option value="거실">거실</option>
                     <option value="홈오피스">홈오피스</option>
                     <option value="비지니스">비지니스</option>
                  </select> <select id="roomsSelectOne" class="browser-default custom-select"
                     name="category_no" onchange="selectChange(this)">
                     <option value="">자리선택</option>
                  </select> <input type="file" name="room_img"
                     class="btn btn-primary btn-sm " accept="image/*" id="imgInp"
                     onchange="fileChange()" /> <select id="select-lie"
                     name="select-a" class="browser-default custom-select"
                     onclick="getInputValue(this.value);">
                     <option id="nene">개수</option>
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                  </select>
                  <div id="img-div">
                     <h6 id="checkLable" class="show-h2"
                        style="display: inline-block;">쇼룸보기</h6>
                     <input type="checkbox" id="cbx" class="toggle"
                        style="display: none;" name="toggleInsert" value="추가"> <label
                        for="cbx" class="check"> <svg id="rm-svg" width="18px"
                           height="18px" viewBox="0 0 18 18">
                               <path
                              d="M1,9 L1,3.5 C1,2 2,1 3.5,1 L14.5,1 C16,1 17,2 17,3.5 L17,14.5 C17,16 16,17 14.5,17 L3.5,17 C2,17 1,16 1,14.5 L1,9 Z"></path>
                               <polyline points="1 9 7 14 15 4"></polyline>
                          </svg>
                     </label>
                     <!-- <input type="checkbox" class="toggle" name="toggleInsert"value="추가"> -->
                     <div class="top_lift_a " style="display: none">
                        <input type="hidden" class="rooms_top form-control"
                           name="rooms_top" placeholder="top"
                           onfocus="return isNumberKey(event)" /> <input type="hidden"
                           class="rooms_left form-control" name="rooms_left"
                           placeholder="left" onfocus="return isNumberKey(event)" /> <select
                           class="rooms_product  custom-select" name="rooms_product" />
                        <option id="option-product" value="상품번호:상품이름"
                           style="display: none;">상품번호:상품이름</option>
                        </select> <input type="checkbox"
                           class="btn btn-primary btn-sm rooms_change">
                     </div>
                  </div>
                  <!-- <input type="button" id="ghkrdls" class="btn btn-primary btn-sm "
                     onclick="getInputName();" value="확인하기"> -->
               </fieldset>

               <input type="submit" id="subitIn" class="btn btn-primary btn-sm "
                  value="submit">
            </form>
         </div>
         <div class="border-px">
            <h2 class="show-h2">SHOWROOM DELETE</h2>
            <form >
               <select id="deleteRoom" class="browser-default custom-select"
                  name="deleteRoom">

                  <option  class="opti-se" value="">상품없음</option>

               </select> 
               <input type="button" class="btn btn-primary btn-sm "
                  id="sub-delete" value="DELECT">
            </form>
         </div>
         <div class="border-px">
            <h2 class="show-h2">SHOWROOM TITLE</h2>
            <form action="${path}/admin/roomsTitle.do" method="post">
               <select id="roomsTitleSelect" class="custom-select"
                  name="roomsTitle">
                  <option value="침실">침실</option>
                  <option value="거실">거실</option>
                  <option value="홈오피스">홈오피스</option>
                  <option value="비지니스">비지니스</option>
               </select> <select id="roomsTitleSelect" class="custom-select"
                  name="roomsSubTitle">
                  <option value="top">top</option>
                  <option value="bottom">bottom</option>

               </select> <input type="text" class="form-control" id="roomsTitle"
                  name="title" placeholder="title">
               <textarea class="form-control" id="roomsContent" name="content"
                  placeholder="content" ows="5" cols="33"></textarea>

               <input type="submit" class="btn btn-primary btn-sm "
                  id="titleSubmit" value="submit">
            </form>
         </div>
      </div>

   </div>



</section>


<script>
	
	
	function getFormatDate(date){//신상품이면 NEW 문구 띄우는 기간정하는 로직
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	$('#sub-delete').click(function() {//선택한 쇼룸상품 지우기
		var deleteRoom=$("#deleteRoom").val();
		$.ajax({
			 url: '${path}/admin/delectShowroom.do', 
			 data: { 'deleteRoom': deleteRoom },   
			 type: 'post',                               
			 success: function(data){	
	
			    		$(".toggle[type=checkbox] ").prop("checked", false);
			    		$(".scdBox ").find("#foo").attr("src","${path}/resources/images/rooms/Burnt-in_timecode.jpg;");
			    		$(".rm").remove();
			    		$(".toggle[type=checkbox] ").prop("checked", true);
			    		ajaxAdmin();		    
			}	    	
		})		
	});
	
	$(".rooms_change").change(function(){//상품을 고르고 쇼륨 영역을 클릭하면 해당쇼룸에 상품이 구현되는 로직
		$(".scdBox").off();
		var val=$(this).val();
		var lie=$("#select-lie").val();
		
		if($("#inputProduct"+val+"").val()=='상품번호:상품이름'){
			$("#rooms_change"+val+"").prop("checked", false);	
			alert("(product)를  선택하셔야 합니다");	
		}
		
		for(let i=1;i<=lie;i++){
			if(i!=val){
				$("#rooms_change"+i+"").prop("checked", false);	
			
			}
	
    		if($("#rooms_change"+val+"").is(":checked")==true){
    			var test = $('.scdBox');
				test.click(function (event) {//클릭한 곳의 좌표를 구하는 로직
		   			x = event.pageX-$('.scdBox').offset().left-18;
		   			y = event.pageY-$('.scdBox').offset().top-18; 
		  			let tx=(x/test.width())*100;
		  			let ty=(y/test.height())*100;
		   			$("#inputTop"+val+"").val(ty);
		   			$("#inputLeft"+val+"").val(tx);
					getInputName();//쇼룸상품을 등록하는 input에 값을 넣으면 해당 쇼룸에 어떻게 들어가는지 보여주는 ajax를 실행
		   			$("#rm-bte"+val+"").attr("style","opacity:1 !important; visibility:visible !important;");//선택한 상품을 클릭한 좌표에 보여지게 한다 
		   			
		   			for(let t=1;t<=5;t++){
		    			if(t!=val){
	    					if($("#inputTop"+t+"").val()!=''&& $("#inputLeft"+t+"").val()!=''){//좌표를 입력받는 input의 값이 있으면
	    	 					$("#rm-bte"+t+"").css({"opacity":"1","visibility": "visible"});//다른상품이 선택되어도 출력한다
	    					}
	    				} 
		   			}
				})
    		} 
		}
	});
		//'쇼룸보기' 체크박스 체크 후 상품등록 input을 생성하는 select에서 개수를 정하면 체크박스 이름을 추가하기로 바꾸는 로직
	$("#cbx").change(function(){
		if( $("input:checkbox[name='toggleInsert']").is(":checked")==true && $("#select-lie").val()!='개수'&&$("#foo").val()==''){
			$("#checkLable").text('추가하기');
		}
	});
	//쇼룸상품을 지우는 input를 다른로직이 실행 후 처음 상태로 돌아오는 함수 
	function checkDelete(){
	 	$(".opti-select").text("");//
	 	$(".opti-select").addClass("opti-se");
	 	$(".opti-se").removeClass("opti-select");
		$(".opti-se").text("등록없음");
		$(".opti-se:not(:first)").remove();
	 }
	   //숫자 3자리마다 콤마를 찍어주는 함수
	function numberWithCommas(x) {
	   return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	   }

	$(document).ready(function() {
		$("#roomsSelect").trigger("change");//쇼룸을 고르는 select에 change이벤트를 강제로 발생  
		
		$("#roomsSelect,#roomsSelectOne").change(function(){//쇼룸을 고르는 select 값을 변경시 
			
			if( $("input:checkbox[name='toggleInsert']").is(":checked")==true){//쇼룸보기 체크박스가 체크가 되어 있으면 
				checkDelete();//쇼룸상품을 지우는 input를 다른로직이 실행 후 처음 상태로 돌아오는 함수 를 실행
				$(".toggle[type=checkbox] ").prop("checked", false);//'쇼룸보기' 체크박스의 체크를 푼다
				$("#checkLable").text('쇼룸보기');// '쇼룸보기' 체크박스로 이름 변경
		 		$("#foo").attr("src","");//해당 쇼룸에 사진을 지운다
		 		$(".rm").remove();//쇼룸에 등록된 상품을 지운다
		 	}
			$(".opti-se:not(:first)").remove();//쇼룸상품을 지우는 input의 첫번째 option만 남기고 지운다
			$(".form-control").val('');//쇼룸의 좌표를 입력하는 input의 값을 지운다
			$(".rooms_change").prop("checked", false);//선택한 해당상품을 쇼룸에 등록하게 해주는  체크박스의 체크를 푼다 		
		})
		
		$(".toggle").change(function(){//쇼룸보기 체크박스 클릭시
			
			if($("#roomsSelectOne").val()=='자리선택'){ //쇼룸을 고르는 select의 값이 '자리선택'이면
				alert('자리선택을 하셔야 합니다');
				$(".toggle[type=checkbox] ").prop("checked", false);//'쇼룸보기' 체크박스의 체크를 푼다
				$("#checkLable").text('쇼룸보기');// '쇼룸보기' 체크박스로 이름 변경
			}
			$("#foo").attr("src","");//해당 쇼룸에 사진을 지운다
			ajaxAdmin();//'쇼룸보기'체크박스 클릭시 해당 쇼룸사진과 상품정보를 가져오는 ajax를 실행한다
		})
		
		$("#titleSubmit").click(function(){//쇼룸페이지 상단과 하단에 나오는 text를 입력하는 innput의 유효성 검사
			var str=$("#roomsTitle").val();//tatle를 입력하는 input에 값을 가져온다
			var strs=$("#roomsContent").val();//content를 입력하는 input에 값을 가져온다
			
			if( str == ""&&   strs == ""){
				alert('(title),(content)을 입력해 주세요');
				$(this).focus();
				return false;
			}else if(  str == ""&& strs != ""){
				alert('(title)을 입력해 주세요');
				$(this).focus();
				return false;
			}else  if(   strs == ""&& str != "" ){
				alert('(content)을 입력해 주세요');
				$(this).focus();
				return false;
			}
		}) 
    	
		$('#form-one').submit(function() {//쇼룸을 등록하는 버튼을 누르면
    	
  			if($('#imgInp').val()==''&& $("input:checkbox[name='toggleInsert']").is(":checked")==false){//이미지파일을 등록하는 input에 값이 없고  '쇼룸보기'체크박스가 클릭이 되어 있지 않으면
     			$("#imgInp").trigger("click");//이미지파일을 등록하는 input에 강제로 클릭이벤트발생 
            	return false;
    		}
    		var tib=$('.top_lift_b').length;//등록할 쇼룸 상품의 개수
    	 	
     		for(let i=1;i<=tib;i++){ //쇼룸 상품을 등록하는 input의 유효성 검사
         		if (!$(".top_lift_a").hasClass("rudfhr")) {
        			alert('(top,left,produst)를  입력하셔야 합니다');
            		return false;
        		}else  if ($('#inputTop'+i+'').val() == ''&&$('#inputLeft'+i+'').val() == ''&&$('#inputProduct'+i+'').val() != '상품번호:상품이름') {
        			alert('(top,left)을  입력하셔야 합니다');
            		return false;
        		}else if ($('#inputTop'+i+'').val() == '') {
        			alert('(top)을  입력하셔야 합니다');
            	return false;
        		}else if ($('#inputLeft'+i+'').val() == '') {
        			alert('(left)를  입력하셔야 합니다');
            		return false;
        		}else if ($('#inputProduct'+i+'').val() == '상품번호:상품이름') {
        			alert('(product)를  선택하셔야 합니다');
            		return false;
        		} 
         		for(let t=1;t<=tib;t++){ 
        			if(i!=t){
    		  			if($('#inputTop'+i+'').val() == $('#inputTop'+t+'').val() && $('#inputLeft'+i+'').val() == $('#inputLeft'+t+'').val()&&$('#inputTop'+t+'').val() !='' && $('#inputLeft'+t+'').val() !=''&& $('#inputProduct'+i+'').val() !='상품번호:상품이름'){
    		     			alert('(top,left)를 다르게 입력하셔야 합니다');
    		    			return false;
    					}  
    		    	}
        		}    	 
    	 	}
    	})
	}); 
	//'쇼룸보기'체크박스 클릭시 해당 쇼룸사진과 상품정보를 가져오는 ajax
	function ajaxAdmin() {
		var typeTo= $("#roomsSelectOne").val();
	 	checkDelete();
	
		$.ajax({
			url: '${path}/admin/selectAll.do', 
		    data: { 'typeTo': typeTo },     
		 	type: 'post',                             
		    async:false,  
		    success: function(data){
		   	
		    	if(data.length==''&&$("#roomsSelectOne").val()!='자리선택'){//해당 쇼룸자리에 상품이 등록되어 있지 않고 쇼룸을 고르는 select의 값이 선택되어있으면
		    		alert('해당 자리에 상품이 등록되어 있지 않습니다.');
		    		$(".toggle[type=checkbox] ").prop("checked", false);//'쇼룸보기'체크박스 체크해제
		    		$("#checkLable").text('쇼룸보기');//'쇼룸보기' 체크박스로 이름 변경
		    		$("#imgInp").val("");//사진 파일을 업로드 하는 input에 값을 앲앤다
		    		return false;
		    	}
		    	 $("#foo").attr("src","${path}/resources/images/rooms/" +data[0]["ROOM_PIC"]  ); 
		    
				 for(let t=0;t<data.length;t++){
				 	var endDate = new Date(data[t]["PRODUCT_ENROLL_DATE"]);
                    endDate.setDate(endDate.getDate()+7);
                    endDate=getFormatDate(endDate);//신상품의 NEW 문구를 띄우는 기간
                    var today = new Date();
                    today=getFormatDate(today)//오늘 날짜
					let cl=$(".rm-bt").clone(true);
				 	$(cl).removeClass("rm-bt");
					$(cl).addClass("rm-bts"+(t+1)+"");
					$(cl).addClass("rm");
					$(cl).attr("style", 'display:block; position: absolute;  top:'+((data[t]["ROOMS_TOP"]<94)?data[t]["ROOMS_TOP"]:94)+'%; left:'+((data[t]["ROOMS_LEFT"]<94)?data[t]["ROOMS_LEFT"]:94)+"%; ");//해당 쇼룸에 표기할 좌표를 넣는다
					$(cl).find(".rm-a").css({"opacity":"1","visibility": "visible"});
					$(cl).find(".rm-a").css({"border":" 2px solid red"});
					$(cl).find(".rm-a-a").attr("href","${path}/product/productDetail.do?productno="+data[t]["PRODUCT_NO"]);//상품정보 클릭시 상품상세페이지로 이동
					
					if(today>endDate){//오늘날짜보다 신상품의 NEW 문구를 띄우는 기간이 작으면 
				   		$(cl).find(".rm-pb-et-new").remove();//NEW문구를 없앤다
				    }
					$(cl).find(".rm-bt-name").html(data[t]["PRODUCT_NO"]+":"+data[t]["PRODUCT_NAME"]).attr("id","rm-bt-name"+t+"");//select에 상품번호:상품이름을 option에 넣는다
					$(cl).find(".rm-bt-sp").html(data[t]["PRODUCT_INFO"]);//상품설명을 보여준다
					
					if(data[t]["SALE_PER"]==data[t]["PRODUCT_PRICE"]){//할인을 등록하지 않으면  DB컬럼SALE_PER에 상품가격이 들어간다 컬럼 SALE_PER와 PRODUCT_PRICE가 같으면 할인이 들어간 상품이아니다
						$(cl).find(".rm-pb-et-p").remove();//'더 낮은 새로운 가격'이란 문구를 없앤다
						$(cl).find(".rm-remo").remove();//세일된 가격을 표시한 문구를 없앤다
						$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));//보통가격
					}else if(data[t]["SALE_PER"]!=data[t]["PRODUCT_PRICE"]){//컬럼 SALE_PER과 PRODUCT_PRICE가 같지 않은 것은 할인이 들어간 상품이다 
						$(cl).find(".rm-re-pr").remove();//상품가격을 표시한 문구를 없앤다
						$(cl).find(".rm-bt-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));//할인을 표현하기 위해 상품가격에 판매가 취소선을 적용한다
						$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["SALE_PER"])); //할인된 가격을 표시한 문구를 보여준다
					}
					$("#div-top-left").append(cl);
					
					let cc=$(".opti-se").clone();
			    	$(cc).removeClass("opti-se");
			    	$(cc).addClass("opti-select");
			    	$(cc).val(data[t]["PRODUCT_NO"]);
			    	$(cc).html(data[t]["PRODUCT_NO"]+' '+':'+' '+data[t]["PRODUCT_NAME"]);
			    	$("#deleteRoom").append(cc);//'쇼룸보기'체크박스 클릭시 해당 쇼룸사진과 상품정보를 가져오면 상품을 지우는 select에 '상품번호:상품이름'을 option에 넣는다
			 	}
				 	$(".opti-se").remove();
				 	$("#imgInp").val(''); 
			}  
		})
	};
	

	
	function fileChange(){//이미지파일 등록시 유효성검사
		var imgFile = $("#imgInp").val();
		var fileForm = /(.*?)\.(webp|jpg|jpeg|png|gif|bmp|pdf)$/;
		var maxSize = 20* 1024 * 1024;
		var fileSize;
		
		if($("#imgInp").val() == "") {	
     		$("#imgInp").focus(); 
    		return false;
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
		}
		
		if($("#foo").val()==''){
			checkDelete();
		}
	};

	$(".form-control").keyup( function(){//쇼룸상품등록 유효성검사
		inputClick();
	});
	
	$(".rooms_product").focusout( function(){//쇼룸상품등록 유효성검사
		inputClick();
	});
	
	function inputClick(){ //쇼룸상품등록 유효성검사
		var tib=$('.top_lift_b').length;
		var a=$('.rm').length;
		
		for(let i=1;i<=tib;i++){ 
	 		if($("#imgInp").val()==''&& $("input:checkbox[name='toggleInsert']").is(":checked")==false){//이미지파일을 등록하는 input의 값이 없고 '쇼룸보기'체크박스에 체크가 되어있지 않으면
  				$("#imgInp").trigger("click");//이미지 파일을 등록하는 창을 띄운다
				return false;
			}
			for(let t=1;t<=tib;t++){
	    		if(i!=t){
	      			if($('#inputTop'+i+'').val() == $('#inputTop'+t+'').val() && $('#inputLeft'+i+'').val() == $('#inputLeft'+t+'').val()&&$('#inputTop'+t+'').val() !='' && $('#inputLeft'+t+'').val() !=''&& $('#inputProduct'+i+'').val() !='상품번호:상품이름'){
   		     			alert('(top,left)를 다르게 입력하셔야 합니다');
	    		      	return false;
					} 
	 			}
	 		} 
		}
	
		if($(".inputTop").val()!='' && $(".inputLeft").val()!=''){//좌표 를 입력하는 input의 값이 하나라도 비어있지 않으면
			getInputName();
			return true
		}
	};
	// 쇼룸상품을 등록하는 input에 값을 넣으면 해당 쇼룸에 어떻게 들어가는지 보여주는 ajax (내용은'쇼룸보기'체크박스 클릭시 해당 쇼룸사진과 상품정보를 가져오는 ajax(ajaxAdmin())와 형식이 같다)
	function getInputName(){
		var type=new Array();
		
		for(let r=0;r<=5;r++){
			let th= $("#inputProduct"+r+"").val();
			type.push(th);
			
			type = type.filter(function(item) {
			return item !== null && item !== undefined && item !== '';
			})
		}
		$.ajax({
			url:'${path}/admin/buttomProduct.do',
			data: {'type': type},
			type: "post",
			async: false,  
			success: function(data){
				var top=new Array();
				var left=new Array();
	 			$(".rm").remove();
	 
				for(let i=0;i<$("input[name='productInput_top[]']").length;i++){
	 				top.push($("input[name='productInput_top[]']")[i].value);
	 				left.push($("input[name='productInput_left[]']")[i].value);
				}
			
				for(let t=0;t<data.length;t++){
					var endDate = new Date(data[t]["PRODUCT_ENROLL_DATE"]);
	              	endDate.setDate(endDate.getDate()+7);
	              	endDate=getFormatDate(endDate);
	               	var today = new Date();
	               	today=getFormatDate(today)
				 	let cl=$(".rm-bt").clone(true);
					$(cl).removeClass("rm-bt");
					$(cl).addClass("rm-bte");
					$(cl).addClass("rm");
					$(cl).attr("style", 'display:block; position: absolute;  top:'+((top[t]<94)?top[t]:94)+'%; left:'+((left[t]<94)?left[t]:94)+"%; ");
			   		/*$(cl).find(".rm-a").css({"opacity":"1","visibility": "visible"});    */   
					$(cl).find(".rm-a").attr("id","rm-bte"+(t+1)+"");
					
			   		if(today>endDate){
			    	   $(cl).find(".rm-pb-et-new").remove();
			    	 }
					$(cl).find(".rm-bt-name").html(data[t]["PRODUCT_NAME"]);
					$(cl).find(".rm-bt-sp").html(data[t]["PRODUCT_INFO"]);
					$(cl).find(".rm-a-a").attr("href","${path}/product/productDetail.do?productno="+data[t]["PRODUCT_NO"]);
					
					if(data[t]["SALE_PER"]==data[t]["PRODUCT_PRICE"]){
					$(cl).find(".rm-pb-et-p").remove();
					$(cl).find(".rm-remo").remove();
					$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));
					
					}else if(data[t]["SALE_PER"]!=data[t]["PRODUCT_PRICE"]){
					$(cl).find(".rm-re-pr").remove();
					$(cl).find(".rm-bt-price").html("&#8361;"+ numberWithCommas(data[t]["PRODUCT_PRICE"]));
					$(cl).find(".rm-bt-et-price").html("&#8361;"+ numberWithCommas(data[t]["SALE_PER"])); 
					}
					$("#div-top-left").append(cl);
				} 
			}
		})  
	
		if( $("input:checkbox[name='toggleInsert']").is(":checked")==true){//'쇼룸보기'체크박스 클릭시 해당 쇼룸사진과 상품정보를 가져오는 ajax를 불러와 해당 쇼룸 정보 위에 새로등록할 상품을 표시할 수 있다
			ajaxAdmin();
		}
	} 
	//상품등록을 하는 input,select를 만들고 상품정보를 select의 option에 담는 ajax
	function getInputValue(inputNo){
		
		if($(".rooms_change").is(":checked")==true && $(".rooms_top,.rooms_left").val!=''){
			$(".scdBox").off();	
		}
		
		if( $("input:checkbox[name='toggleInsert']").is(":checked")==true ){
			$("#checkLable").text('추가하기');
		}
		$.ajax({
			url: '${path}/admin/roomChange.do', 
		    type: 'post',                             
		    success: function(data){
		    	
		    	if($("#imgInp").val()==''&&$("input:checkbox[name='toggleInsert']").is(":checked")==false){
		    		alert("파일선택필수");
		    		$("#imgInp").trigger("click"); 
		    		return false
		    	}
		    	
		    	if(data.length<inputNo){
		    		alert("등록되지 않은 상품이"+inputNo+"개 미만 입니다 ");
		    		$(".top_lift_b").remove();
		    		return false
		    	}
		    	$(".option-product-two").remove();
		    	$("#nene").remove();
				$(".option-remove").remove();
		 		$(".top_lift_a").css("display","none"); 
				$(".top_lift_b").remove();
		 		$(".top_lift_a").addClass("rudfhr"); 
		
		 	for (var i=1; i <= inputNo; i++) {
				let a=$(".top_lift_a").clone(true);
				$(a).removeClass("top_lift_a");
				$(a).addClass("top_lift_b");
				$(a).addClass("rjatk"+i+"");
				$(a).css("display","block");
				$(a).find(".rooms_top").attr({name:"productInput_top[]",id:"inputTop"+i+""});//top의 좌표를 입력받는 input
				$(a).find(".rooms_left").attr({name:"productInput_left[]",id:"inputLeft"+i+""});//left의 좌표를 입력받는 input
				$(a).find(".form-control").css("display","none");
				$(a).find(".rooms_product").attr({name:"productInput_product[]",id:"inputProduct"+i+""});//등록할 상품을 고르는 select	
				$(a).find(".rooms_change").attr({value:""+i+"",id:"rooms_change"+i+""});		
				$("#img-div").append(a); 
			}
			
		 	for(let q=0;q<data.length;q++){
    			let c=$("#option-product").clone(true);
    			$(c).addClass("option-remove");
    			$(c).addClass("option-product-two"+q+"");
    			$(c).css("display","block");
    			$(c).val(data[q]["PRODUCT_NO"]);
    			$(c).addClass(data[q]["PRODUCT_NO"]+':'+data[q]["PRODUCT_NAME"]);
    			$(c).text(data[q]["PRODUCT_NO"]+':'+data[q]["PRODUCT_NAME"]);	
    			$(".rooms_product").append(c);//상품정보를 select의 option에 담는다
    		}
		 	for(let r=1;r<=inputNo;r++){
			 	
				 $("#inputProduct"+r+"").focusout(function(){//쇼룸 상품 등록 유효성 검사
					 let ew=$(".rooms_product").length;
					 let rm=$(".rm-bt-name").length;
					 
					 for(let t=0;t<rm;t++){
					 	 if($("#rm-bt-name"+t+"").text()==$("#inputProduct"+r+" option:selected").text()&&$("#inputProduct"+r+" option:selected").text()!=''){									
						 	alert("디지털 쇼룸과  중복된 상품번호 입니다");
						 	$(this).val('상품번호:상품이름');
						 	return false
						} 
					 }
					 for(let q=1;q<=inputNo;q++){
					 	if(r!=q){
							if( $("#inputProduct"+q+"").val()==$(this).val() && $(this).val()!='상품번호:상품이름'){	
								alert("중복된 상품번호 입니다");
								$(this).val('상품번호:상품이름');
								return false
							} 
					 	}
					 }		
					})
				}; 
			
			 controlNone();
		    }
		 })
	};
	
	function controlNone(){
		var form= $("#select-lie").val();
		for(let i=1;i<=form;i++){
			
			$("#inputProduct"+i+"").change(function(){
				if($("#inputProduct"+i+"").val()=='상품번호:상품이름'){
					$("#inputTop"+i+"").css("display","none");
					$("#inputLeft"+i+"").css("display","none");
				}else if($("#inputProduct"+i+"").val()!='상품번호:상품이름'){
					$("#inputTop"+i+"").css("display","block");
					$("#inputLeft"+i+"").css("display","block");
				}
			})
		}
	};
		
	function roomChange(e) {//쇼룸의 위치를  고르는 select중 첫번째 select를 고르면 두번째 select의 option이 나오는 함수
		var room_a = ["자리선택","침실1", "침실2", "침실3", "침실4","침실5"];
	  	var room_b = ["자리선택","거실1", "거실2", "거실3", "거실4","거실5"];
	  	var room_c = ["자리선택","홈오피스1", "홈오피스2", "홈오피스3", "홈오피스4", "홈오피스5"];
	 	var room_d = ["자리선택","비지니스1", "비지니스2", "비지니스3", "비지니스4", "비지니스5"];
	  	var target = $("#roomsSelectOne")[0];
	 	
	  	if(e.value == "침실"){ 
			var d = room_a;
	  	}else if(e.value == "거실"){ 
		  var d = room_b;
	  	}else if(e.value == "홈오피스"){
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

	/* $("#roomsSelectOne").on('focus',function(){
		$("#roomsSelectOne option:eq(0)").css("display","none");
	}); */

	function selectChange(e){ //현재 등록된 쇼룸을 불러오거나 새로운 쇼룸을 등록할때 보여주는 레이아웃을 구현하는 함수 
		$('h1').remove();
		$(".wrapper").css("display","grid");
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
					}
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
		}
	 };

	/* function isNumberKey(evt) {
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
	}  */
	
	function readURL(input) {//이미지파일을 등록하는 input의  값을 해당 레이아웃에 출력하게 해주는 함수
    	
		if (input.files && input.files[0]) {
        	var reader = new FileReader();
        	reader.onload = function(e) {
        	$('#foo').attr('src', e.target.result);
        	}
        	reader.readAsDataURL(input.files[0]);
        }
	};
	
	$("#imgInp").click(function() {//이미지파일을 등록하는 input을 클릭했을때 
		if($("#roomsSelectOne").val()=='자리선택'){//쇼룸의 위치를  고르는 select의 값이 없으면 
			alert('자리선택을 하셔야 합니다');
			return false;
		}
		fileChange();
	});
	
	$("#imgInp").change(function() {//이미지파일을 등록하는 input을 값이 바뀌었을때 이미지를 함수에 보내고 상풒을 등록하는 input,select를 초기화한다  
		readURL(this);//이미지를 함수로 보낸다
		$(".form-control").val('');
		$(".toggle[type=checkbox],.rooms_change  ").prop("checked", false);
		$(".room_top").val('');
		$(".room_left").val('');
		$("#checkLable").text('쇼룸보기');
		$(".rm").remove(); 
    	$('h1').remove(); 
    	
    	
	});
</script>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp" />