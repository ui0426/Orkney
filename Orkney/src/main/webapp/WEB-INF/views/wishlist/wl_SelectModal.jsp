<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
   
        <div class="modal-content" id="wl-select-content">
            <div class="modal-title-box">
            <h2 class="modal-title">나의 리스트</h2>
            <button class="modal-closeBtn" onclick="fn_modalCloseBtn()"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg></button>
            </div>
            <ul class="modal-list">
               <c:forEach items="${ wlList }" var="wl">
               <div class="row-box">
                <li class="wishName"><input type="hidden" value="${ wl.wishlist_no }"><span onclick="fn_test(this);"><c:out value="${ wl.wishlist_name }"/></span><c:if test="${ wl.wishlist_detail.size() != 0 }"><sup class="list-count"><c:out value="${ wl.wishlist_detail.size() }"/></sup></c:if><button onclick="fn_wishPencil(this)" class="wish-pencil"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="pencil-alt" class="svg-inline--fa fa-pencil-alt fa-w-16" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path fill="currentColor" d="M497.9 142.1l-46.1 46.1c-4.7 4.7-12.3 4.7-17 0l-111-111c-4.7-4.7-4.7-12.3 0-17l46.1-46.1c18.7-18.7 49.1-18.7 67.9 0l60.1 60.1c18.8 18.7 18.8 49.1 0 67.9zM284.2 99.8L21.6 362.4.4 483.9c-2.9 16.4 11.4 30.6 27.8 27.8l121.5-21.3 262.6-262.6c4.7-4.7 4.7-12.3 0-17l-111-111c-4.8-4.7-12.4-4.7-17.1 0zM124.1 339.9c-5.5-5.5-5.5-14.3 0-19.8l154-154c5.5-5.5 14.3-5.5 19.8 0s5.5 14.3 0 19.8l-154 154c-5.5 5.5-14.3 5.5-19.8 0zM88 424h48v36.3l-64.5 11.3-31.1-31.1L51.7 376H88v48z"></path></svg></button><button class="wish-trash" onclick="fn_wishTrash(this)"><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M268 416h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12zM432 80h-82.41l-34-56.7A48 48 0 0 0 274.41 0H173.59a48 48 0 0 0-41.16 23.3L98.41 80H16A16 16 0 0 0 0 96v16a16 16 0 0 0 16 16h16v336a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128h16a16 16 0 0 0 16-16V96a16 16 0 0 0-16-16zM171.84 50.91A6 6 0 0 1 177 48h94a6 6 0 0 1 5.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12z"></path></svg></button></li>
                <form style="display: none;" class="wishName-update-form">
                   <div class="wishName-update-box">
                      <div class="wishName-update-input"><input name="NewWishName" value=""/></div>
                      <button type="button" class="wishName-reset reset" onclick="fn_wishNameReset(this)">취소</button>
                      <button type="button" class="wishName-save save" onclick="fn_wishNameSave(this)">저장</button>
                   </div>
                </form>
                <div class="wishName-delete-box" style="display: none;">
                     <div class="wishName-delete-text">리스트를 삭제하겠습니까?</div>
                     <button type="button" class="wishNameDelete-reset reset" onclick="fn_wishNameDeleteReset(this)">취소</button>
                     <button type="button" class="wishNameDelete-save save" onclick="fn_wishNameDeleteSave(this)"><input type="hidden" value="${ wl.wishlist_no }">저장</button>
                  </div>
                </div>
                </c:forEach>
            </ul>
            <div class="modal-list-add">
                <button><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" class="svg-inline--fa fa-plus fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></button>
                <span class="wishName-add-btn" onclick="fn_wishNameAddBtn(this)">새로운 리스트 만들기</span>
                <form class="wishName-add-form" style="display: none;">
                   <div class="wishName-add-box">
                      <div class="wishName-add-input"><label>이름 : </label><input name="addWishName" value=""/></div>
                      <button type="button" class="wishNameAdd-reset reset" onclick="fn_wishNameAddReset(this)">취소</button>
                      <button type="button" class="wishNameAdd-save save" onclick="fn_wishNameAddSave(this)">저장</button>
                   </div>
                </form>
            </div>
        </div>
<!--         <div class="modal-layer"></div> -->
        <!-- <div class="modal-out-content"></div> -->

