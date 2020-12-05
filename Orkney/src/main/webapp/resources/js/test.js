/* tab누르면 content 바뀌는 로직 */
function fn_tab(e, panelNo){
    $(e).parent().children().attr('class','mypage-nonactive');
    $(e).attr('class','mypage-active');
    $('.panel').css('display','none');
    $('.'+panelNo).css('display','block');
}


/* 주소 api */
$(".addAddressBtn").click(e=>{
//클릭한 주소찾기 버튼의 인덱스
var addAddressBtnIindex = $('.addAddressBtn').index(e.target);
//       $('.addr').eq(addAddressBtnIindex).addClass('addr'+addAddressBtnIindex);
//       $('.post').eq(addAddressBtnIindex).addClass('post'+addAddressBtnIindex);
console.log($(e.target));
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
            $('.post').eq(addAddressBtnIindex).val(data.zonecode);
            $('.addr').eq(addAddressBtnIindex).val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#detailadr").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
})

$(function(){
personalFlag1 = true;
personalFlag2 = true;
contactFlag = true;
passwordFlag1 = false;
passwordFlag2_1 = false;
passwordFlag2_2 = false;
passwordFlag2_3 = false;
passwordFlag2_4 = false;
passwordFlag2_5 = false;
passwordFlag3 = false;
})

function fn_update_personal(e){
	if($(e).text() == '수정'){
		 $.ajax({
	         url : "${path}/member/personalJspUpdate.do",
	         success : function(result) {
	             $("#jjjj").html(result);
	         }
	     });
		$.ajax({ //현재 로그인 된 사용자 정보 받아오기
	        type: 'post',
	        url: "${path}/member/currentMemberInformation.do",
	        dataType: "json",
	        success: data=>{
	            console.log(data);
	            $('#update-name-input').val(data['member_name']);
	            $('#update-birth-input').val(data['birthday']);
	            $('#update-phone-input').val(data['phone']);
	        }
	    })
	} else{ //닫기누를떄
		$('#jjjj').empty();
	    $(i).text('수정');
	}
}


/* 수정 누르면 열리게 하는 로직 */
function fn_update(i,id){
if($(i).text() == '수정'){ //수정누를떄
    $(i).parent().nextAll().hide();
    $(id + '-box').show();
    $(i).text('닫기');
    
    console.log(personalFlag1);
    console.log(personalFlag2);
    
    $.ajax({ //현재 로그인 된 사용자 정보 받아오기
        type: 'post',
        url: "${path}/member/currentMemberInformation.do",
        dataType: "json",
        success: data=>{
            console.log(data);
            $('#update-name-input').val(data['member_name']);
            $('#update-birth-input').val(data['birthday']);
            $('#update-phone-input').val(data['phone']);
        }
    })
    
    //수정창 열어서 이름 클릭 시 (체크 : not-null)
    $('#update-name-input').blur(e=>{
        
        if($(e.target).val() == ''){
            personalFlag1 = false;
            
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
            $(e.target).next().next().css('display','block');
            
        } else {
            personalFlag1 = true;
            
            $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
            $(e.target).next().next().css('display','none');
        }
        }).click(e=>{
            $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
            $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
        }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
        
    })
        
        //수정창 열어서 생일 클릭시 (체크 : not-null, 형식)
    $('#update-birth-input').blur(e=>{
        
        if($(e.target).val() == ''){
            personalFlag2 = false;
            
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
            $(e.target).next().next().css('display','block');
            $('#birth-type-ck').css('display','none');
            $('#birth-age-ck').css('display','none');
            } else {
            
            $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
            $(e.target).next().next().css('display','none');
            
            var v=$(e.target).val().length;//값 길이
            var val=$(e.target).val();//값
            var toyear=new Date().getFullYear();
            var inyear=val.substr(0,4);
            var reg=/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g;
            var reg2= /^[0-9]*$/;
            
            if (v == 8 && reg2.test(val)){ //여덟글자 쓰고 조건 ok일 때
                personalFlag2 = true;
            
                val=val.substr(0,4)+"-"+val.substr(4,2)+"-"+val.substr(6,2);
                console.log(val);
                $(e.target).val(val);
                $('#birth-type-ck').css('display','none');
            } else if(reg.test(val)){ //-쓰고 조건 ok일 때
                personalFlag2 = true;
            
                $('#birth-type-ck').css('display','none');
            
            } else { //조건 만족 안할 때
                personalFlag2 = false;
                
                //"YYYY-MM-DD 형식으로 작성해야합니다.
                $('#birth-type-ck').css('display','block');
            }
            
            if((toyear-inyear)<=14){
                personalFlag2 = false;
                
                //만 15세 이상 이여야 합니다. msg 띄우기
                $('#birth-age-ck').css('display','block');
            } else{
                personalFlag2 = true;
                $('birth-age-ck').css('display','none');
            }
            }
        
    }).click(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});

    }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
    })
    
    //수정창 열어서 연락처 클릭 시 (체크 : not-null, 형식 )
    $("#update-phone-input").blur(e=>{
        if($(e.target).val() == ''){
            contactFlag = false;
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
            $(e.target).next().next().css('display','block');
            $('#phone-type-ck').css('display','none');

            } else {
            $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
            $(e.target).next().next().css('display','none');
    
            var v=$(e.target).val().length;
            var val=$(e.target).val();
            var reg2= /^[0-9]*$/g;
                var reg=/^[01]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}/g;
            
            if(v==11&&reg2.test(val)){
                contactFlag = true;
                val=val.substr(0,3)+"-"+val.substr(3,4)+"-"+val.substr(7,4);
                $(e.target).val(val);
                $('#phone-type-ck').css('display','none');
            } else if(reg.test(val)){
                contactFlag = true;
                $('#phone-type-ck').css('display','none');
            } else {
                contactFlag = false;
                $('#phone-type-ck').css('display','block');
            }
            }  
    }).click(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
    }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
    })
    
