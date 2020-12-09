<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div id="personal-box" class="update-box" style="display: none;">
	<div class="personal-information-row input-label-wrap">
		<input type="text" id="update-name-input"
			class="origin-input-css" name="name"
			value="${ login.MEMBER_NAME }"> <label for=""
			class="input-label-2"><span>이름</span></label> <span
			style="display: none;" class="msg-not-null">이름을 입력해
			주세요.</span>
	</div>
	<div class="personal-information-row input-label-wrap">
	<!-- 생일 형식 yyyy-dd-mm으로 바꾸기 -->
	<c:set var="birReplace"
		value="ddd" />
	<input type="text" id="update-birth-input"
		class="origin-input-css" name="birth" value="${ birReplace }">
	<label for="" class="input-label-2"><span>생일</span></label> <span
		style="display: none;" class="msg-style">생일을 입력해 주세요.</span> <span
		style="display: none;" class="msg-style" id="birth-type-ck">YYYY-MM-DD
		형식으로 작성해야합니다.</span> <span style="display: none;" class="msg-style"
			id="birth-age-ck">만 15세 이상 이여야 합니다.</span>
	</div>
	<div class="personal-information-btn">
		<button type="button">취소</button>
		<button type="button" id="personal-submit">저장</button>
	</div>
</div>