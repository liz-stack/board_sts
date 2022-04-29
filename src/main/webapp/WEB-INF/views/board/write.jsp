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
            <form class="form-horizontal" name="writeForm" method="post" action="${path}/board/write"
                  onsubmit="return checkAll()">
                <%--  <input type="hidden" name="boardNo" value="${}">--%>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label" for="category">카테고리 선택</label>
                    <div class="col-sm-3 col-xs-12">
                        <select class="form-control" id="category" name="category">
                            <option>JAVA</option>
                            <option>Javascript</option>
                            <option>Database</option>
                        </select>
                    </div>

                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label" for="userName">작성자</label>
                    <div class="col-sm-10 col-xs-12">
                        <input type="text" class="form-control" id="userName" name="userName">
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label" for="password">비밀번호</label>
                    <div class="col-sm-3 col-xs-12">
                        <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
                        <input type="password" class="form-control" id="verifyPassword" name="verifyPassword"
                               placeholder="비밀번호 확인">
                    </div>
                </div>
                <div class="form-group row">

                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label" for="title">제목</label>
                    <div class="col-sm-10 col-xs-12">
                        <textarea class="form-control" id="title" name="title" rows="1"></textarea>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label" for="content">내용</label>
                    <div class="col-sm-10 col-xs-12">
                        <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                    </div>
                </div>
                <%-- <div class="form-group row">
                     <label class="col-sm-2 col-xs-12 col-form-label" for="">파일 첨부</label>
                     <div class="col-sm-3 col-xs-12">
                         <input class="form-control" type="file" name="files" value="파일 찾기">
                         <input class="form-control" type="file" name="files">
                         <input class="form-control" type="file" name="files">
                     </div>
                 </div>--%>
                <div class="form-group row">
                    <label class="col-sm-2 col-xs-12 col-form-label">파일 첨부</label>
                    <div class="input-group col-sm-10">
                        <div class="custom-file">
                            <input type="file" name="files" class="custom-file-input" id="inputGroupFile01"
                                   aria-describedby="inputGroupFileAddon01">
                            <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="files" class="custom-file-input" id="inputGroupFile02"
                                   aria-describedby="inputGroupFileAddon01">
                            <label class="custom-file-label" for="inputGroupFile02">Choose file</label>
                        </div>
                        <div class="custom-file">
                            <input type="file" name="files" class="custom-file-input" id="inputGroupFile03"
                                   aria-describedby="inputGroupFileAddon01">
                            <label class="custom-file-label" for="inputGroupFile03">Choose file</label>
                        </div>
                    </div>


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
        }
        if (!checkPassword(password.value,
            verifyPassword.value)) {
            console.log("비밀번호 확인")
            return false;
        }
        if (!checkTitle(title.value)) {
            console.log("제목 확인")
            return false;
        }
        if (!checkContent(content.value)) {
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
<script type="text/javascript">
    $(document).ready(function () {
        var formObj = $("form[name='writeForm']");
        $(".saveBtn").on("click", function () {
            if (fn_valiChk()) {
                return false;
            }
            formObj.attr("action", "/board/write");
            formObj.attr("method", "post");
            formObj.submit();
        });
    })

    function fn_valiChk() {
        var regForm = $("form[name='writeForm'] .chk").length;
        for (var i = 0; i < regForm; i++) {
            if ($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null) {
                alert($(".chk").eq(i).attr("title"));
                return true;
            }
        }
    }

    $(".custom-file-input").on('change',function(){
        var fileName = $(".custom-file-input").val();
        $(".upload-name").val(fileName);
    });

</script>