//          //수정창 열어서 현재 비밀번호 클릭 시 (체크 : not-null )
    $('#update-originPw-input').blur(e=>{
        if($(e.target).val() == ''){
            passwordFlag1 = false;
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
            $(e.target).next().next().css('display','block');
        } else {
            passwordFlag1 = true;
            $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
            $(e.target).next().next().css('display','none');
            $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
            
        }
    }).click(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
    }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
        
    })
    
//          //수정창 열어서  새 비밀번호 클릭 시 (체크 : not-null, 형식 )
    $('#update-newPw-input').blur(e=>{
        if($(e.target).val() == ''){
            passwordFlag2_1 = false;
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
            $(e.target).next().next().css('display','block');
            $("#newPw-type-ck, #newPw-type-ck-ul").css('display','none');
        } else {
            passwordFlag2_1 = true;
            $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
            $(e.target).next().next().css('display','none');
            $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
            
            
        }
    }).click(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
        $(e.target).next().next().css('display','none');
        $("#newPw-type-ck, #newPw-type-ck-ul").css('display','block');
        
    }).keyup(e=>{//비밀번호의 조건마다 밑에 글씨색을 바꿈.
            var val=$(e.target).val();
            var len=$(e.target).val().length;

            var t1=/[a-z]+/;
            var t2=/[A-Z]+/;
            var t3=/[0-9!@#$%^&*()-+=`~]+/;
            
            var ch=0;

            if(len>=8&&len<=20){
                passwordFlag2_2 = true;
                $("#ul1").css({"color":"#0058a3", "font-weight":"500"});
            }else{
                passwordFlag2_2 = false;
                $("#ul1").css({"color":"#212529", "font-weight":"100"});
            }
            if(t1.test(val)){
                passwordFlag2_3 = true;
                $("#ul2").css({"color":"#0058a3", "font-weight":"500"});
            }else{
                passwordFlag2_3 = false;
            $("#ul2").css({"color":"#212529", "font-weight":"100"});
            }
            if(t2.test(val)){
                passwordFlag2_4 = true;
            $("#ul3").css({"color":"#0058a3", "font-weight":"500"});
            }else{
                passwordFlag2_4 = false;
            $("#ul3").css({"color":"#212529", "font-weight":"100"});
            }
            if(t3.test(val)){
                passwordFlag2_5 = true;
            $("#ul4").css({"color":"#0058a3", "font-weight":"500"});
            }else{
                passwordFlag2_5 = false;
            $("#ul4").css({"color":"#212529", "font-weight":"100"});
            }
            console.log("키업 프래그2" + passwordFlag2_1 + passwordFlag2_2 + passwordFlag2_3 + passwordFlag2_4 + passwordFlag2_5);
        }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
        $(e.target).next().next().css('display','none');
        $("#newPw-type-ck, #newPw-type-ck-ul").css('display','block');
        
    })
    
        //수정창 열어서 새 비밀번호 확인 창 클릭 시 (not null, 동일비밀번호체크)
    $('#update-newPwCk-input').blur(e=>{
        if($(e.target).val() == ''){
            passwordFlag3 = false;
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
            $(e.target).next().next().css('display','block');
            $("#newPwCk-eq-ck").css('display','none');
        } else {
            $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
            $(e.target).next().next().css('display','none');
            $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
            
            console.log($("#update-newPw-input").val() + "/" + $("#update-newPwCk-input").val());
            if($("#update-newPw-input").val() != $("#update-newPwCk-input").val()){
                passwordFlag3 = false;
            $(e.target).next().next().css('display','none');
            $("#newPwCk-eq-ck").css('display','block');
            } else {
                passwordFlag3 = true;
            $("#newPwCk-eq-ck").css('display','none');
            }
        }   
        
        
    }).click(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
    }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
        
    })
    //기본주소 수정창 열어서 상세주소 클릭 시 (not null)
    $('#update-addrDetail-input').blur(e=>{
        if($(e.target).val() == ''){
            $(e.target).css({'color':'red','border-bottom':'2px solid'});
            $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
            $(e.target).next().next().css('display','block');
        } else {
            $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
            $(e.target).next().next().css('display','none');
        }
        }).click(e=>{
            $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
            $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
        }).focus(e=>{
        $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
        $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
    })
    

