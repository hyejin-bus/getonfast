<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- JSTL c태그 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 프로젝트의 시작 주소를 간단히 얻어올 수 있도록 application scope로 contextPath라는 변수를 생성함--%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

<main>
    <section class="review">
        <div class="title" style="letter-spacing:-.5px;">이용 후기 관리</div>
        <div class="review_area">
            <div class="review_header">
                <ul class="header_tab_area">
                    <li><a href="${contextPath}/my/review" class="header_tab active">이용후기</a></li>
                    <li><a href="${contextPath}/my/qna" class="header_tab">Q&A</a></li>
                </ul>
                <!-- <div class="search_area">
                    <div class="search_title">예약 정보 검색</div>
                    <div class="input_area">
                        <input type="text" class="input search_input" placeholder="예약번호">
                    </div>
                    <div class="btn_area">
                        <input type="button" class="btn search_btn" value="검색">
                    </div>
                </div> -->
            </div>

            <!-- <div class="non_list_area">
                <div  class="non_list">
                    <span>현재 등록된 이용후기가 없습니다.</span>
                </div>
            </div> -->
            <div class="list_area">
            	<c:forEach items="${reviewList}" var="review">
            		<a href="${contextPath}/space/detail?no=${review.spaceNo}">
		            	<div class="list">
		                    <div class="img_area"><img class="list_img" src="${contextPath}${review.space.spaceImgPath}${review.space.spaceImgNm}"></div>
		                    <div class="content_area">
		                        <div class="title">${review.space.spaceNm}</div>
		                        <div class="content">${review.revContent}</div>
		                        <div class="date">${review.revDt}</div>
		                        <%--
		                        <div class="comment_area">
		                            <div class="comment_title">관리자 답글</div>
		                            <div class="content">후기 감사드립니다 :) 인생사진 저도 보고 싶어요! ㅎㅎㅎ 즐거운 시간 되셨다니 제가 더 감사드립니다~ 다음에 다시 찾아주세요♡</div>
		                            <div class="date">2021.11.27 00:41:10</div>
		                        </div>
		                        --%>
		                    </div>
		                </div>
                	</a>
            	</c:forEach>
            </div>
        </div>
    </section>
</main>


<!-- footer include -->
<jsp:include page="../common/footer.jsp"/>