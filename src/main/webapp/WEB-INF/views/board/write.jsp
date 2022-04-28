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
            <!-- Contact Section Form-->
            <%--form id: input 요소가 포함될 form 요소를 명시함--%>
            <form role="form" method="post" action="${path}/board/write" onsubmit="return checkAll()">
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
                    <input type="text" class="form-control" id="userName" name="userName">
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
                <%--SOLVED: 220420 취소 버튼 누르면 sql에러. pk를 ai로 바꿔줘야한다는데 fk에러 (input type 바꿔서 해결)--%>
                <%--TODO: 220421 취소,저장 버튼 alert--%>
                <input type="button" class="btn btn-secondary" id="cancleBtn" value="취소"
                       onclick="location.href='/board/list'">
                <input type="submit" class="btn btn-secondary" id="saveBtn" value="저장" class="button"
                       style="float: right">
            </form>
        </section>
    </div>
</div>
<%@ include file="../layout/footer.jsp" %>

<script>

    var category = document.getElementById("category");
    var userName = document.getElementById("userName");
    var password = document.getElementById("password");
    var verifyPassword = document.getElementById("verifyPassword");
    var title = document.getElementById("title");
    var content = document.getElementById("content");

    let userNameChk = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{3,5}$/;
    let passwordChk = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{4,16}$/; //비밀번호 유효성 검사


    function checkAll() {
        if (!checkUserName(userName.value)) {
            console.log("작성자 이름확인")
        } if (!checkPassword(password.value,
            verifyPassword.value)) {
            console.log("비밀번호 확인")
            return false;
        } if (!checkTitle(title.value)) {
            console.log("제목 확인")
            return false;
        } if (!checkContent(content.value)) {
            console.log("내용 확인")
            return false;
        }
        return true;
    }

    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요");
            event.preventDefault();
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

        if (!userNameChk.test(userName)) {
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

        if (!passwordChk.test(password, verifyPassword)) {
            alert("비밀번호는 영문,숫자, 특수문자 포함 4~16자리로 입력해야합니다!");
            return false;
        }
        //TODO 220428 여기서 화면전환됨
        if (password != verifyPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            password.value = "";
            verifyPassword.value = "";
            return false;
        }
        return true;
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

    //TODO 220426 : select박스
    function checkCategory() {
        //체크된 값이 하나라도 있을경우 바로 true
        if (checkCategory.val()) {
            return true
        }
        alert("카테고리를 선택해주세요!");
        return false;
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

<%--<script>
    $(document).ready(function(){
        $('#saveBtn').submit(function(e){
           return writeFormChk();
        });
    });

    function writeFormChk() {
        var category = document.getElementById("category");
        var userName = document.getElementById("userName");
        var password = document.getElementById("password");
        var verifyPassword = document.getElementById("verifyPassword");
        var title = document.getElementById("title");
        var content = document.getElementById("content");

        var userNameChk = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{3,5}$/;
        var passwordChk = /(^[a-zA-z0-9]|[`~!@@#$%^&*|₩₩₩'₩";:₩/?]){4,16}$/; //비밀번호 유효성 검사

        if(category.value == ""){
            alert("카테고리를 입력하세요.")
            category.focus();
            e.preventDefault();
        }

        /* userName 유효성검사*/

        if(userName.value == ""){
            alert("작성자를 입력하세요.")
            userName.focus();
            e.preventDefault();
        }
        if(!userNameChk.test(userName.value)){
            alert("이름은 3~5글자 한글로만 입력해야합니다.");
            userName.value = "";
            userName.focus();
            e.preventDefault();
        }

        /*비밃번호 유효성검사 */
        if(password.value == ""){
            alert("비밀번호를 입력하세요.")
            password.focus();
            e.preventDefault();
        }
        if(!passwordChk.test(password.value)){
            alert("비밀번호는 영문, 숫자, 특수문자 포함 4~16자리로 입력해야합니다!");
            password.value = "";
            password.focus();
            e.preventDefault();
        }
        if(password.value !== verifyPassword.value){
            alert("비밀번호가 일치하지 않습니다.")
            verifyPassword.focus();
            e.preventDefault();
        }

        /* title 유효성검사 */
        if(title.value == ""){
            alert("제목을 입력하세요.")
            title.focus();
            e.preventDefault();
        }
        if (title.value>2000 || title.value < 4) {
            alert("제목을 입력하세요.")
            title.focus();
            e.preventDefault();
        }

        /* 내용 유효성 검사 */
        if(content.value == ""){
            alert("내용을 입력하세요.")
            content.focus();
            e.preventDefault();
        }
        if (content.value>2000 || content.value < 4) {
            alert("제목은 4자 이상 2000자 미만이어야 합니다.")
            content.focus();
            e.preventDefault();
        }
    }
</script>--%>

<script>
</script>
