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
        #email-alarm{
          position:absolute;
          padding: 0.6rem 3rem 1rem;
          left: 105%;
          font-weight: 600;
          top: 13%;
          width:200px;
          height:70px;
          margin-left:-50px;
          background-color:#000;
          color:#fff;
          /* 애니메이션 이름 */
          /* animation-name: emailDiv; */
          animation-duration:3s;
          animation-duration: leaner;
          animation-iteration-count:1;
          animation-direction:alternate;
          animation-fill-mode: forwards;
          border-radius: 10px;
        }
        
        @-webkit-keyframes emailDiv {
      0% {
        left:105%;
      }
      50%{
        left:70%;
      }
      100% {
        left:105%;
      }
    }
    
    </style>
    <body>
    <div id="email-alarm">
        이메일이 전송되었습니다.
    </div>
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
                        <h1 class="fw hfs" id="logintitle">비밀번호 찾기</h1>
                        <p class="ptext" id="logintext">이메일을 통해 비밀번호를 재설정해 주세요.</p>
                        <div></div>
                    </div>
                    <div class="itemstart">
                        <span class="leftfx">ORKNEY.kr - </span><a class="leftfx">개인정보처리방침</a>
                        <div class="leftfx">© Inter ORKNEY Systems B.V. 2020-2020</div>
                    </div>
                </div>
                <div id="rightForm">
                    <div class="searchPw" id="sPw">
                        <div>
                            <div class="md-form mdmar">
                                <form action="${path }/transPw.do"  class="searchform" name="emailChForm" method="post">
                                <input type="text" id="fname" class="form-control bb" name="email">
                                <label for="fname" class="labcolor">이메일</label>
                                <span class="errorspan disno" id="fnspan">이메일은 필수 필드입니다.</span>
                                <div><button id="transbtn" type="button" class="btn btn-primary btnattr" onclick="return emailCh();">비밀번호 재설정</button></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <input type="hidden" value=${ani} id="ech">
       <script>
       
       let ch=$("#ech").val();
       if(ch=='true'){
           $("#email-alarm").css('animation-name','emailDiv');
       }
       
       function emailCh(){
        
    
                $.ajax({
                   url:"${path}/member/emailCh.do",
                   data:{"id":$("#fname").val(),"auth":"Y"},
                   type:'post',
                   success: data => {
                       if(data==true){
                        emailChForm.submit(); 
                       }else{
                       $("#fnspan").html('이메일이 존재하지 않습니다.');
                       $("#fnspan").css('display','block');
                       }
                    }
               }) 
           return false;
           
       }
       
       $("#fname").on("blur",e=>{//이메일이 안적혔을 때
           var v=$(e.target).val().length;
           var val=$(e.target).val();
          if(v==0){
               $(e.target).removeClass("errored");
               $("#fnspan").css("display","none");
          }else{
           $(e.target).removeClass("errored");
           $("#fnspan").css("display","none");
          }
          if(v>=1){
           let reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g;
           if(reg.test(val)){
               $(e.target).removeClass("erroredn");
               $("#fnspan").css("display","none");
           }else{
               $(e.target).addClass("errored");
               $("#fnspan").css("display","block");
               $("#fnspan").html("이메일 형식이 올바르지 않습니다.");
           }
          }
       })
       
    
               
         
        
        </script>
    </body>
    </html>