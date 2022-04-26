<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>


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
            <form name="form" method="post" id="writeForm" action="${path}/board/write" onsubmit="return checkAll()">
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

    function checkAll() {
        if (!checkUserName(form.username.value)) {
            console.log("작성자 이름확인")
            return false;
        } else if (!checkPassword(form.password.value,
            form.verifyPassword.value)) {
            console.log("비밀번호 확인")
            return false;
        } else if (!checkTitle(form.title.value)) {
            console.log("제목 확인")
            return false;
        } else if (!checkContent(form.content.value)) {
            console.log("내용 확인")
            return false;
        }
        return true;
    }

    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }

    function checkUserName(userName) {
        //작성자명 입력되었는지 확인
        if (!checkExistData(userName, "작성자를"))
            return false;

        var nameRegExp = /^[가-힣]{2,4}$/; //작성자 이름 유효성 검사
        if (!nameRegExp.test(userName)) {
            alert("이름은 2~4글자 한글로 입력해야합니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }

    function checkPassword(password, verifyPassword) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(password, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(verifyPassword, "비밀번호 확인을"))
            return false;

        var password1RegExp = /(^[a-zA-z0-9]|[`~!@@#$%^&*|₩₩₩'₩";:₩/?]){4,16}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password)) {
            alert("비밀번호는 영문,숫자, 특수문자 포함 4~16자리로 입력해야합니다!");
            form.password.value = "";
            form.verifyPassword.focus();
            return false;
        }
        //
        if (password != verifyPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            form.password.value = "";
            form.verifyPassword.value = "";
            form.verifyPassword.focus();
            return false;
        }
    }

    //TODO 220426 : select박스
    function checkCategory() {
        var checkCategory = document.getElementsByName("category");

        //체크된 값이 하나라도 있을경우 바로 true
        if (checkCategory.val()) {
            return true
        }
        alert("카테고리를 선택해주세요!");
        return false;
    }

    function checkTitle(title) {
        //작성자명 입력되었는지 확인
        if (!checkExistData(title, "제목을"))
            return false;
        if (title.length < 4 || title.length > 2000) {
            alert("제목은 4자 이상 16글자 미만이어야합니다.")
            return false;
        }
        return true; //확인이 완료되었을 때
    }

    function checkContent(content) {
        //작성자명 입력되었는지 확인
        if (!checkExistData(content, "내용을"))
            return false;
        if (content.length < 4 || content.length > 2000) {
            alert("내용은 4자 이상 2000자 미만이어야합니다.")
            return false;
        }
        return true; //확인이 완료되었을 때
    }

</script>

<%@ include file="../layout/footer.jsp" %>
