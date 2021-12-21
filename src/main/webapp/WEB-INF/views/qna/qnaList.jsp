<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- JSTL c태그 사용을 위한 taglib 추가 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- 프로젝트의 시작 주소를 간단히 얻어올 수 있도록 application scope로 contextPath라는 변수를 생성함--%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

<main>
    <section class="qna">
        <div class="title" style="letter-spacing:-.5px;">문의 관리</div>
        <div class="qna_area">
            <div class="qna_header">
                <ul class="header_tab_area">
                    <li><a href="${contextPath}/my/review" class="header_tab">이용후기</a></li>
                    <li><a href="${contextPath}/my/qna" class="header_tab active">Q&A</a></li>
                </ul>
                <div class="search_area">
                    <select class="selectbox select_area">
                        <option>전체</option>
                        <option>1:1문의</option>
                        <option>장소문의</option>
                    </select>
                </div>
            </div>

            <!-- <div class="non_list_area">
                <div  class="non_list">
                    <span>현재 등록된 문의가 없습니다.</span>
                </div>
            </div> -->
            <div class="list_area">
                <div class="list">
                    <div class="img_area"><img class="list_img" src="${contextPath}/resources/images/header/defaultUser.jpg"></div>
                    <div class="content_area">
                        <div class="title">1:1 문의 입니다.</div>
                        <div class="content">여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??여긴 뭐하는 곳인가요??</div>
                        <div class="date">2021.11.27 00:35:58</div>
                        <div class="comment_area">
                            <div class="comment_title">관리자 답글</div>
                            <div class="content">여긴 빌려줍니다. 여긴 빌려줍니다. 여긴 빌려줍니다. 여긴 빌려줍니다. 여긴 빌려줍니다. 여긴 빌려줍니다. 여긴 빌려줍니다.</div>
                            <div class="date">2021.11.27 00:41:10</div>
                        </div>
                    </div>
                </div>
                <div class="list">
                    <div class="img_area"><img class="list_img" src="${contextPath}/resources/images/space_img/sinchon.jpg"></div>
                    <div class="content_area">
                        <div class="title">파티살롱_촬영,회의,세미나,워크샵</div>
                        <div class="content">사장님 정말 친절하십니다 . 그리고 장소도 정말 예쁘고 좋아요 인생사진 여러개 얻었고 진짜 편하게 잘 즐기다가 갑니다!! 담에 또 이용할께요 감사합니다~</div>
                        <div class="date">2021.11.27 00:35:58</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"/>