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
<div class="contentContainer">
    <br/>
    <h2>게시판 - 등록</h2>
    <br/>
    <%--TODO: 220420 form좀 이쁘게 바꾸고 싶다--%>
    <div class="container">
        <section class="page-section" id="contact">
            <!-- Contact Section Heading-->


            <!-- Contact Section Form-->
            <form action="/board/write" method="post" id="writeForm" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="category">카테고리 선택</label>
                    <select class="form-control" id="category" name="category">
                        <option>JAVA</option>
                        <option>Javascript</option>
                        <option>Database</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="userName">작성자</label>
                    <input type="userName" class="form-control" id="userName" name="userName">
                </div>
                <div class="form-group">
                    <label for="password">비밀번호</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" id="verifyPassword" placeholder="비밀번호 확인">
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <textarea class="form-control" id="title" name="title" rows="1"></textarea>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="15"></textarea>
                </div>
                <%--SOLVED: 220420 취소 버튼 누르면 sql에러. pk를 ai로 바꿔줘야한다는데 fk에러 (input type 바꿔서 해결)--%>
                <%--TODO: 220421 취소,저장 버튼 alert--%>
                <input type="button" class="btn btn-secondary" id="cancelWrite" value="취소" onclick="location.href='/board/list'"></input>
                <input type="submit" class="btn btn-secondary" id="saveWrite" value="저장" class="button" style="float: right"></input>
            </form>
        </section>
    </div>
</div>
<script>

</script>
<%@ include file="../layout/footer.jsp" %>
