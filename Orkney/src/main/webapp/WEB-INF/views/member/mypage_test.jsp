<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${path }/resources/css/member/mypage.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${ path }/resources/js/test.js"></script>
<section>



	<div class="mypage-container">
		<div>
			<%--          <h1>안녕하세요, <c:out value="${ fn:substring(login.MEMBER_NAME,1,fn:length(login.MEMBER_NAME)) }"/>님!</h1> --%>
			<h1>
				안녕하세요, <span id="title-name"><c:out
						value="${ login.MEMBER_NAME }" /></span>님!
			</h1>
			<span>로그아웃을 하고 싶으신가요? <a href="${ path }/member/loginout.do"
				style="text-decoration: underline;">로그아웃</a></span>
		</div>
		<div class="mypage-row">
			<div class="mypage-row-box">
				<div class="mypage-row-content">
					<a href="">주문 내역</a> <span>진행 중인 주문 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24"
						class="profile__svg-icon profile__link-box-arrow-right"
						aria-hidden="true">
						<path fill-rule="evenodd" clip-rule="evenodd"
							d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
			<div class="mypage-row-box"
				onclick="location.href='${ path }/wishlist/wishlist.do'">
				<div class="mypage-row-content">
					<a>위시 리스트</a> <span>저장된 리스트 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24"
						class="profile__svg-icon profile__link-box-arrow-right"
						aria-hidden="true">
						<path fill-rule="evenodd" clip-rule="evenodd"
							d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
			<div class="mypage-row-box">
				<div class="mypage-row-content">
					<a href="">배송 관리</a> <span>진행 중인 배송 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24"
						class="profile__svg-icon profile__link-box-arrow-right"
						aria-hidden="true">
						<path fill-rule="evenodd" clip-rule="evenodd"
							d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
		</div>
		<div class="mypage-content">
			<div class="mypage-content-tabList">
				<button class="mypage-active" onclick="fn_tab(this,'1')">계정</button>
				<button class="mypage-nonactive" onclick="fn_tab(this,'2')">주소</button>
				<button class="mypage-nonactive" onclick="fn_tab(this,'3')">설정</button>
			</div>
			<div class="mypage-content-tab">
				<!-- 계정페이지 -->
				<div class="panel 1">
					<form id="personal-submit-form">
						<div class="panel-row">
							<div class="panel-row-title flex-row-between">
								<span>개인 정보</span> <a id="personal"
									onclick="fn_update_personal(this)">수정</a>
							</div>
							<div id="updateName">
								<c:out value="${ login.MEMBER_NAME }" />
							</div>
							<div id="updateBirth">
								<c:forTokens var="bTokens" items="${ login.BIRTHDAY }"
									delims="-" varStatus="status">
									<c:if test="${ status.first }">
										<c:out value="${ bTokens }년도" />
									</c:if>
									<c:if test="${ !status.first && !status.last }">
										<c:out value=" ${bTokens }월" />
									</c:if>
									<c:if test="${ status.last }">
										<c:out value="${ fn:substring(bTokens,0,2) }일" />
									</c:if>
								</c:forTokens>
							</div>
							<div id="jjjj">
								
							</div>
						</div>
					</form>

					<hr style="margin: 3.125rem 0 3.125rem 0;">
					<form id="contact-submit-form">
						<div class="panel-row">
							<div class="panel-row-title flex-row-between">
								<span>연락처</span> <a id="contact"
									onclick="fn_update(this,'#contact')">수정</a>
							</div>
							<div class="flex-row-between">
								<span id="updatePhone"><c:out value="${ login.PHONE }" /></span>
								<span>확인되지 않음???</span>
							</div>
							<div class="flex-row-between">
								<span><c:out value="${ login.MEMBER_ID }" /></span> <span>확인됨???</span>
							</div>
							<div id="contact-box" class="update-box" style="display: none;">
								<div class="personal-information-row input-label-wrap">
									<input type="text" id="update-phone-input"
										class="origin-input-css" name="phone" value="${ login.PHONE }">
									<label for="" class="input-label-2"><span>휴대폰</span></label> <span
										style="display: none;" class="msg-style">휴대폰 번호를 입력해
										주세요.</span> <span style="display: none;" class="msg-style"
										id="phone-type-ck">휴대폰 번호가 올바르지 않습니다.</span>
								</div>
								<div class="personal-information-row">
									<span class="title">이메일</span> <input class="disabled"
										type="email" value="${ login.MEMBER_ID }" disabled>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button type="button" id="contact-submit">저장</button>
								</div>
							</div>

						</div>
					</form>

					<hr style="margin: 3.125rem 0 3.125rem 0;">
					<form id="password-submit-form">
						<div class="panel-row">
							<div class="panel-row-title flex-row-between">
								<span>비밀번호</span> <a id="password"
									onclick="fn_update(this,'#password')">수정</a>
							</div>
							<div>
								<span
									style="color: #929292; font-size: 1.50em; font-weight: 700;">••••••••</span>
							</div>
							<div id="password-box" class="update-box" style="display: none;">
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="update-originPw-input"
										class="origin-input-css" name="originPw"> <label
										for="update-originPw-input" class="input-label"><span>현재
											비밀번호</span></label> <span style="display: none;" class="msg-style">현재
										비밀번호를 입력해 주세요.</span>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="update-newPw-input"
										class="origin-input-css" name="newPw"> <label
										for="update-newPw-input" class="input-label"><span>새
											비밀번호</span></label> <span style="display: none;" class="msg-style">새
										비밀번호를 입력해 주세요.</span> <span id="newPw-type-ck"
										style="display: none; color: #212529;" class="msg-style">비밀번호에는
										다음이 포함되어야 합니다.</span>
									<ul id="newPw-type-ck-ul" style="display: none;"
										class="msg-style">
										<li id="ul1">8-20자를 입력해야 합니다</li>
										<li id="ul2">소문자(a-z)</li>
										<li id="ul3">대문자(A-Z)</li>
										<li id="ul4">숫자 또는 특수 문자</li>
									</ul>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="update-newPwCk-input" name="newPwCk">
									<label for="update-newPwCk-input" class="input-label"><span>새
											비밀번호 확인</sspan></label> <span style="display: none;" class="msg-style">새
										비밀번호 다시 한번 입력해 주세요.</span> <span style="display: none;"
										class="msg-style" id="newPwCk-eq-ck">새 비밀번호가 일치하지 않습니다.</span>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button type="button" id="password-submit">저장</button>
								</div>
							</div>
						</div>
					</form>

					<hr style="margin: 3.125rem 0 3.125rem 0;">

				</div>
				<!-- 주소 페이지 -->
				<div class="panel 2" style="display: none;">
					<form id="address-submit-form">
						<div class="panel-row">
							<div class="panel-row-title flex-row-between">
								<span>기본 주소</span> <a id="address"
									onclick="fn_update(this,'#address')">수정</a>
							</div>
							<c:forTokens items="${ login.address }" delims="/" var="add"
								varStatus="addStatus">
								<c:if test="${ addStatus.first }">
									<c:set var="add1" value="${ add }" />
								</c:if>
								<c:if test="${ !addStatus.first && !addStatus.last }">
									<c:set var="add2" value="${ add }" />
								</c:if>
								<c:if test="${ addStatus.last }">
									<c:set var="add3" value="${ add }" />
								</c:if>
							</c:forTokens>
							<div>
								<c:out value="${ add2 }" />
							</div>
							<div>
								<c:out value="${ add3 }" />
							</div>
							<div>
								<c:out value="${ add1 }" />
							</div>
							<div id="address-box" class="update-box" style="display: none;">
								<button class="addAddressBtn">우편번호 찾기</button>
								<div class="personal-information-row">
									<span class="title">도로명 주소</span> <input class="disabled addr"
										type="text" id="" name="" value="${ add2 }" readonly>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="text" id="update-addrDetail-input"
										value="${ add3 }"> <label
										for="update-addrDetail-input" class="input-label-2"><span>상세
											주소</span></label> <span style="display: none;" class="msg-style">상세주소를
										입력해 주세요.</span>
								</div>
								<div class="personal-information-row">
									<span class="title">우편번호</span> <input class="disabled post"
										type="text" value="${ add1 }" readonly>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button class="submitBtn" id="address-submit">저장</button>
								</div>
							</div>
						</div>
					</form>

					<hr style="margin: 3.125rem 0 3.125rem 0;">

					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>배송 주소(<c:out value="${ fn:length(addrList)}" />)
							</span>
						</div>
						<!-- 등록된 배송지 없을경우 -->
						<c:if test="${ addrList.size() == 0 }">
							<div>저장된 주소가 없습니다. 편리한 쇼핑을 위해 주소를 입력해주세요.</div>
						</c:if>
						<!-- 등록된 배송지가 있을 경우 -->
						<c:if test="${ addrList.size() != 0 }">
							<c:forEach var="addr" items="${ addrList }" varStatus="status">
								<div class="divForAddAdddrUpdate">
									<a class="panel-row-update addAddr-aTag-${status.index }"
										onclick="fn_addAddrUpdate(this);">수정</a>
									<div class="addr-disappear-${ status.index }">
										<div class="flex-row-between">
											<div class="font-weight">
												<c:out value="${ addr.address_name }" />
											</div>
										</div>
										<div>
											<c:out value="${ addr.address_addr }" />
										</div>
										<div>
											<c:out value="${ addr.address_detail }" />
										</div>
										<div>
											<c:out value="${ addr.address_post }" />
										</div>
										<br> <span class="font-weight">휴대폰 : </span><span><c:out
												value="${ addr.address_phone }" /></span>
									</div>
									<!--                      <hr style="margin: 2.125rem 0 2.125rem 0; border-style: dashed;"> -->

									<div class="update-box addr-update-box-${status.index }"
										style="display: none;">
										<div class="personal-information-row input-label-wrap">
											<input type="text" class="input-event not-null"
												value="${ addr.address_name }"> <label for=""
												class="input-label-2"><span>이름</span></label> <span
												style="display: none;" class="msg-not-null">이름을 입력해
												주세요.</span>
										</div>
										<div class="personal-information-row input-label-wrap">
											<input type="text" class="input-event not-null"
												value="${ addr.address_phone }"> <label for=""
												class="input-label-2"><span>휴대폰</span></label> <span
												style="display: none;" class="msg-not-null">휴대폰 번호를
												입력해 주세요.</span>
										</div>
										<button class="addAddressBtn">우편번호 찾기</button>
										<div class="personal-information-row">
											<span class="title">도로명 주소</span> <input
												class="disabled addr" type="text"
												value="${ addr.address_addr }" readonly>
										</div>
										<div class="personal-information-row input-label-wrap">
											<input type="text" class="input-event not-null"
												value="${ addr.address_detail }"> <label for=""
												class="input-label-2"><span>상세 주소</span></label> <span
												style="display: none;" class="msg-not-null">상세주소를 입력해
												주세요.</span>
										</div>
										<div class="personal-information-row">
											<span class="title">우편번호</span> <input class="disabled post"
												type="text" value="${ addr.address_post }" readonly>
										</div>
										<div class="personal-information-btn">
											<button type="button">취소</button>
											<button class="submitBtn" id="personal-submit">저장</button>
											<button class="">주소삭제</button>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<a class="addAddrBtn">새 배송 주소 추가</a>
						</div>
						<div id="addAddrBtn-updatebox" class="update-box"
							style="display: none;">
							<div class="personal-information-row">
								<span class="title">이름</span> <input type="text" value="tjd">
							</div>
							<div class="personal-information-row">
								<span class="title">휴대폰</span> <input type="text"
									value="01011111111">
							</div>
							<button class="addAddressBtn">우편번호 찾기</button>
							<div class="personal-information-row">
								<span class="title">도로명 주소</span> <input class="disabled addr"
									type="text" value="도로명 주소" readonly>
							</div>
							<div class="personal-information-row input-label-wrap">
								<input type="text" id="origin-pw"> <label
									for="origin-pw" class="input-label"><span>상세 주소</span></label>
								<span style="display: none;" id="origin-msg">상세 주소를
									입력해주세요.</span>
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span> <input class="disabled post"
									type="text" value="우편번호" readonly>
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button>저장</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 설정페이지 -->
				<div class="panel 3" style="display: none;">
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>마케팅 수신 설정</span> <a id="ad" onclick="fn_update(this,'#ad')">수정</a>
						</div>
						<div>경기 또기시 또기동 또기로 1번길 11</div>
						<div>101</div>
						<div>12121</div>
						<div id="address-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">도로명 주소</span> <input type="text"
									value="경기 또기시 또기동 또기로 1번길 11" readonly>
							</div>
							<div class="personal-information-row">
								<span class="title">상세 주소</span> <input type="text" value="101"
									placeholder="상세 주소">
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span> <input type="text" value="12121"
									readonly>
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button>저장</button>
							</div>
						</div>
					</div>

					<hr style="margin: 3.125rem 0 3.125rem 0;">

					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>회원 정보 삭제</span>
						</div>
						<div>orkney를 더이상 이용하지 않는다면 언제든 탈퇴할 수 있습니다.</div>
						<div>단, 회원 정보 및 구매 내역이 함께 삭제된다는 점을 참고해 주세요.</div>
						<a id="deleteBtn">계정을 삭제하시겠어요?</a>
						<div id="contact-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">휴대폰</span> <input type="text"
									value="01011111111">
							</div>
							<div class="personal-information-row">
								<span class="title">이메일</span> <input type="email"
									value="asdf@asdf.com" placeholder="orkney@orkney.com">
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button>저장</button>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />