<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <h2>게시판 - 등록</h2>
        <br/>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>

        <!-- Contact Section Form-->
        <form action="/board/write" method="post" enctype="multipart/form-data" id="writeForm">
            <label for="category">카테고리 선택</label>
            <select class="form-control" id="category">
                <option>JAVA</option>
                <option>Javascript</option>
                <option>Database</option>
            </select>
            <div class="form-group">
                <label for="writer">작성자</label>
                <input type="writer" class="form-control" id="writer">
            </div>
            <div class="form-group" >
                <label for="password" >비밀번호</label>
                <input type="password" class="form-control" id="password" placeholder="비밀번호">
            </div>
            <div class="form-group" >
                <input type="password" class="form-control" id="verifyPassword" placeholder="비밀번호 확인">
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <textarea class="form-control" id="title" rows="1"></textarea>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" rows="15"></textarea>
            </div>
            <%--SOLVED: 220420 취소 버튼 누르면 sql에러. pk를 ai로 바꿔줘야한다는데 fk에러 (input type 바꿔서 해결)--%>
            <%--TODO: 220421 취소,저장 버튼 alert--%>
            <input type="button" id="cancelWrite" value="취소" onclick="location.href='/board/list'"></input>
            <input type="submit" id="saveWrite" value="저장" class="button"></input>
        </form>

    </div>
</section>
<script>

</script>
<%@ include file="../layout/footer.jsp" %>
