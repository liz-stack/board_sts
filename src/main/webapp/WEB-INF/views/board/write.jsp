<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<!-- Contact Section-->
<div class="contentContainer">
    <br/>
    <h2>게시판 - 등록</h2>
    <br/>
    <div class="container">


        <section class="page-section" id="contact">
            <!-- Contact Section Form-->
            <%--form id: input 요소가 포함될 form 요소를 명시함--%>
            <form class="form-horizontal" value=${BoardDTO} method="post" action="${path}/board/write"
                  onsubmit="return writeBoard()"> <%--return !!( registerBoard() & checkAll())"--%>
                <input type="hidden" class="form-control" id="boardId" name="boardId">
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
                <div data-name="fileDiv" class="filebox bs3-primary form-group row">
                    <label class="col-sm-2 file_0 col-xs-12  control-label">파일 첨부</label>
                    <input type="file" name="files" id="file_0" class="upload-hidden"
                           onchange="changeFilename(this)"/>
                    <button type="button" onclick="addFile()"
                            class="btn btn-bordered btn-xs visible-xs-inline visible-sm-inline visible-md-inline visible-lg-inline">
                        <i class="fa fa-plus" aria-hidden="true"></i>
                    </button>
                    <button type="button" onclick="removeFile(this)"
                            class="btn btn-bordered btn-xs visible-xs-inline visible-sm-inline visible-md-inline visible-lg-inline">
                        <i class="fa fa-minus" aria-hidden="true"></i>
                    </button>
                </div>
                <%--TODO: 220421 취소,저장 버튼 alert--%>
                <input type="button" class="btn btn-secondary" id="cancleBtn" value="취소"
                       onclick="location.href='/board/list'">
                <input type="submit" class="btn btn-secondary" id="saveBtn" value="저장" class="button"
                       style="float: right">
            </form>
        </section>
    </div> <%--container end--%>

</div><%--contentContainer end--%>



</div>
</div>
<%@ include file="../layout/footer.jsp" %>
<script>
    function writeBoard(){
        if(!checkAll()){
            return false;
        }
        if(registerBoard()){
            return false;
        }
        return  true;
    }

    var category = document.getElementById("category");
    var userName = document.getElementById("userName");
    var password = document.getElementById("password");
    var verifyPassword = document.getElementById("verifyPassword");
    var title = document.getElementById("title");
    var content = document.getElementById("content");
    var boardId = document.getElementById("boardId");
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

    function registerBoard() {
        let fileIdx = 0; /*[- 파일 인덱스 처리용 전역 변수 -]*/

        function addFile() {

            const fileDivs = $('div[data-name="fileDiv"]');
            if (fileDivs.length > 2) {
                alert('파일은 최대 세 개까지 업로드 할 수 있습니다.');
                return false;
            }
            console.log(boardId);
            fileIdx++;

            const fileHtml = `
		<div data-name="fileDiv" class="filebox bs3-primary form-group row">
                        <label class="col-sm-2 file_0 col-xs-12  control-label">파일 첨부</label>
                        <input type="file" name="files" id="file_0" class="upload-hidden"
                               onchange="changeFilename(this)"/>
                        <button type="button" onclick="addFile()"
                                class="btn btn-bordered btn-xs visible-xs-inline visible-sm-inline visible-md-inline visible-lg-inline">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                        </button>
                        <button type="button" onclick="removeFile(this)"
                                class="btn btn-bordered btn-xs visible-xs-inline visible-sm-inline visible-md-inline visible-lg-inline">
                            <i class="fa fa-minus" aria-hidden="true"></i>
                        </button>
                    </div>
	`;

            $('#saveBtn').before(fileHtml);
        }

        function removeFile(elem) {
            const prevTag = $(elem).prev().prop('tagName');
            if (prevTag === 'BUTTON') {
                const file = $(elem).prevAll('input[type="file"]');
                const filename = $(elem).prevAll('input[type="text"]');
                file.val('');
                filename.val('파일 찾기');
                return false;
            }

            const target = $(elem).parents('div[data-name="fileDiv"]');
            target.remove();
        }

        function changeFilename(file) {

            file = $(file);
            const filename = file[0].files[0].name;
            const target = file.prevAll('input');
            target.val(filename);
        }
    }
</script>
<script>


</script>


