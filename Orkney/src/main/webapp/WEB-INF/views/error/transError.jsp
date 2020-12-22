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
    background-image: url(../resources/img/logo2.png);
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
    .transPw{padding: 2rem 5rem;display:flex;justify-content: center;flex-direction: column;height: 94%;width:75%;}
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
    @media(max-width:750px){
    	#semiForm{display:block;}
    	#leftForm{width:100%;height:50%;}
    	.transPw{width:100%;height:57%;}
    	#rightForm{width:100%;}
    }
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
                    <div class="logoimg"></div>
                    </div>
                </div>
                <div>
                    <h1 class="fw hfs" id="logintitle">죄송합니다.
                    <c:if test="${requestScope['javax.servlet.error.status_code'] == 400}">
				<br> 활성화 되어있지 <br>않은 링크입니다.
				<p class="ptext" id="logintext">이미 사용됐거나 만료된 링크입니다.</p>  
				</c:if>	
				
				<c:if test="${requestScope['javax.servlet.error.status_code'] == 404}">
					<br>요청하신 페이지를 찾을 수 없습니다.   
				</c:if>
				
				<c:if test="${requestScope['javax.servlet.error.status_code'] == 405}">
					요청된 메소드가 허용되지 않습니다. 
				</c:if>
				
				<c:if test="${requestScope['javax.servlet.error.status_code'] == 500}">
					서버에 오류가 발생하여 요청을 수행할 수 없습니다.
				</c:if>
				
				<c:if test="${requestScope['javax.servlet.error.status_code'] == 503}">
					서비스를 사용할 수 없습니다.
				</c:if></h1>
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
                        <div>
                        	<button type="submit" class="btn btn-primary btnattr" onclick="location.href='${path}';">메인으로</button>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        </div>
        <script>
        	$(".logoimg").click(e=>{
        		location.href='${path}';
        	})
        </script>
</body>
</html>