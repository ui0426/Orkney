<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


    
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="title" value="리뷰작성"/>
</jsp:include>
<link rel="stylesheet" href="${path }/resources/css/review/reviewForm.css"/>
<style>
.review-file label:before{
   display: block;
    content: url("../resources/svg/camera-retro-solid.svg");
    background-position: -1046px -464px;
    width: 26px;
    height: 21px;
    margin: 0 auto 6px;
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
                           <div id="preview1" class="none">
                              <div class="btn-flex" onclick="deletePreview(this, 1)">
                                 <svg style="color:#615d5d;" aria-hidden="true" width="20px" height="20px" focusable="false" data-prefix="far" data-icon="times-circle" class="svg-inline--fa fa-times-circle fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm101.8-262.2L295.6 256l62.2 62.2c4.7 4.7 4.7 12.3 0 17l-22.6 22.6c-4.7 4.7-12.3 4.7-17 0L256 295.6l-62.2 62.2c-4.7 4.7-12.3 4.7-17 0l-22.6-22.6c-4.7-4.7-4.7-12.3 0-17l62.2-62.2-62.2-62.2c-4.7-4.7-4.7-12.3 0-17l22.6-22.6c4.7-4.7 12.3-4.7 17 0l62.2 62.2 62.2-62.2c4.7-4.7 12.3-4.7 17 0l22.6 22.6c4.7 4.7 4.7 12.3 0 17z"></path></svg>
                              </div>
                           </div>
                        </li>
                        <li>
                           <div id="img-box2" class="filebox review-file">
                              <label id="upload-label2">
                                 <span id="file2">사진 업로드</span>
                                 <input type="file" id="img_input2" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
                              </label>
                           </div>
                           <div id="preview2" class="none">
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
                           <div id="preview3" class="none">
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
        function handleFiles(file, name){//매개변수로 input태그에 담기는 첨부파일과 파일경로~이름~확장명을 데리고 온다.
           console.log("파일경로 이름 확장명 : "+name);
           var _lastDot = name.lastIndexOf('.');//뒤에서부터 확장자까지의 자릿수
           var ext = name.substring(_lastDot, name.length);//여기까진 확장자 분리하기
           ext = name.substring(_lastDot, name.length).toLowerCase();//확장자 무조건 소문자로 변경
           
           //이미지 파일인지 확실하게 확인
           if(ext.indexOf('.gif')>-1 || ext.indexOf('.png')>-1 || ext.indexOf('.jpg')>-1 || ext.indexOf('.jpeg')>-1){
              file.closest("div").setAttribute("class","none");//input태그가 있는 div는 숨기기
              
                const img = document.createElement("img");
                file.parentNode.parentNode.nextSibling.nextSibling.setAttribute("class","review-file");
                //이미지 넣을 div에 클래스 설정
                file.parentNode.parentNode.nextSibling.nextSibling.appendChild(img);
                img.src = URL.createObjectURL(file.files[0]);
                img.setAttribute("style","position:absolute; width:100%; height:100%;");
                //input태그에 담은 이미지 img태그에 담기 성공
                
                //첨부파일 삭제 버튼보임
               	//========================여기까지 이미지 미리보기 끝=========================
               
           }else{
              alert("이미지 파일이 아니다");
           }
        };
        
      //미리보기 이미지 삭제하기
       function deletePreview(btn, i){//매개변수로 삭제버튼 자신과 id값에 해당하는 번호(총 3개의 첨부파일을 등록할 수 있도록 해둠)
         var div = btn.parentNode;//삭제버튼과 미리보기 이미지를 담고있는 div
         var img = btn.parentNode.lastChild; //이미지 태그
         img = img.parentNode.removeChild(img);//미리보기 이미지 태그는 완전히 제거
         div.setAttribute("class","none");//미리보기 이미지 담았던 div숨기기
         
         $(btn).parent().prev().find("input").val("");//근접요소 탐색으로 해당 input태그에 접근해 value값을 지운다
         $(btn).parent().prev().find("input").prop("type","text");//input태그의 타입을 한번 바꾸어 value값을 확실히 지운다
         $(btn).parent().prev().find("input").prop("type","file");//그리고 다시 파일을 첨부할 수 있도록 다시 타입을file로 바꾼다
        
         var box = "#img-box"+i;
         $(box).removeClass("none").addClass("filebox").addClass("review-file");//input태그의 부모태그 div를 다시 보이게 한다
         //다시 새로운 input 태그 생성
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
                 
        });
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>