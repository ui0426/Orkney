<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
 <!-- Google Fonts Roboto -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
 <!-- Bootstrap core CSS -->
 <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
 <!-- Material Design Bootstrap -->
 <link rel="stylesheet" href="${path}/resources/css/mdb.min.css">
 <!-- Your custom styles (optional) -->
 <link rel="stylesheet" href="${path}/resources/css/style.css">

 <script type="text/javascript" src="${path}/resources/js/jquery.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="${path}/resources/js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="${path}/resources/js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="${path}/resources/js/mdb.min.js"></script>
</head>
<link rel="stylesheet" href="${path }/resources/css/member/emailAuth.css">
<body>
    <div id="totalForm">
        <div id="semiForm">
            <div id="leftForm">
             <div class="leftdiv">
                <div class="itemstart pr" id="svgdiv">
                    <!-- <a class="asvg" id="svga">
                        <svg id="svgicon" focusable="false" viewBox="0 0 24 24" class="svg-icon" aria-hidden="true">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.70613 11.2927L3.99902 11.9997L4.70606 12.7069L11.999 20.0008L13.4133 18.5867L7.82744 13.0001H19.9999V11.0001H7.82729L13.4144 5.41328L12.0002 3.99902L4.70613 11.2927Z"></path>
                       </svg>
                    </a> -->
                    <div class="divcenter">
                    <div class="logo-size">
                    	<a href="${path }"><img class="logo-size" src="${path }/resources/img/logo5.PNG"/></a>
                    </div>
                    </div>
                </div>
                <div>
                    <h1 class="fw hfs" id="logintitle">이메일 <b style="color:yellow;">확인</b><br>
                    </h1>
                    <p class="ptext" id="logintext">
                        ORKNEY 계정의 보안을 강화하고 보다 다양한<br>
                        방법으로 계정에 액세스하려면 이메일을 등록하고 <br>
                        확인 절차를 거쳐야 합니다.
                    	</p>
                    <div></div>
                </div>
                <div class="itemstart">
                    <span class="leftfx">ORKNEY.kr - </span><a class="leftfx">개인정보처리방침</a>
                    <div class="leftfx">© Inter ORKNEY Systems B.V. 2020-2020</div>
                </div>
            </div>
            </div>
            <div id="rightForm">
                <div class="transPw" id="sPw">
                    <div>
                    <div class="md-form mdmar">
                        <input type="text" id="idinput" class="form-control borderb" name="userId" value="${login.MEMBER_ID }" readonly>
                        <label for="inputLGEx" class="lfs"></label>
                        <div class="errorspan disno marb disno" id="iddiv">이메일을 입력해주세요.</div>
                      </div>
                      <form name="authForm" method="post" action="${path}/home">
                      <div class="auth">
                      <div class="md-form mdmar">
                        <input type="text" id="idinput1" class="form-control borderb authInput" name="key1" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                      <div class="md-form mdmar">
                        <input type="text" id="idinput2" class="form-control borderb authInput" name="key2" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                      <div class="md-form mdmar">
                        <input type="text" id="idinput3" class="form-control borderb authInput" name="key3" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                      <div class="md-form mdmar">
                        <input type="text" id="idinput4" class="form-control borderb authInput" name="key4" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                      <div class="md-form mdmar">
                        <input type="text" id="idinput5" class="form-control borderb authInput" name="key5" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                      <div class="md-form mdmar">
                        <input type="text" id="idinput6" class="form-control borderb authInput" name="key6" maxlength="1">
                        <label for="inputLGEx" class="lfs"></label>
                      </div>
                    </div>
                    <div class="errorspan disno marb" id="authDiv">인증 번호가 일치하지 않습니다.</div>
                    <div>
                        <div>
                        	<c:if test="${authInfo == null }">
                        	<button type="button" class="btn btn-primary btnattr" onclick="return authLogin();">로그인</button>
                        	</c:if>
                        	<c:if test="${authInfo != null }">
                        	<button type="button" class="btn btn-primary btnattr" onclick="authDo();">인증하기</button>
                        	</c:if>
                        </div>
                        <div>
                        	<button type="submit" class="btn btn-primary btnattr" style="background:#f5f5f5 !important;color:black;">다음에 하기</button>
                        </div>
                    </div>
                    </form>
                    </div>
                    </div>
                </div>
            </div>
            </div>
</body>
<script>
	function authLogin(){
		$.ajax({
			url:"${path}/member/keyCheck.do",
			data:{key1:$("#idinput1").val(),key2:$("#idinput2").val(),key3:$("#idinput3").val()
				,key4:$("#idinput4").val(),key5:$("#idinput5").val(),key6:$("#idinput6").val(),id:$("#idinput").val()},
			type:'POST',
			success:data => {
				console.log(data);
				if(data == true){
					authForm.submit();
				}else{
					$("#authDiv").css('display','block');
				}
			}
			
		})
		return false;
	}
	
	function authDo(){
		$.ajax({
			
			url: "${path}/member/keyCheckAfter.do",
			data: {key1:$("#idinput1").val(),key2:$("#idinput2").val(),key3:$("#idinput3").val()
				,key4:$("#idinput4").val(),key5:$("#idinput5").val(),key6:$("#idinput6").val()},
			type : 'post',
			success: data =>{
				console.log(data);
				if(data == true){
					location.replace('${path}/member/mypage.do');
				}else{
					$("#authDiv").css('display','block');
				}
			}
		});
		
	}
</script>
</html>