    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    
   <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   

<link rel="stylesheet" href="${path }/resources/css/member/member.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	@media(max-width:750px){
		.joinform{display:block;padding:0;}
		.leftimg{display:none;}
		.rightimg{display:none;}
		#oneimg{display:block !important;}
		.imgform{max-width:100%; display:block;}
		.joindata{width:100%;}
	}
	#oneimg{height:246px;display:none;}
</style>
    <div class="jointotal">
            <div class="joinform">
                <div class="imgform">
                    <h1 class="hft"><span style="color:lightseagreen;">ORKNEY</span> 회원 가입</h1>
                    <span class="fspan">이미 가입하셨나요? : <a href="${path }/member/memberLogin.do" style="text-decoration: underline;color:black;">로그인</a></span>
                    <div class="totalimg">
                    <div id="oneimg" class="img10 imgprop"></div>
                        <div class="leftimg wid1">
                            <div class="imgprop img1 height1 wid2"></div>
                            <div class="imgprop img2 wid2 height1"></div>
                            <div class="imgprop img3 wid2 height2"></div>
                            <div class="imgprop img4 wid2 height1"></div>
                        </div>
                        <div class="rightimg wid1">
                            <div class="imgprop img5 height2 wid2"></div>
                            <div class="imgprop img6 wid2 height2"></div>
                            <div class="imgprop img7 wid2 height1"></div>
                            <div class="imgprop img8 wid2 height2"></div>
                            <div class="imgprop img9 wid2 height1"></div>
                        </div>
                    </div>
                </div>
                <div class="nonespace"></div>
                <div class="joindata">
                    <div>
                        <form action="${path }/member/insertSignup.do" method="post">
                            <div class="emailcheck">
                                <fieldset>
                                    <legend class="marb lgfs">ORKNEY Family에 가입하시겠어요?</legend>
                                </fieldset>
                                <div>
                                    <div class="md-form mdmar marb">
                                    <input type="text" id="fname" class="form-control borderb" name="f_name" required>
                                    <label for="fname" class="labcolor">성</label>
                                    <span class="errorspan disno" id="fnspan">성은 필수 필드입니다.</span>
                                  </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="name" class="form-control borderb" name="g_name" required>
                                        <label for="name" class="labcolor">이름</label>
                                        <span class="errorspan disno" id="nspan">이름은 필수 필드입니다.</span>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="bir" class="form-control borderb" maxlength="10" name="birthday" required>
                                        <label for="bir" class="labcolor">생일</label>
                                        <span class="errorspan disno" id="birspan">생일은 필수 필드입니다.</span>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="ph" class="form-control borderb" maxlength="13" name="phone" required>
                                        <label for="ph" class="labcolor">휴대폰</label>
                                        <span class="errorspan disno" id="phspan">휴대폰은 필수 필드입니다.</span>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="email" class="form-control borderb" name="email" required>
                                        <label for="email" class="labcolor">이메일</label>
                                        <span class="errorspan disno" id="emailspan">이메일은 필수 필드입니다.</span>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb paswid">
                                        <input type="password" id="pw" class="form-control borderb" name="password" required>
                                        <label for="pw" class="labcolor">비밀번호</label>
                                        <span class="errorspan disno" id="pwspan">비밀번호는 필수 필드입니다.</span>
                                        <div class="pwfsb"><span>비밀번호는 다음을 포함해야 합니다.</span></div>
                                        <div class="pwfs mart" id="pwch1"><span>8-20자를 입력해야 합니다.</span></div>
                                        <div class="pwfs" id="pwch2"><span>소문자(a-z)</span></div>
                                        <div class="pwfs" id="pwch3"><span>대문자(A-Z)</span></div>
                                        <div class="pwfs" id="pwch4"><span>숫자 또는 특수문자</span></div>
                                      </div>
                                </div>
                                <div>
                                    <button type="button" class="adrBtn marb" id="adrbtn">우편번호 찾기</button>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="adrinput" class="form-control cen" name="adr2" disabled>
                                        <label for="adrinput">주소</label>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb">
                                        <input type="text" id="detailadr" class="form-control borderb" name="adr3" required>
                                        <label for="detailadr" class="labcolor">상세주소</label>
                                        <span class="errorspan disno" id="adrspan">상세주소는 필수 필드입니다.</span>
                                      </div>
                                </div>
                                <div>
                                    <div class="md-form mdmar marb paswid" id="zipdiv">
                                        <input type="text" class="form-control cen" id="zip" name="adr1" disabled>
                                        <label for="zip" id="zipcode">우편번호</label>
                                      </div>
                                </div>
                                <div class="checkdiv  marb">
                                    <div class="checkicon">
                                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                                        <input type="checkbox" class="ck" id="ch1" name="emailCh" value="Y">
                                    </div>
                                    <span class="spanwid">마케팅 수신 동의를 통해 ORKNEY의 홈퍼니싱 아이디어와 신상품 소식, 그리고 할인 혜택 정보를 받고 싶어요!</span>
                                </div>
                                <div class="checkdiv  marb">  
                                    <div class="checkicon">
                                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                                        <input type="checkbox" class="ck" id="ch2">
                                    </div>
                                    <span class="spanwid">(필수) 약관을 모두 읽고 동의합니다. 이용약관</span>
                                </div>
                                <div class="checkdiv  marb">  
                                    <div class="checkicon">
                                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                                        <input type="checkbox" class="ck" id="ch3">
                                    </div>
                                    <span class="spanwid">본인은 개인정보취급방침을 모두 읽고 이해하였습니다. 개인정보 수집ㆍ이용 동의</span>
                                </div>
                                <div class="checkdiv  marb">  
                                    <div class="checkicon">
                                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                                        <input type="checkbox" class="ck" id="ch4">
                                    </div>
                                    <span class="spanwid">(필수) 개인정보 처리 위탁에 동의합니다.개인정보 처리 위탁</span>
                                </div>
                                <div class="checkdiv  marb">  
                                    <div class="checkicon">
                                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                                        <input type="checkbox" class="ck" id="ch5">
                                    </div>
                                    <span class="spanwid">(필수) 개인정보 국외이전에 동의합니다.개인정보 국외이전</span>
                                </div>
                              
                                <div><button id="signupBtn" class="joinBtn" type="submit" onclick="return checkData();">가입하기</button></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>

	<script>
    //조건값으로 사용하기 위해 변수 설정
       var familyName=false;
       var givenName=false;
       var birth=false;
       var phone=false;
       var email=false;
       var pw=false;
       var adr1=false;
       var adr2=false;
       var adr3=false;
       
        $("#zip").focus(e=>{
            $("#zip").removeClass("active");
            return false;
        });
        $(".checkdiv").click(e=>{//체크 박스 선택 체크 확인
            var ch=$(e.target).find("[type=checkbox]");
            var i1=$(e.target).find(".i1");
            var i2=$(e.target).find(".i2");
            if($(ch).prop("checked")==false){
                $(i1).css("color","white");
                $(i2).css("color","#0058a3");
                $(ch).prop("checked",true);
            }else if($(ch).prop("checked")==true){
                $(i1).css("color","#0058a3");
                $(i2).css("color","white");
                $(ch).prop("checked",false);
            }
        });
        
        $("#fname").on("blur",e=>{//성이 아무것도 안적혔을 때 처리
          firstNameCheck();
        })
        
        $("#name").on("blur",e=>{//성이 아무것도 안적혔을 때 처리
          nameCheck();
        })

        $("#bir").on("blur",e=>{//생일이 안적혔을 때
         birthCheck();
        })


        $("#ph").on("blur",e=>{//휴대폰이 안적혔을 때
            phoneCheck();
        })

        $("#email").on("blur",e=>{//이메일이 안적혔을 때
         emailCheck();
        })

        $("#pw").on("blur",e=>{//비밀번호가 안적혔을 때
           pwCheck();
        })

        $("#pw").keyup(e=>{//비밀번호의 조건마다 밑에 글씨색을 바꿈.
            var val=$(e.target).val();
            var len=$(e.target).val().length;

            var t1=/[a-z]+/;
            var t2=/[A-Z]+/;
            var t3=/[0-9!@#$%^&*()-+=`~]+/;
            
            var ch=0;

            if(len>=8&&len<=20){
                $("#pwch1").css("color","#0058a3");
            }else{
                 $("#pwch1").css("color","#000000");
               // $("#pwch1").css("color","red");
                $(e.target).addClass("errorred");
            }
            if(t1.test(val)){
                $("#pwch2").css("color","#0058a3");
            }else{
                 $("#pwch2").css("color","#000000");
                //$("#pwch2").css("color","red");
                $(e.target).addClass("errorred");
            }
            if(t2.test(val)){
                $("#pwch3").css("color","#0058a3");
            }else{
                 $("#pwch3").css("color","#000000");
                //$("#pwch3").css("color","red");
                $(e.target).addClass("errorred");
            }
            if(t3.test(val)){
                $("#pwch4").css("color","#0058a3");
            }else{
                 $("#pwch4").css("color","#000000");
                //$("#pwch4").css("color","red");
                $(e.target).addClass("errorred"); 
            }
            if((len>=8&&len<=20)&&t1.test(val)&&t2.test(val)&&t3.test(val)){
                $(e.target).removeClass("errorred");
                $(e.target).addClass("pass");
            }else{
                $(e.target).removeClass("pass");
                $(e.target).addClass("errorred");
            }
        })

        $("#pw").focus(e=>{
            $(".pwfs").css("display","block");
            $(".pwfsb").css("display","block");
        })

        $("#detailadr").on("blur",e=>{//상세주소가 안적혔을 때
         detailadr();
        })
        
        $("#bir").focus(e=>{
           $(e.target).attr("placeholder","YYYY-MM-DD");
        })
        
        function checkData(){//모든 조건을 만족해야 submit버튼을 활성화 시킴.
           if($("#zip").val().length>0&&$("#adrinput").val().length>0){
              adr1=true;
              adr2=true;
           }
        	emailCheck();
           if($("#ch2").prop("checked")&&$("#ch4").prop("checked")&&$("#ch5").prop("checked")){
           if(familyName&&givenName&&birth&&phone&&email&&pw&&adr1&&adr2&&adr3){
        	   $('#signupBtn').css("display","none");
              return true;
           }
           }
           return false;
        }
        
        function firstNameCheck(){
        	 var v=$("#fname").val().length;
        	           if(v==0){
        	                $("fname").addClass("errorred");
        	                $("#fnspan").css("display","block");
        	                familyName=false;
        	           }else{
        	            $("fname").removeClass("errorred");
        	            $("#fnspan").css("display","none");
        	            familyName=true;
        	           }
        	}

        	function nameCheck(){
        	  var v=$("#name").val().length;
        	           if(v==0){
        	                $("#name").addClass("errorred");
        	                $("#nspan").css("display","block");
        	                givenName=false;
        	           }else{
        	            $("#name").removeClass("errorred");
        	            $("#nspan").css("display","none");
        	            givenName=true;
        	           }
        	}


        	function birthCheck(){
        	  $("#bir").attr("placeholder",'');
        	            var v=$("#bir").val().length;//값 길이
        	            var val=$("#bir").val();//값
        	            var toyear=new Date().getFullYear();
        	            var inyear=val.substr(0,4);
        	            console.log(toyear-inyear);
        	            var reg2= /^[0-9]*$/;
        	            if(v==8&&reg2.test(val)){
        	                val=val.substr(0,4)+"-"+val.substr(4,2)+"-"+val.substr(6,2);
        	                $("#bir").val(val);
        	            }
        	            if((toyear-inyear)<=14){
        	                $("#bir").addClass("errorred");
        	                $("#birspan").css("display","block");
        	                $("#birspan").html("만 15세 이상 이여야 합니다.");
        	                birth=false;
        	                return false;
        	            }else{
        	                $("#birspan").css("display","none");
        	                birth=true;
        	            }
        	            var reg=/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g;  
        	           if(v==0){
        	                $("#bir").addClass("errorred");
        	                $("#birspan").css("display","block");
        	                $("#birspan").html("생일은 필수 필드입니다.");
        	                birth=false;
        	           }else{
        	            $("#bir").removeClass("errorred");
        	            $("#birspan").css("display","none");
        	            birth=true;
        	           }
        	           if(v>=1){
        	            if(reg.test(val)){
        	                $("#bir").removeClass("errorred");
        	                $("#birspan").css("display","none");
        	                birth=true;
        	            }else{
        	                $("#bir").addClass("errorred");
        	                $("#birspan").css("display","block");
        	                $("#birspan").html("YYYY-MM-DD 형식으로 작성해야합니다.");
        	                birth=false;
        	            }
        	           }
        	        }

        	function phoneCheck(){
        		var v=$("#ph").val().length;
        	            var val=$("#ph").val();
        	            var reg2= /^[0-9]*$/g;
        	            if(v==11&&reg2.test(val)){
        	                val=val.substr(0,3)+"-"+val.substr(3,4)+"-"+val.substr(7,4);
        	                $("#ph").val(val);
        	                phone=true;
        	            }
        	           if(v==0){
        	                $("#ph").addClass("errorred");
        	                $("#ph").removeClass("pass");
        	                $("#phspan").css("display","block");
        	                $("#phspan").html("휴대폰 번호는 필수 필드입니다.");
        	                phone=false;
        	           }else{
        	            $("#ph").removeClass("errorred");
        	            $("#phspan").css("display","none");
        	            phone=true;
        	           }
        	           if(v>0){
        	                var reg=/^[01]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}/g;
        	                if(reg.test(val)){
        	                    $("#ph").removeClass("errorred");
        	                    $("#phspan").css("display","none");
        	                    phone=true;
        	                }else{
        	                    $("#ph").addClass("errorred");
        	                    $("#phspan").css("display","block");
        	                    $("#phspan").html("휴대폰 번호가 올바르지 않습니다.");
        	                    phone=false;
        	                }       
        	           }
        	}

        	function emailCheck(){

        	 var v=$("#email").val().length;
        	            var val=$("#email").val();
        	           if(v==0){
        	                $("#email").addClass("errorred");
        	                $("#emailspan").css("display","block");
        	                $("#emailspan").html("이메일은 필수 필드입니다.");
        	                email=false;
        	           }else{
        	            $("#email").removeClass("errorred");
        	            $("#emailspan").css("display","none");
        	            email=true;
        	           }
        	           if(v>=1){
        	            let reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g;
        	            if(reg.test(val)){
        	                $("#email").removeClass("errorred");
        	                $("#emailspan").css("display","none");
        	                email=true;
        	            }else{
        	                $("#email").addClass("errorred");
        	                $("#emailspan").css("display","block");
        	                $("#emailspan").html("이메일 형식이 올바르지 않습니다.");
        	                email=false;
        	            }
        	           }
        	           $.ajax({
        				   url:"${path}/member/emailCh.do",
        				   data:{"id":$("#email").val()},
        				   success: data => {
        					   if(data==false){
        						console.log(data);
        					   }else{
        						   let a=$("#email").val();
        						   let reg=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g;
        						   if(reg.test(a)){
        						   $("#email").addClass("errorred");
        					   $("#emailspan").html('이메일이 존재합니다.');
        					   $("#emailspan").css('display','block');
        					   $("#email").focus();
        						   }
        					   }
        					}
        			   }) 

        	}

        	function pwCheck(){
        	  var v=$("#pw").val().length;
        	           if(v==0){
        	                $("#pw").addClass("errorred");
        	                $("#pwspan").css("display","block");
        	                $("#pwspan").html("비밀번호는 필수 필드입니다.");
        	                $(".pwfs").css("display","none");
        	                $(".pwfsb").css("display","none");
        	                pw=false;
        	           }else{
        	            $("#pw").removeClass("errorred");
        	            $("#pwspan").css("display","none");
        	            pw=true;
        	           }
        	           if(v>0){
        	               var val=$("#pw").val();
        	               let reg=/^(?=.*?[A-Z])(?=.*?[a-z])((?=.*?[0-9])|(?=.*?[#?!@$%^&*-])).{8,20}$/;
        	               if(reg.test(val)){
        	                $("#pw").removeClass("errorred");
        	                $("#pwspan").css("display","none");
        	                $(".pwfs").css("display","none");
        	                $(".pwfsb").css("display","none");
        	                pw=true;
        	               }else{
        	                $("#pw").addClass("errorred");
        	                $("#pw").removeClass("pass");
        	                $("#pwspan").css("display","block");
        	                $("#pwspan").html("비밀번호 형식이 올바르지 않습니다.");
        	                pw=false;
        	               }
        	           }
        	}

        	function detailadr(){
        	  var v=$("#detailadr").val().length;
        	           if(v==0){
        	                $("#detailadr").addClass("errorred");
        	                $("#adrspan").css("display","block");
        	                adr3=false;
        	           }else{
        	            $("#detailadr").removeClass("errorred");
        	            $("#adrspan").css("display","none");
        	            adr3=true;
        	           }
        	}
        
        
    </script>
   <script>
        /* 주소검색 api */
     $("#adrbtn").click(e=>{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            var test=data.postcode;
         console.log(test);
         console.log(data.zonecode);
            
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }
         
            console.log(data.zonecode+" : "+addr);
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zip").val(data.zonecode);
            $("#adrinput").val(addr);
            $("#zip").attr("disabled",false);
            $("#adrinput").attr("disabled",false);
            $("#zip").attr("readonly",true);
            $("#adrinput").attr("readonly",true);
            // 커서를 상세주소 필드로 이동한다.
            $("#detailadr").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
     })
   </script>
    
   
   <jsp:include page="/WEB-INF/views/common/footer.jsp"/>