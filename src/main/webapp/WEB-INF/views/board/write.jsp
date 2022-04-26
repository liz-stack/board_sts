<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Date" %>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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
            <form name="form" method="post" id="writeForm" enctype="multipart/form-data"
                  onsubmit="return checkAll()">
                <%--  <input type="hidden" name="boardNo" value="${}">--%>
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
                    <input type="password" class="form-control" id="verifyPassword" name="verifyPassword"
                           placeholder="비밀번호 확인">
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <textarea class="form-control" id="title" name="title" rows="1"></textarea>
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <textarea class="form-control" id="content" name="content" rows="15"></textarea>
                </div>
                <div>
                    <input type="hidden" class="form-control" name="">
                </div>
                <%--SOLVED: 220420 취소 버튼 누르면 sql에러. pk를 ai로 바꿔줘야한다는데 fk에러 (input type 바꿔서 해결)--%>
                <%--TODO: 220421 취소,저장 버튼 alert--%>
                <input type="button" class="btn btn-secondary" id="cancelWrite" value="취소"
                       onclick="location.href='/board/list'"></input>
                <input type="submit" class="btn btn-secondary" id="saveWrite" value="저장" class="button"
                       style="float: right"></input>
            </form>
        </section>
    </div>
</div>
<script>
    /*$('#saveWrite').click(function () {

        var title = $("#title").val();
        var userName = $("#userName").val();
        var content = $("#content").val();
        var password = $("#password").val();
        var verifyPassword = $("#verifyPassword").val();

        if (!title) {
            alert("제목을 입력해주세요");
            return false;
        } else if (!userName) {
            alert("작성자를 입력해주세요");
            return false;
        } else if (!content) {
            alert("내용을 입력해주세요");
            return false;
        } else if (!password && !verifyPassword) {
            alert("비밀번호를 입력해주세요");
            return false;
        }

        if (password != verifyPassword) {
            alert("비밀번호가 일치 하지 않습니다");
            return false;
        } else {
            alert("게시글이 등록되었습니다.");
            return true;
        }
    });*/

    // -------------------------------------
 $(document).ready(function () {


     function chaeckAll() {
         // 이름 체크
         var userName = document.getElementById('userName');
         if (userName.value == "" || userName.value.length > 3) {
             alert('이름을 입력하시오.');
             userName.focus();
         }

         // 비밀번호 체크
         var password = document.getElementById('password');
         if (password.value.length < 3 || password.value.length > 13) {
             alert('비밀번호는 3자이상 12자이하로 입력하세요.');
             password.select();
             return false;
         }
         // 비밀번호 확인 체크
         var verifyPassword = document.getElementById('verifyPassword');
         if (password.value != verifyPassword.value) {
             alert('암호가 다릅니다. 다시 입력하세요.');
             password.select();
             verifyPassword.value = "";
         }
         // 제목 체크
         var title = document.getElementById('title');
         if (title.value.length < 2 || title.value.length > 6) {
             alert('이름 2자이상 5자이하로 입력하세요.');
             title.select();
             return false;

         }
         var content = document.getElementById('content');
         if (content.value.length < 2 || content.value.length > 6) {
             alert('이름 2자이상 5자이하로 입력하세요.');
             content.select();
             return false;
         }
     }
 });
</script>
<%@ include file="../layout/footer.jsp" %>
