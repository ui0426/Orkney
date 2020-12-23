<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


    
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="리뷰작성"/>
</jsp:include>
<style>
h1, h3{margin : 0;}
.review-container-content{
	margin: 1.5rem 1rem 3rem 1rem;
}
.review-container-inner{
	max-width: 656px;
	margin:0 auto;
}
.reviewform-title{
	text-align: center;
	font-weight: 700;
	font-size: 1.5rem;
	margin: 1rem 0px;
}
.review-sub-title{
	font-size: 1.125rem;
	font-weight: 700;
	margin-bottom: 1em;
}
@media(min-width: 769px){
	.review-small-container{
	    grid-template-columns: 25% 1fr;
	    display: grid;
	}
	.review-sub-title{
		margin-buttom: 0;
	}
}
/* @media(min-width: 1024px){
	
	.reviewform-title{
		font-size: 2.25rem;
	}
	
	.review-sub-title{
		font-size: 1.375rem;
		margin-left: 1em;
	}
	
} */
.review-small-container{
	margin: 0 .7em 0 1em;
}

.review-contents{
	margin-bottom: 1.5em;
}
.p-info{
	font-size: .8em;
}
.p-name{
	font-size: 1.3em;
}
.img-size{
    width: 10em;
    height: auto;
}

/* 별점 */
.star-input img{
	width:20px;
}
#startext{
	font-size: .75em;
    font-weight: 900;
}

/* 사진업로드 */
.review-file{
	position: relative;
    width: 93px;
    height: 93px;
}

/* 파일 필드 숨기기 */
.filebox input[type="file"] {  
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}
.file-container ul{
	margin: -5px;
    overflow: hidden;
}
.file-container ul li{
    float: left;
    margin: 5px;
}
.review-file label{
	display: block;
    box-sizing: border-box;
    height: 100%;
    padding-top: 24px;
    border: 1px solid #ddd;
    background: #fff;
    font-size: 13px;
    line-height: 17px;
    text-align: center;
    cursor: pointer;
    position: relative;
}
.review-file label:before{
	display: block;
    content: url("../resources/svg/camera-retro-solid.svg");
    background-position: -1046px -464px;
    width: 26px;
    height: 21px;
    margin: 0 auto 6px;
}
.none{
	display: none;
}

.btn-flex{
    display: flex;
    justify-content: center;
    position:absolute;
    z-index: 10;
    right: 0;
}
.reviewForm-btn{
	display: flex;
	justify-content: center;
}


