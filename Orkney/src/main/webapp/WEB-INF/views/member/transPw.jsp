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
    cursor:pointer;
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
    .transPw{padding: 2rem 5rem;display:flex;justify-content: center;flex-direction: column;height: 94%;}
    .transform{max-width:448px;}
    .errorspan{color: red; font-size: .75rem; font-weight: 500;}
    .bb{border-bottom: 1px solid #929292 !important;}
    #spw{display:none;}
    .pr{position:relative;}
    .borderb{border-bottom:1px solid black !important;}
    .marb{margin-bottom:2%}
    .disno{display:none;}
    .errored{border-bottom: 1px red solid !important;box-shadow: 0 1px 0 #e00751 !important;}
    .lfs{color:black !important;}
    .leftdiv{display:contents;}
    .mb{margin-bottom: 2rem;}
    .heart{display:none;}
    .fc{color:black !important;}
    .ic{color:lightcoral;}
    .logo-size{width: 75px;}
</style>
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
                    <h1 class="fw hfs" id="logintitle">비밀번호를<br>재설정해주세요.</h1>
                    <p class="ptext" id="logintext"><b style="font-weight:700;">비밀번호는 최소 다음이 포함되어야 합니다.</b><br><br>
                  <i class="fas fa-heart heart ic" id="lenht1"></i><i class="fas fa-heart-broken"  id="lenht2"></i>&nbsp최소 8자 이상을 입력해야 합니다.<br>
                  <i class="fas fa-heart heart ic" id="numht1"></i><i class="fas fa-heart-broken" id="numht2"></i>&nbsp숫자 또는 특수문자<br>
                  <i class="fas fa-heart heart ic" id="lowht1"></i><i class="fas fa-heart-broken" id="lowht2"></i>&nbsp소문자<br>
                  <i class="fas fa-heart heart ic" id="highht1"></i><i class="fas fa-heart-broken" id="highht2"></i>&nbsp대문자
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
                            <form action="${path}/member/transPwLast.do"  class="transform" method="post">
                        <div class="md-form mdmar mb">
                            <input type="password" id="transPwin" class="form-control bb" name="pw">
                            <label for="fname" class="labcolor fc">새로운 비밀번호</label>
                            <span class="errorspan disno" id="transspan">계속하기 위해 비밀번호가 필요합니다.</span>
                       </div>
                       <div  class="md-form mdmar">
                            <input type="password" id="transPwinCh" class="form-control bb" name="pwch">
                            <label for="fname2" class="labcolor fc">새로운 비밀번호 확인</label>
                            <span class="errorspan disno" id="transchspan">비밀번호가 일치하지 않습니다.</span>
                        </div>
                        <div>
                        	<button type="submit" class="btn btn-primary btnattr" onclick="return pwCheck();">비밀번호 재설정</button>
                        </div>
                        <input type="hidden" value="${id}" name="id">
                            </form>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
   <script>
	let pw=false;
	let pwCh=false;
        $("#transPwin").on("blur",e=>{//비밀번호가 안적혔을 때
            var v=$(e.target).val().length;
       		var val=$(e.target).val();
            var t1=/[a-z]+/;
            var t2=/[A-Z]+/;
            var t3=/[0-9!@#$%^&*()-+=`~]+/;
           if(v==0){
                $(e.target).addClass("errored");
                $("#transspan").css("display","block");
                $("#transsapn").html("비밀번호를 입력해주세요.");
                pw=false;
           }else{
            $(e.target).removeClass("errored");
            $("#transspan").css("display","none");
           }
           if(v>0){
        	   if((v>=8&&v<=20)&&t1.test(val)&&t2.test(val)&&t3.test(val)){
                   $(e.target).removeClass("errored");
                   $("#transspan").css("display","none");
                   pw=true;
               }else{
                   $(e.target).addClass("errored");
                   $("#transspan").css("display","block");
                   $("#transspan").html("비밀번호 형식이 올바르지 않습니다.");
                   pw=false;
           }
           }
        })
        $("#transPwinCh").keyup(e=>{
        	var newPw=$("#transPwin").val();
        	var chPw=$(e.target).val();
        	if(newPw!=chPw){
        		$(e.target).addClass("errored");
        		$("#transchspan").css("display","block");
        		pwCh=false;
        	}else{
        		$(e.target).removeClass("errored");
        		$("#transchspan").css("display","none");
        		pwCh=true;
        	}
        })
        $("#transPwin").keyup(e=>{
        	var newPw=$("#transPwinCh").val();
        	var chPw=$(e.target).val();
        	if(newPw==chPw){
        		$("#transchspan").css("display","none");
        		$("#transPwinCh").removeClass("errored");
        		pwCh=true;
        	}
        })
        
         $("#transPwin").keyup(e=>{
            var val=$(e.target).val();
            var len=$(e.target).val().length;

            var t1=/[a-z]+/;
            var t2=/[A-Z]+/;
            var t3=/[0-9!@#$%^&*()-+=`~]+/;
            
            var ch=0;

            if(len>=8&&len<=20){
                $("#lenht1").css("display","contents");
                $("#lenht2").css("display","none");
            }else{
            	$("#lenht1").css("display","none");
            	$("#lenht2").css("display","contents");
            }
            if(t1.test(val)){
                $("#lowht1").css("display","contents");
                $("#lowht2").css("display","none");
            }else{
            	$("#lowht1").css("display","none");
            	$("#lowht2").css("display","contents");
            }
            if(t2.test(val)){
                $("#highht1").css("display","contents");
                $("#highht2").css("display","none");
            }else{
            	$("#highht1").css("display","none");
            	$("#highht2").css("display","contents");
            }
            if(t3.test(val)){
                $("#numht1").css("display","contents");
                $("#numht2").css("display","none");
            }else{
            	$("#numht1").css("display","none");
            	$("#numht2").css("display","contents");
            }
            if((len>=8&&len<=20)&&t1.test(val)&&t2.test(val)&&t3.test(val)){
                $(e.target).removeClass("errored");
                $("#transspan").css("display","none");
            }else{
                $(e.target).addClass("errored");
                $("#transspan").css("display","block");
                $("#transspan").html("비밀번호 형식이 올바르지 않습니다.");
            }
        })
        
        function pwCheck(){
        	if(pw==true&&pwCh==true){
        		return true;
        	}
        	return false;
        }
        $(".logoimg").click(e=>{
        	location.href="${path}";
        })
	</script>
</body>
</html>