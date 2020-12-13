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
.star-list{
display:flex; }
.star{
	width:1em;
	height:1em;
}
.upload-btn{
	border-radius: 55px;
    padding: 1em;
}
.review-file{
	display: grid;
    grid-template-columns: 1fr 2fr;
}
.file-count{
	display:flex;
	align-items: center;
}
/* 파일 필드 숨기기 */
/* .filebox input[type="file"] {  position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; } */

.reviewForm-btn{
	display:flex;
	justify-content:center;
}


.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('../resources/img/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;/* padding:25px; */line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

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
								<span class="input">
							    	<input type="radio" name="star-input" value="1" id="p1">
							    	<label for="p1">1</label>
							    	<input type="radio" name="star-input" value="2" id="p2">
							    	<label for="p2">2</label>
							    	<input type="radio" name="star-input" value="3" id="p3">
							    	<label for="p3">3</label>
							    	<input type="radio" name="star-input" value="4" id="p4">
							    	<label for="p4">4</label>
							    	<input type="radio" name="star-input" value="5" id="p5">
							    	<label for="p5">5</label>
							  	</span>
							  	<output for="star-input"><b>0</b>점</output>
							  	<input id="grade" type="number" name="product_grade">			
							</span>	
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
						<div>
							<div class="filebox review-file">
								<div id="file1">
								<input type="file" id="review_img" name="review_img" accept="image/*" onchange="setThumbnail(event);"/> 
								</div>
							</div>
							<div id="image_container"></div> 
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
    var starRating = function(){
    	var $star = $(".star-input"),
    	    $result = $star.find("output>b");
    		
    	  	$(document).on("focusin", ".star-input>.input", function(){
    	   		 $(this).addClass("focus");
    	 	})
    	   	.on("focusout", ".star-input>.input", function(){
    	    	var $this = $(this);
    	    	setTimeout(function(){
    	      		if($this.find(":focus").length === 0){
    	       			$this.removeClass("focus");
    	     	 	}
    	   		}, 100);
    	 	 })
    	    .on("change", ".star-input :radio", function(){
    	     	$result.text($(this).next().text());
    	    	$('#grade').val($(this).next().text());//컨트롤러에 넘길 별점값...
    	  	})
    	    .on("mouseover", ".star-input label", function(){
    	    	$result.text($(this).text());
    	    })
    	    .on("mouseleave", ".star-input>.input", function(){
    	    	var $checked = $star.find(":checked");
    	    		if($checked.length === 0){
    	     	 		$result.text("0");
    	   		 	} else {
    	     	 		$result.text($checked.next().text());
    	     	 		console.log($checked.val());
    	    		}
    	  	});
    	};
    	starRating();
    	
    	

     	//업로드 한 이미지 미리보기
        function setThumbnail(event) { 

            // 파일 읽는 객체 생성
            var reader = new FileReader();
            
            // 파일이 올라갔을 시 발생할 이벤트 작성
            reader.onload = function(event) { //파일이 올라갔을 때
                
                var img = document.createElement("img"); //이미지 태그 생성
                img.setAttribute("src", event.target.result); //생성된 이미지태그에 src속성을 생성하고 input태그에 들어간 값(파일명)을 넣어서 이미지가 나오게한다
                img.setAttribute("width","100px");
                img.setAttribute("height","100px");
                document.querySelector("div#image_container").appendChild(img);
                
            };

            reader.readAsDataURL(event.target.files[0]);
        }; 
        
        $(document).ready(function() {
            $('#reviewForm').submit(function() {
            	var star = $("#grade").val();
        		var content = $("#exampleFormControlTextarea6").val().trim();
        		console.log(content);
        		if(star == ""){
        			alert("별점입력해주세요");
        			return false;
        		};
        		if(content == ""){
        			alert("내용을 입력해주세요");
        			return false;
        		};
            }); // end submit()
        }); // end ready()
    
		 
		
    	//등록하기 버튼 눌렀을 때 ajax처리 하고싶다...
     	/* $("#review-insert").click(e => {
    		var star = $("#grade").val();
    		var content = $("#exampleFormControlTextarea6").val().trim();
    		if(star == ""){
    			alert("별점입력해주세요");
    			return false;
    		};
    		if(content == ""){
    			alert("내용을 입력해주세요");
    			return false;
    		};
    		
    		$("#reviewForm").submit();
    		
    	}) */
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>