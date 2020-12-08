<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
 
 
    
    
<style>
   .enBtn{
      border-radius:20px;
      padding:.625rem 1.25rem .625rem 1.25rem;
      font-weight:600;
   }
</style>


<footer class="page-footer font-small pt-4" style="background-color:gray;color:white;">

  <!-- Footer Links -->
  <div class="container text-center text-md-left">

    <!-- Footer links -->
    <div class="row text-center text-md-left mt-3 pb-3">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">KKEA CREW</h6>
        <p>KKEA CREW에 가입하고 다양한 혜택을 즐겨보세요</p>
        <button class="btn btn-black enBtn">KKEA CREW 가입하기</button>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">고객문의</h6>
        <p>
          <a href="#!">고객지원</a>
        </p>
        <p>
          <a href="#!">배송조회</a>
        </p>
        <p>
          <a href="#!">문의하기</a>
        </p>
        <p>
          <a href="#!">품질보증</a>
        </p>
      </div>
      <!-- Grid column -->

      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">KKEA 이야기</h6>
        <p>
          <a href="#!">기업 소개</a>
        </p>
        <p>
          <a href="#!">이벤트</a>
        </p>
        <p>
          <a href="#!">회원가입</a>
        </p>
        <p>
          <a href="#!">Help</a>
        </p>
      </div>

      <!-- Grid column -->
      <hr class="w-100 clearfix d-md-none">

      <!-- Grid column -->
      <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
        <h6 class="text-uppercase mb-4 font-weight-bold">이용약관</h6>
        <p>
          <i class="fas fa-home mr-3"></i> 개인정보처리 방침</p>
        <p>
          <i class="fas fa-envelope mr-3"></i>웹사이트 이용약관</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 80 234 567 8</p>
        <p>
          <i class="fas fa-print mr-3"></i>KKEA@gmail.com</p>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Footer links -->

    <hr>

    <!-- Grid row -->
    <div class="row d-flex align-items-center">

      <!-- Grid column -->
      <div class="col-md-7 col-lg-8">

        <!--Copyright-->
        <p class="text-center text-md-left">© 2020 Copyright:
          <a href="#">
            <strong> Orkney. All Right Reserved.</strong>
          </a>
         <pre style="color:white;">ORKNEY 코리아
주소 : (우) 14352 경기도 성남시 분당구  ORKNEY분당본사
사업자 등록번호 : 186-XX-82XX1 사업자정보확인
대표자 : 강세영
통신판매업 신고 : 2XX8-경기분당-02XX
      </pre>
        </p>

      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-5 col-lg-4 ml-lg-0">

        <!-- Social buttons -->
        <div class="text-center text-md-right">
          <ul class="list-unstyled list-inline">
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-facebook-f"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-twitter"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-google-plus-g"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a class="btn-floating btn-sm rgba-white-slight mx-1">
                <i class="fab fa-linkedin-in"></i>
              </a>
            </li>
          </ul>
        </div>

      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row -->

  </div>
  <!-- Footer Links -->

</footer>
<!-- Footer -->

 
 
</body>
</html>