</style>
<section class="review-container">
	<div class="review-container-content">
		<div class="review-container-inner">
			<div class="reviewTitle">
				<h1 class="reviewform-title">리뷰 작성</h1>				
			</div>
			<div class="part-line"><hr class="line-c"></div>
			<form name="reviewForm" id="reviewForm" action="${path }/review/reviewInsert.do" method="post" enctype="multipart/form-data">
				<div class="review-small-container">
					<h3 class="review-sub-title">상품</h3>
					<div class="media">
						<input type="hidden" name="order_detail_no" value="${review.order_detail_no }"/>
						<input type="hidden" name="product_no" value="${review.product_no }"/>
					  	<img class="d-flex mr-3 img-size" src="${path }/resources/images/product/${review.product_pic}" alt="상품 이미지">
						<div class="media-body p-info">
					    	<h5 class="mt-0 font-weight-bold p-name"><c:out value="${review.product_name }"/> </h5> 
					    	<c:out value="${review.small_category_content }"/>/<c:out value="${review.product_color }"/>&nbsp;&nbsp;<c:out value="${review.product_width }"/>*<c:out value="${review.product_height }"/>*<c:out value="${review.product_depth }"/>
					  	</div> 
					</div>
				</div>
				<div class="part-line"><hr class="line-c"></div>
				<div>
					<div class="review-small-container review-contents">
						<div><h3 class="review-sub-title">별점</h3></div>
						<div>
							<span class="star-input">
								<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="${path }/resources/svg/star-0.svg"/>	
							</span>	
							<span id="startext"></span>
							<input id="grade" type="hidden" name="product_grade">			
						</div>
					</div>
					<div class="review-small-container review-contents">
						<div><h3 class="review-sub-title">리뷰</h3></div>
						<div class="form-group shadow-textarea">
						  <textarea name="review_content" class="form-control z-depth-1" id="exampleFormControlTextarea6" rows="3" placeholder="자세한 리뷰는 고객의 구매에 많은 도움이 됩니다."></textarea>
						</div>
					</div>
					<div class="review-small-container review-contents">
						<div><h3 class="review-sub-title">사진 첨부</h3></div>
						<div class="file-container">
							<ul id="file-list">
								<li>
									<div id="img-box1" class="filebox review-file">
										<label id="upload-label1">
											<span id="file1">사진 업로드</span>
											<input type="file" id="img_input1" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
									<div id="preview" class="none">
										<div class="btn-flex" onclick="deletePreview(this, 1)">
											<svg style="color:#615d5d;" aria-hidden="true" width="20px" height="20px" focusable="false" data-prefix="far" data-icon="times-circle" class="svg-inline--fa fa-times-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm101.8-262.2L295.6 256l62.2 62.2c4.7 4.7 4.7 12.3 0 17l-22.6 22.6c-4.7 4.7-12.3 4.7-17 0L256 295.6l-62.2 62.2c-4.7 4.7-12.3 4.7-17 0l-22.6-22.6c-4.7-4.7-4.7-12.3 0-17l62.2-62.2-62.2-62.2c-4.7-4.7-4.7-12.3 0-17l22.6-22.6c4.7-4.7 12.3-4.7 17 0l62.2 62.2 62.2-62.2c4.7-4.7 12.3-4.7 17 0l22.6 22.6c4.7 4.7 4.7 12.3 0 17z"></path></svg>
										</div>
									</div>
									
								</li>
								<li>
									<div></div>
									<div id="img-box2" class="filebox review-file">
										<label id="upload-label2">
											<span id="file2">사진 업로드</span>
											<input type="file" id="img_input2" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
									<div id="preview" class="none">
										<div class="btn-flex" onclick="deletePreview(this, 2)">
											<svg style="color:#615d5d;" aria-hidden="true" width="20px" height="20px" focusable="false" data-prefix="far" data-icon="times-circle" class="svg-inline--fa fa-times-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm101.8-262.2L295.6 256l62.2 62.2c4.7 4.7 4.7 12.3 0 17l-22.6 22.6c-4.7 4.7-12.3 4.7-17 0L256 295.6l-62.2 62.2c-4.7 4.7-12.3 4.7-17 0l-22.6-22.6c-4.7-4.7-4.7-12.3 0-17l62.2-62.2-62.2-62.2c-4.7-4.7-4.7-12.3 0-17l22.6-22.6c4.7-4.7 12.3-4.7 17 0l62.2 62.2 62.2-62.2c4.7-4.7 12.3-4.7 17 0l22.6 22.6c4.7 4.7 4.7 12.3 0 17z"></path></svg>
										</div>
									</div>
								</li>
								<li>
									<div></div>
									<div id="img-box3" class="filebox review-file">
										<label id="upload-label3">
											<span id="file3">사진 업로드</span>
											<input type="file" id="img_input3" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
									<div id="preview" class="none">
										<div class="btn-flex" onclick="deletePreview(this, 3)">
											<svg style="color:#615d5d;" aria-hidden="true" width="20px" height="20px" focusable="false" data-prefix="far" data-icon="times-circle" class="svg-inline--fa fa-times-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm101.8-262.2L295.6 256l62.2 62.2c4.7 4.7 4.7 12.3 0 17l-22.6 22.6c-4.7 4.7-12.3 4.7-17 0L256 295.6l-62.2 62.2c-4.7 4.7-12.3 4.7-17 0l-22.6-22.6c-4.7-4.7-4.7-12.3 0-17l62.2-62.2-62.2-62.2c-4.7-4.7-4.7-12.3 0-17l22.6-22.6c4.7-4.7 12.3-4.7 17 0l62.2 62.2 62.2-62.2c4.7-4.7 12.3-4.7 17 0l22.6 22.6c4.7 4.7 4.7 12.3 0 17z"></path></svg>
										</div>
									</div>
								</li> 
							</ul>
						</div>
					</div>
				</div>
				<div class="reviewForm-btn">
					<input type="submit" class="btn btn-primary" id="review-insert" value="등록하기">
				</div>
			</form>
		</div>
	</div>