//========================================================================================================================================================         
    
    //이름 생일 정보수정
    $('#personal-submit').click(function(e){
        console.log(personalFlag1);
        console.log(personalFlag2);
        if(personalFlag1 == false || personalFlag2 == false) {
            return;
        }
        $.ajax({
            type: 'post',
            url: "${path}/member/updateMemberPersonal.do",
            data: $('#personal-submit-form').serialize(),            
            success: data=>{
            console.log(data);
            console.log($(i));
            $(i).parent().nextAll().css('display','flex');
            $(id + '-box').hide();
            $(i).text('수정');
            $('#updateName').text(data["name"]);
            $('#title-name').text(data["name"]);
            $('#updateBirth').text(data['birth']);
            alert('개인정보가 저장되었습니다.');
            }
        })
    })
    
    //전화번호 수정
    $('#contact-submit').click(function(e){
        if(!contactFlag){
            return;
        }
        $.ajax({
            type: 'post',
            url: "${path}/member/updateMemberContact.do",
            data: $('#contact-submit-form').serialize(),            
            success: data=>{
            console.log(data);
            console.log($(i));
            $(i).parent().nextAll().css('display','flex');
            $(id + '-box').hide();
            $(i).text('수정');
            $('#updatePhone').text(data["phone"]);
            alert('연락처가 저장되었습니다.');
            }
        })
    })
    
    //비밀번호 수정
    $('#password-submit').click(function(e){
        if(!passwordFlag1 || !passwordFlag2_1 || !passwordFlag2_2 || !passwordFlag2_3 || !passwordFlag2_4 || !passwordFlag2_5 || !passwordFlag3){
            return;
        }
        $.ajax({
            type: 'post',
            url: "${path}/member/updateMemberPassword.do",
            data: $('#password-submit-form').serialize(),            
            success: data=>{
            console.log(data);
            console.log($(i));
            if(data == -2){
                alert('현재 패스워드가 맞지 않습니다.')
            } else {
                $(i).parent().nextAll().css('display','flex');
                $(id + '-box').hide();
                $(i).text('수정');
                if(data > 0){
                    alert('패스워드가 변경되었습니다.');
                } else{
                    alert('패스워드 변경에 실패하였습니다.');
                }
            }
            }
        })
    })
    
    
} else{ //닫기누를떄
    $(i).parent().nextAll().css('display','flex');
    $(id + '-box').hide();
    $(i).text('수정');
}
}









/* 새 배송지 추가 누르면 열리는 버튼*/
$(function(){
$('.addAddrBtn').click(function(e){
    if($(e.target).text() == '새 배송 주소 추가'){ //수정누를떄
        
        $(e.target).text('주소 추가 창 닫기')
        $('#addAddrBtn-updatebox').css('display','block');
    } else {
        $(e.target).text('새 배송 주소 추가')
        $('#addAddrBtn-updatebox').css('display','none');
        
    }
})
})

/*    새 배송지 칸에서 수정 누르면  업데이트 창 나오게*/
function fn_addAddrUpdate(e){
var cs = ($(e).attr('class')).split(' ');
var c = cs[1]; //두번째 클래스 네임 가져오기
var i = (cs[1].split('-'))[2];
console.log(i);
if($(e).text() == '수정'){ //수정 누르면
        console.log($('.addr-disappear-'+i).attr('class'));
//          $.ajax({
//             url: '/'
//          })



    if($('.addr-disappear-'+i).attr('class') == 'addr-disappear-'+i){
        $('.addr-disappear-'+i).css('display','none');
        $('.addr-disappear-'+i).next('hr').css('display','none');
        $('.addr-update-box-'+i).css({'display':'block','margin-top':'0'});
        $(e).text('닫기');
    } 
    
} else {
    $('.addr-disappear-'+i).css('display','block');
    $('.addr-disappear-'+i).next('hr').css('display','block');
    $('.addr-update-box-'+i).css('display','none');
    $(e).text('수정');
    
}
}