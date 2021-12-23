<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- JSTL c태그 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%-- 프로젝트의 시작 주소를 간단히 얻어올 수 있도록 application scope로 contextPath라는 변수를 생성함--%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

<main>
  <section id="booking-wrap">
  <section class="booking-title">
    <div class="booking-img">
      <h3>공간 이름</h3><h3>결제 및 예약내역입니다.</h3>
    </div>
  </section>

    <section id="booking-info">
      <article class="booking-table">
        <div>
          <h4>예약내용</h4>
          <p class="bookingNo" style="float: right;">예약번호 : ${res.resNo}</p>
        </div>

        <div>
          <h5>결제일</h5>
          <p>${res.payDate}</p>
        </div>

        <div>
          <h5>예약공간</h5>
          <p>${res.spaceNm}, ${res.spaceRoomNm}</p>
        </div>

        <div>
          <h5>예약내용</h5>
          <p></p>
        </div>

        <div>
          <h5>예약인원</h5>
          <p>${res.resPersonnel}</p>
        </div>

        <div>
          <h5>요청사항</h5>
          <p>${res.req}</p>
        </div>

        <div>
          <h5>사용목적</h5>
          <p>${res.purpose}</p>
        </div>

      </article>
      <article class="booking-table">
        <div>
          <h4>예약자 정보</h4>
        </div>

        <div>
          <h5>예약자명</h5>
          <p>${res.resNm}</p>
        </div>
        <div>
          <h5>연락처</h5>
          <p>${res.resPno}</p>
        </div>
        <div>
          <h5>이메일</h5>
          <p>${res.resEmail}</p>
        </div>

      </article>
      <article class="booking-table">
        <div>
          <h4>환불규정 안내</h4>
        </div>
  
        <div>
          <h5 style="width: 90%; color: rgb(214, 0, 0); font-weight: bold;">이용당일(첫 날)에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다</h5>
          <p> 환불규정 가져오기</p>
        </div>
        
      </article>
      <article class="booking-table">
        <div style="background-color: white; ">
          <h4>예약공간 이름</h4>
        </div>
        
        <div>
          <p>
          	<span>주소</span>
          	${res.spaceAddr}
          </p>
          <p>
          	<span>전화번호</span>
          	${res.spacePno}
          </p>
        </div>

<!--         <div>
          <a href="" class="">전화걸기</a>
          <a href="">길찾기</a>
        </div> -->

        <div class="map-aip">
        	<img src="${contextPath}${res.spaceMapPath}${res.spaceMapImg}" width="100%" height="100%">
        </div>
        </article>
      
    </section>

    <aside id="cancel-control">
      <article class="cancel-info-box">
        <div>
          <h4>결제 금액</h4>
        </div>

        <div class="cancel-info-wrap cancel-bdPurple">
          <div>
            <h5>결제일</h5>
            <p> ${res.payDate}</p>
          </div>

          <div>
            <h5>예약일자</h5>
            <p> ${res.useDate}</p>
          </div>

          <div>
            <h5>예약인원</h5>
            <p> ${res.resPersonnel}</p>
          </div>

          <div class="cancel-bdPurple" style="margin-top: 10px;">
            <h5 style="width: 100px;" >총 결제금액</h5>
            <p style="width: 200px; text-align: right;"><fmt:formatNumber value="${res.spaceRoomPrice}" pattern="#,###"/>원</p>
          </div>
        </div>

        <div id="cancel-btn" class="btn"> 
          <a href="" >예약취소</a>
        </div>
      </article>
    </aside>

  </section>
</main>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"/>