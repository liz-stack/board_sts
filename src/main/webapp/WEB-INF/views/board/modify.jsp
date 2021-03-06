<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>

<%@ include file="../layout/header.jsp" %>

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

        <form action="${path}/board/modify" method="post" enctype="multipart/form-data" >
            <div class="form-group">
                <label>카테고리</label>
                <span type="category" class="form-control" id="category" readOnly>${boardDetail.category}</span>
            </div>
            <div class="form-group">
                <label>등록 일시</label>
                <span type="createDate" class="form-control" id="createDate" readOnly> <fmt:formatDate
                        pattern="yyyy-MM-dd HH:mm"
                        value="${boardDetail.createDate}"/></span
            </div>

            <div class="form-group">
                <label>수정 일시</label>
                <span type="modifyDate" class="form-control" id="modifyDate" name="modifyDate" readOnly><fmt:formatDate
                        pattern="yyyy-MM-dd HH:mm"
                        value="${boardDetail.modifyDate}"/></span>
            </div>
            <div class="form-group">
                <label>조회수</label>
                <span type="viewCount" class="form-control" id="viewCount" readOnly>${boardDetail.viewCount}</span>
            </div>
            <div class="form-group">
                <label for="userName">작성자</label>
                <input type="writer" class="form-control" id="userName" name="userName" value="${boardDetail.userName}">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password"
                       placeholder="비밀번호">${boardDetail.password}
            </div>
            <div class="form-group">
                <label for="title">제목</label>
                <textarea class="form-control" id="title" name="title" rows="1">${boardDetail.title}</textarea>
            </div>
            <div class="form-group">
                <label for="content">내용</label>
                <textarea class="form-control" id="content" name="content" rows="20">${boardDetail.content}</textarea>
            </div>
            <%--TODO: 220421 취소 버튼 alert--%>
            <button class="btn btn-secondary" type="button" id="cancelWrite" onclick="location.href='/board/list'">취소
            </button>
            <button class="btn btn-secondary" type="submit" id="modifyWrite modBtn">저장</button>
        </form>
        <input type="hidden" name="boardId" value="${boardDetail.boardId}" >

    </div>
</section>
<%--<script>
    $(document).ready(function () {
            const formObj = $("form[role=form]");
            $(".modBtn").on("click", function () {
                formObj.submit();
            });
        }
    );
</script>--%>
<%@ include file="../layout/footer.jsp" %>
