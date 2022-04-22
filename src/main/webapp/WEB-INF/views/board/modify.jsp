<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Date" %>
<script>

</script>
<!-- Contact Section-->
<%--TODO: 220420 form좀 이쁘게 바꾸고 싶다--%>
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
        <br/>
        <h2>게시판 - 수정</h2>
        <br/>

        <!-- Contact Section Form-->
        <form action="/board/modify" method="post" enctype="multipart/form-data" id="writeForm">
            <div class="form-group">
                <label>카테고리</label>
                <span type="category" class="form-control" id="category" readOnly>${editBoard.category}</span>
            </div>
            <div class="form-group">
                <label>등록 일시</label>
                <span type="createDate" class="form-control" id="createDate" readOnly> <fmt:formatDate
                        pattern="yyyy-MM-dd HH:mm"
                        value="${editBoard.createDate}"/></span>
            </div>
            <div class="form-group">
                <label>수정 일시</label>
                <span type="modifyDate" class="form-control" id="modifyDate" readOnly><fmt:formatDate
                        pattern="yyyy-MM-dd HH:mm"
                        value="${editBoard.modifyDate}"/></span>
            </div>
            <div class="form-group">
                <label>조회수</label>
                <span type="viewCount" class="form-control" id="viewCount" readOnly>${editBoard.viewCount}</span>
            </div>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="writer" class="form-control" id="writer" value="${editBoard.userName}">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" placeholder="비밀번호">${editBoard.password}
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <textarea class="form-control" id="title" rows="1">${editBoard.title}</textarea>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" rows="20">${editBoard.content}</textarea>
            </div>
            <%--TODO: 220421 취소 버튼 alert--%>
            <input type="button" id="cancelWrite" value="취소" onclick="location.href='/board/list'"></input>
            <input type="submit" id="saveWrite" value="저장" class="button"></input>
        </form>

    </div>
</section>
<script>

</script>
<%@ include file="../layout/footer.jsp" %>
