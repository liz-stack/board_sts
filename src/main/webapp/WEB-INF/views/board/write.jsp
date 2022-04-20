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

      <%--  <div>
               <c:if test="${ id eq board.user_no }">
                   <form action="/board/remove" method="POST">
                       <input type="hidden" name="boardNo" value="${ board.num }">
                       <input type="hidden" name="pageNo" value="${ pageNum }">
                       <button type="submit" class="btn btn-primary">게시글 삭제</button>
                   </form>
                   <button onclick="location.href='/board/modify?boardNo=${ board.num }&pageNo=${ pageNo }'">수정</button>
               </c:if>
        </div>--%>
        <!-- Contact Section Form-->
        <form action="#" method="post" enctype="multipart/form-data" id="writeForm">
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
                <input type="password" class="form-control" id="verifyPassword" placeholder="비밀번호 확인">
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <textarea class="form-control" id="title" rows="1"></textarea>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" rows="20"></textarea>
            </div>
            <%--TODO: 220420 취소 버튼 누르면 sql에러. pk를 ai로 바꿔줘야한다는데 fk에러--%>
            <input type="submit" id="cancelWrite" value="취소" class="button" onclick="location.href='board/list.jsp'">
            <input type="submit" id="saveWrite" value="저장" class="button">
        </form>

    </div>
</section>
<script>

</script>
<%@ include file="../layout/footer.jsp" %>