<script>
//새로운 위시리스트 만들기를 눌렀을 때
function fn_wishNameAddBtn(e){
	let t = $(e);
    let i = $('.wishName-add-btn').index(t);
   	$('.wishName-add-form').eq(i).css('display','block');
   	$('.wishName-add-input').eq(i).children('input').focus();
   	$('.modal-list-add').eq(i).children('button').css('display','none');
   	t.css('display','none');
}
//새로운 위시리스트 만들기 취소 눌렀을 떄
function fn_wishNameAddReset(e){
	let t = $(e);
	let i = $('.wishNameAdd-reset').index(t);
	$('.wishName-add-form').eq(i).css('display','none');
   	$('.modal-list-add').eq(i).children('button,span').css('display','block');
}
//새로운 위시리스트 만들기 저장 눌렀을 떄
function fn_wishNameAddSave(e){
	let t = $(e);
	let i = $('.wishNameAdd-save').index(t);
	let addWishName = $('.wishName-add-input').eq(i).children('input').val();
	
	return new Promise((resolve,reject)=>{
		
		$.ajax({
			type: 'post',
			data: {addWName : addWishName},
			url: '${path}/wishlist/addWishlist.do',
			success: data=>{
				resolve(data);
				console.log(data);
				$.parseHTML(data);
				$('.wishName-add-form').eq(i).css('display','none');
			   	$('.modal-list-add').eq(i).children('button').css('display','block');
			   	$('.wishName-add-btn').eq(i).css('display','block');
// 			   	let clone = $('.row-box').eq(i).clone();
// 			   	console.log(clone);
				$('.wi-box').html(data);		    
			}
		})
	   
	}).then(arg=>{
		if(arg != null){
			$.ajax({
				type: 'post',
				url: '${path}//wishlist/wishlistList.do',
				success: data =>{
					console.log(data);
					$('#wl_selectModal').html(data);
				}
			})
		}
	})	
	
}

//위시리스트 휴지통 클릭 시
function fn_wishTrash(e){
   let t = $(e);
   let i = $('.wish-trash').index(t);
   $('.wishName-delete-box').eq(i).css('display','flex');
   $('wishName').eq(i).css('border-bottom','none');
   
}

//휴지통 취소 클릭 시
function fn_wishNameDeleteReset(e){
   let t = $(e);
   let i = $('.wishNameDelete-reset').index(t);
   $('.wishName-delete-box').eq(i).css('display','none');
   $('.wishName').eq(i).css('display','flex');
   
}

//휴지통 저장 클릭 시
function fn_wishNameDeleteSave(e){
   let t = $(e);
   let i = $('.wishNameDelete-save').index(t);
   let wNo = $(e).children().eq(0).val();
   
   return new Promise((s,f)=>{
      
      $.ajax({
         type: 'post',
         data: {wNo : wNo},
         url: '${path}/wishlist/deleteWishlist.do',
         success: data=>{
            console.log(data);
            if(data > 0){
				let clone = $('.row-box').clone();
               $('.row-box').eq(i).remove();
				let row = $('.row-box').length;
					console.log(row);
				if(row == 0){
					console.log(row);
					console.log(clone);
					clone.appendTo('.modal-list');
				}
				s(data);
            } else {
               return;
            }
         }
      })
   }).then((arg) =>{
      console.log('두번째 ajax');
      $.ajax({
         type: 'post',
         data: {dwNo : wNo},
         url: "${ path}/wishlist/productlist.do",
         success: data =>{
            console.log(data);
            $('#wl_selectModal').css('display','flex');
            $('.wi-box').empty();
            $('.wi-box').html(data);
             
            
         }
      })
   })
   
}

//위시리스트 이름 바꾸기
function fn_wishNameSave(e){
   let t = $(e);
   let i = $('.wishName-save').index(t);
   let wNo = $('.wishName').eq(i).children().eq(0).val();
   let wName = $('.wishName-update-input').eq(i).children().eq(0).val();
   console.log(wNo + wName);
   $.ajax({
      type: 'post',
      data: {wNo:wNo, wName:wName},
      url: '${path}/wishlist/wishNameUpdate.do',
      success: data=>{
         console.log(data);
         if(data > 0){
            $('.wishName-update-form').eq(i).css('display','none');
            $('.wishName').eq(i).css('display','flex');
            $('.wishName').eq(i).children().eq(1).text(wName);
         }
      }
   })
}


//위시리스트 이름 바꾸기 취소
function fn_wishNameReset(e){
   let t = $(e);
   let i = $('.wishName-reset').index(t);
   $('.wishName-update-form').eq(i).css('display','none');
   $('.wishName').eq(i).css('display','flex');
   
}

//위시리스트 연필아이콘 클릭시
function fn_wishPencil(e){
   let t = $(e);
   let i = $('.wish-pencil').index(t);
   let wName = $('.wishName').eq(i).children().eq(1).text();
   console.log(i);
   $('.wishName-update-form').eq(i).css('display','block');
   $('.wishName-update-input').eq(i).children().eq(0).val(wName);
   $('.wishName').eq(i).css('display','none');
}

function fn_test(e){
   let wNo = $(e).prev().val();
   console.log(wNo);
   
   $.ajax({
      type: 'post',
      data: {wNo : wNo},
      url: "${ path}/wishlist/productlist.do",
      success: data =>{
         console.log(data);
         $('.wi-box').empty();
         $('.wi-box').html(data);
         $('#wl_selectModal').css('display','none');
      }
   })
}

//모달 닫기
function fn_modalCloseBtn(){
   
   $('#wl_selectModal').css('display','none');
}

</script>