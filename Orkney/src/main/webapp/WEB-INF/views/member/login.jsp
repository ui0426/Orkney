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
<title>ORKNEY</title>
</head>
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
<style>
    body,html{height:100%;overflow: hidden;}
    
    #totalForm{height:100%;}
    #semiForm{display:flex;height:100%;}
    #leftForm{
        width:38%;height:100%; background-color: lightslategray;padding: 2rem 5rem;
        display: flex;flex-direction: column; justify-content: space-between;
        color:white;
        }
    #rightForm{width:62%;height:100%;}
    *{margin:0;padding:0;}
    #loginForm{padding: 2rem 5rem; height:100%; display:grid;}
    #logininput{max-width: 450px;}
    .logbtn{margin:0; width:100%;border-radius: 30px;height: 3.5rem; font-weight: 800; font-size: 1rem;}
    .bc{background-color: lightslategray !important;}
    .mar{margin-top: 10%;
    margin-bottom: 4%;}
    .mdmar{margin-bottom:0;}
    .fs{font-size: 0.9rem;}
    .logoimg{
    background-image: url(https://kr.accounts.ikea.com/resources/static/logo.svg);
    background-repeat: no-repeat;
    background-size: 88px 44px;
    content: "";
    width:88px;
    height:44px;
    }
    #svgicon{
    height: 2.7rem;
    width: 1.5rem;
    fill:white;
    }
    .ptext{
    font-size: 14px;
    line-height: 20px;
    padding-top: 14px;
    margin-bottom: 0px;
    }
    .leftfx{
        font-size: 11px;
    }
    .asvg{position: absolute;left: -3.7rem;}
    .fw{font-weight: 700;}
    .itemstart{justify-content: flex-start;align-self: flex-start;}
    .fwtd{font-weight: bold; text-decoration:underline !important;}
    .hfs{font-size: 32px;}
    .divcenter{}
    .btnattr{
    background-color: #778899 !important;
    border-radius: 30px;
    width: 100%;
    padding: 0.rem .1rem .1rem;
    height: 3.5rem;
    font-weight: 700;
    padding: 0 2.5rem;
    font-size: 0.9rem;
    margin-top: 6%;
    }
    .searchPw{padding: 2rem 5rem;display:flex;justify-content: center;flex-direction: column;height: 94%;}
    .searchform{max-width:448px;}
    .errorspan{color: red; font-size: .75rem; font-weight: 500;}
    .bb{border-bottom: 1px solid #929292 !important;}
    #spw{display:none;}
    .pr{position:relative;}
    .borderb{border-bottom:1px solid black !important;}
    .marb{margin-bottom:2%}
    .disno{display:none;}
    .errored{border-bottom: 1px red solid !important;box-shadow: 0 1px 0 #e00751 !important;}
    .lfs{color:black !important;}
</style>
<body>
    <div id="totalForm">
        <div id="semiForm">
            <div id="leftForm">
                <div class="itemstart pr" id="svgdiv">
                    <a class="asvg" href="${path }" id="svga">
                        <svg id="svgicon" focusable="false" viewBox="0 0 24 24" class="svg-icon" aria-hidden="true">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.70613 11.2927L3.99902 11.9997L4.70606 12.7069L11.999 20.0008L13.4133 18.5867L7.82744 13.0001H19.9999V11.0001H7.82729L13.4144 5.41328L12.0002 3.99902L4.70613 11.2927Z"></path>
                       </svg>
                    </a>
                    <div class="divcenter">
                    <div class="logoimg"></div>
                    </div>
                </div>
                <div>
                    <h1 class="fw hfs" id="logintitle">로그인</h1>
                    <p class="ptext" id="logintext">외워야 할 비밀번호가 많아 불편하셨죠?<br>이제 일회용 코드를 이용하여 간편하게  로그인하세요. <br><br>* 이메일 또는 휴대폰 번호 최초 인증 후 사용 가능</p>
                    <div></div>
                </div>
                <div class="itemstart">
                    <span class="leftfx">ORKNEY.kr - </span><a class="leftfx">개인정보처리방침</a>
                    <div class="leftfx">© Inter ORKNEY Systems B.V. 2020-2020</div>
                </div>
            </div>
            <div id="rightForm">
                <div id="loginForm">
                    <div></div>
                    <form action="${path }/member/login.do" id="logininput" method="post">
                        <div class="md-form mdmar">
                            <input type="text" id="idinput" class="form-control borderb" name="userId">
                            <label for="inputLGEx" class="lfs">아이디 입력</label>
                            <div class="errorspan disno marb disno" id="iddiv">이메일을 입력해주세요.</div>
                          </div>
                        <div><span class="fs">다른 옵션 : </span><span id="googlelogin" style="cursor:pointer" class="fs fwtd" style="color:black;">구글</span></div>
                        <div class="md-form mdmar">
                            <input type="password" id="pwinput" class="form-control borderb" name="userPw">
                            <label for="inputLGEx"  class="lfs">비밀번호 입력</label>
                            <div class="errorspan disno marb disno" id="pwdiv">이메일을 입력해주세요.</div>
                          </div>
                          <div class="fs"><a class="fwtd" id="searchPwBtn">비밀번호찾기</a></div>
                        <div></div>
                        <div><button id="loginBtn" type="submit" class="btn btn-dark logbtn mar bc">로그인</button></div>
                        <div><button type="button" class="btn btn-light logbtn" id="sign_up">회원 가입</button></div>
                    </form>
                </div>
                <div class="searchPw" id="sPw">
                    <div>
                        <div class="md-form mdmar">
                            <form action=""  class="searchform">
                            <input type="text" id="fname" class="form-control bb">
                            <label for="fname" class="labcolor">이메일</label>
                            <span class="errorspan disno" id="fnspan">이메일은 필수 필드입니다.</span>
                            <div><button id="transbtn" type="button" class="btn btn-primary btnattr">비밀번호 재설정</button></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
   <script>
    $("#searchPwBtn").click(e=>{
        $("#loginForm").css("display","none");
        $("#sPw").css("display","flex");
        $("#logintitle").html("비밀번호 찾기");
        $("#logintext").html("이메일을 통해 비밀번호를 재설정해 주세요.");
        $("#svga").attr("href","");
    })
    
     $("#idinput").on("blur",e=>{//이메일이 안적혔을 때
            var v=$(e.target).val().length;
            var val=$(e.target).val();
           if(v==0){
                $(e.target).addClass("errored");
                $("#iddiv").css("display","block");
                $("#iddiv").html("이메일을 입력해주세요.");
           }else{
            $(e.target).removeClass("errored");
            $("#iddiv").css("display","none");
           }
           if(v>=1){
            let reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g;
            if(reg.test(val)){
                $(e.target).removeClass("errored");
                $("#iddiv").css("display","none");
            }else{
                $(e.target).addClass("errored");
                $("#iddiv").css("display","block");
                $("#iddiv").html("이메일 형식이 올바르지 않습니다.");
            }
           }
        })

        $("#pwinput").on("blur",e=>{//비밀번호가 안적혔을 때
            var v=$(e.target).val().length;
           if(v==0){
                $(e.target).addClass("errored");
                $("#pwdiv").css("display","block");
                $("#pwdiv").html("비밀번호를 입력해주세요.");
           }else{
            $(e.target).removeClass("errored");
            $("#pwdiv").css("display","none");
           }
        })
        $("#transbtn").click(e=>{
        	location.href="${path}/transPw.do";
        })
        $("#sign_up").click(e=>{
        	location.href="${path}/member/signup.do";
        })
        
  $("#googlelogin").click(e=>{
	  onClickGoogleLogin();
  })
        
        
 	const onClickGoogleLogin = (e) => {
    	//구글 인증 서버로 인증코드 발급 요청
 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?client_id=63421017718-97poh5dtj10hbv1ul6q80h9g51tpov1d.apps.googleusercontent.com&redirect_uri=http://localhost:9090/orkney/login/google/auth&response_type=code&scope=email%20profile%20openid&access_type=offline");
		//window.open("https://accounts.google.com/o/oauth2/v2/auth?client_id=63421017718-97poh5dtj10hbv1ul6q80h9g51tpov1d.apps.googleusercontent.com&redirect_uri=http:localhost:9090/orkney/login/google/auth&response_type=code&scope=email%20profile%20openid&access_type=offline",
				// 	"","width=400,height=400,left=600");
 	}
	
    
	</script>
</body>
</html>