</section>
<script> 

    //별점
    var locked = 0;
    var text = "";
    
    //별 위에 마우스 댔을 때
    function show(star){
    	if(locked>0) return false;
    	var i;
    	var image;
    	var el;
    	var e = document.getElementById('startext');
    	var stateMsg;
    	for(i = 1; i <= star; i++){
    		image = 'image' + i;
    		el = document.getElementById(image);
    		el.src = "${path}/resources/svg/star-1.svg";
    	}
    	switch(star){
    		case 1:
    			stateMsg = "매우 별로";
    			break;
    		case 2:
    			stateMsg = "별로";
    			break;
    		case 3:
    			stateMsg = "보통";
    			break;
    		case 4 :
    			stateMsg = "만족";
    			break;
    		case 5 :
    			stateMsg = "매우 만족";
    			break;
    		default:
    			stateMsg = "";
     	}
    	e.innerHTML = stateMsg;
    }
    
    //별에 올렸던 마우스를 치웠을 때
    function noshow(star){
    	var i;
    	var image;
    	var el;
    	var e = document.getElementById('startext');
	    	
    	if(locked > 0 ){
    		for(i=1; i<=locked; i++){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-1.svg";
	    	}
    		for(i=5; i>locked; i--){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-0.svg";
    		}
    		e.innerHTML = text;
    		return;
    	}else{
	    	for(i=1; i<=star; i++){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-0.svg";
	    	}
	    	e.innerHTML = text;
    	}
    }
    
    
    function lock(star){
    	show(star);
    	locked = star;
    }
    
    //클릭했을 때
    function mark(star){
    	console.log(${review.review_no});
    	lock(star);
    	for(i = 1; i <= star; i++){
    		image = 'image' + i;
    		el = document.getElementById(image);
    		el.src = "${path}/resources/svg/star-1.svg";
    	}
    	for(i = 5; i>star; i--){
    		image = 'image' + i;
    		el = document.getElementById(image);
    		el.src = "${path}/resources/svg/star-0.svg";
    	}
    	var e = document.getElementById('startext');
    	var stateMsg;
    	switch(star){
			case 1:
				stateMsg = "매우 별로";
				break;
			case 2:
				stateMsg = "별로";
				break;
			case 3:
				stateMsg = "보통";
				break;
			case 4 :
				stateMsg = "만족";
				break;
			case 5 :
				stateMsg = "매우 만족";
				break;
			default:
				stateMsg = "";
	 	}
		e.innerHTML = stateMsg;
		text = stateMsg;
    	console.log("선택"+star);
    	document.getElementById("grade").value=star;
    }
   
    	
    	

        //이미지 미리보기
        function handleFiles(file, name){
        	console.log(file);
        	console.log("파일경로 이름 확장명 : "+name);
        	console.log(name.length);
        	var _lastDot = name.lastIndexOf('.');//확장자 있는 자릿수
        	console.log(_lastDot);
        	var ext = name.substring(_lastDot, name.length);
        	console.log(ext);
        	ext = name.substring(_lastDot, name.length).toLowerCase();//소문자로 변경
        	console.log(ext);
        	console.log(ext.indexOf('.pdf'));
        	console.log(ext.indexOf('.jpg'));
        	console.log(ext.indexOf('.png'));
        	
        	if(ext.indexOf('.gif')>-1 || ext.indexOf('.png')>-1 || ext.indexOf('.jpg')>-1 || ext.indexOf('.jpeg')>-1){
        		console.log("이미지다");
        		console.log(file.closest("div"));
        		file.closest("div").setAttribute("class","none");//input태그 있는 div는 숨기기
        		
        		//const fileList = document.getElementsByTagName("ul");
               	//const list = document.createElement("li");
               	//document.getElementById("file-list").appendChild(list);
               	
               	
               	//const div = document.createElement("div");//미리보기 이미지 담을 div생성
               	//div.setAttribute("class","review-file");//input태그 있는 div랑 같은 사이즈 적용
                //list.appendChild(div);
               	//file.closest("li").appendChild(div);//각 li에 생성한 div넣기
               	//const div = file.closest('div');
                
                const img = document.createElement("img");
               	//div.appendChild(img);//생성한 div에 이미지 담기
               	//console.log("이건:"+d);
               	file.parentNode.parentNode.nextSibling.nextSibling.setAttribute("class","review-file");
               	console.log("이미지 넣을 div에 클래스 설정");
               	//d.setAttribute("class","review-file");
               	file.parentNode.parentNode.nextSibling.nextSibling.appendChild(img);
                img.src = URL.createObjectURL(file.files[0]);
                img.setAttribute("style","position:absolute; width:100%; height:100%;");
                console.log("이미지까지 무사히 들어옴");
                
                //img.setAttribute("max-height","100%");
                console.log(file.parentNode.parentNode.nextSibling.nextSibling.nextSibling);
                //file.nextSibling.setAttribute("class","btn-flex");
                console.log("버튼보임!!!!!!!!");
                console.log("========================여기까지 이미지 미리보기 끝=========================")
               
        	}else{
        		alert("이미지 아니다");
        	}
        };
        
      //이미지 삭제하기
       function deletePreview(btn, i){
    	  console.log(btn);
    	  console.log(i);
    	  var div = btn.parentNode;
    	  var img = btn.parentNode.lastChild; 
    	  console.log(div);
    	  img = img.parentNode.removeChild(img);//미리보기 이미지 태그는 완전히 제거
    	  console.log(img);
    	  
    	  div.setAttribute("class","none");//미리보기 이미지 담았던 div숨기기
    	  //var input = $("#img_input1").val();
    	  //console.log(input);
    	  
    	  //input.select();
    	  //document.review_img.select();
    	  //document.selection.clear();
    	  
    	  //document.getElementById('img_input1').value = '';
    	  img.value='';
    	  console.log("input비웠니");
    	  console.log(img.value);
    	  //document.getElementById("img-box1").innerHTML="<label id='upload-label1'><span id='file1'>사진 업로드</span><input type='file' id='img_input1' name='review_img' onchange='handleFiles(this, this.value)' accept='image/jpeg, image/jpg, image/png' /></label>"
    	  
    	  //btn.parentNode.parentNode.firstChild.setAttribute("class","filebox review-file");
    	  var box = "#img-box"+i;
    	  $(box).removeClass("none").addClass("filebox").addClass("review-file");
    	  console.log("다시 새로운 인풋");
    	  
    	  //document.getElementById("img-box1").parentNode.parentNode.setAttribute("class","review-file");
      }
        	
        	
      
      
      
        //최종 등록하기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        $("#review-insert").click(function() {
        		var rNo = ${review.review_no};
            	var star = $("#grade").val();
        		var content = $("#exampleFormControlTextarea6").val().trim();
        		console.log(content);
        		if(rNo != 0){
        			alert("이미 등록하였습니다.");
        			return false;
        		}
        		if(star == ""){
        			alert("별점입력해주세요");
        			return false;
        		};
        		if(content == ""){
        			alert("내용을 입력해주세요");
        			return false;
        		};
           		$("#reviewForm").submit();
           		//fileUpload();
           			/* var form = $("#reviewForm")[0];
        		var formData = new FormData(form);
        		var rNo = ${review.review_no };
        		var pGrade = $("#grade").val();
        		var rContent = $("#exampleFormControlTextarea6").val();
        		
        		formData.append("rNo",rNo);
        		formData.append("pGrade",pGrade);
        		formData.append("rContent",rContent);
        		
        		$.ajax({
        			type : 'post',
                    url : '${path }/review/reviewUpdateEnd.do',
                    data : formData,
                    processData : false,
                    contentType : false,
                    success : function(html) {
                        alert("파일 업로드하였습니다.");
                        opener.document.location.reload();

                		self.close();

                    },
                    error : function(error) {
                        alert("파일 업로드에 실패하였습니다.");
                        console.log(error);
                        console.log(error.status);
                    }
        		}) */
        })
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>