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
<section class="page-section" id="contact">
    <div class="container">
        <!-- Contact Section Heading-->
        <h2
                class="page-section-heading text-center text-uppercase text-secondary mb-0">게시글
            상세보기</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon">
                <i class="fas fa-star"></i>
            </div>
            <div class="divider-custom-line"></div>
        </div>

        <div>
            <button type="button" class="btn btn-primary"
                    onclick="location.href='/board/list?pageNo=${ pageNo }&type=${ cri.type }&keyword=${ cri.keyword }'">
                게시글 목록
            </button>

            <%--   <c:if test="${ id eq board.user_no || no eq 'admin' }">
                   <form action="/board/remove" method="POST">
                       <input type="hidden" name="boardNo" value="${ board.num }">
                       <input type="hidden" name="pageNo" value="${ pageNum }">
                       <button type="submit" class="btn btn-primary">게시글 삭제</button>
                   </form>
                   <button onclick="location.href='/board/modify?boardNo=${ board.num }&pageNo=${ pageNo }'">수정</button>
               </c:if>--%>
        </div>
        <!-- Contact Section Form-->
        <form>
            <div class="form-group">
                <label for="exampleFormControlInput1">Email address</label>
                <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect1">Example select</label>
                <select class="form-control" id="exampleFormControlSelect1">
                    <option>카테고리</option>
                    <option>작성자</option>
                    <option>비밀번호</option>
                    <option>제목</option>
                    <option>내용</option>
                    <option>파일첨부</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlSelect2">Example multiple select</label>
                <select multiple class="form-control" id="exampleFormControlSelect2">
                    <option>1</option>
                    <option>2</option>
                    <option>3</option>
                    <option>4</option>
                    <option>5</option>
                </select>
            </div>
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Example textarea</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            </div>
        </form>

    </div>
</section>
<%@ include file="../layout/footer.jsp" %>
