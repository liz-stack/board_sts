<%@ include file="../layout/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .page_head {
        border-bottom: black solid 1px;
    }

    .title {
        font-size: large;

    }

</style>
<div class="con_lf mt-3">
    <div class="col pt-3">
        <br/>
        <h2>게시판 - 목록</h2>
        <br/>
    </div>
      <div class="page_section" id="detail">
            <div class="board_detail content_container" style=" padding: 20px; line-height: 1.8em;">
                <div class="ppage_head">
                    <div class="detail top" style="float: left;">${boardDetail}</div>
                    <div class="detail top" style="float: right;">수정일시</div>&nbsp;&nbsp;
                    <div class="detail top" style="float: right;">등록일시&nbsp;&nbsp;</div>&nbsp;&nbsp;
                </div>
                <br/>
                <div class="page_head">
                    <div class="detail title" style="float: left;">카테고리:</div>
                    <div class="detail title" style="float: left;" id="title">제목</div>&nbsp;&nbsp;
                    <div class="detail count" style="float: right;">조회수 :</div>&nbsp;&nbsp;
                </div>
                <%--본문--%>
                <div class="card content" style=" padding: 20px; line-height: 1.8em;">
                    <div class="card">
                        <div class="card-body">본문</div>
                    </div>
                    <div>
                        첨부파일
                    </div>
                    <div>
                        댓글
                    </div>
                </div>

            </div>
            <br/>
        </div>

        <div class="box-footer">
            <button class="btn btn" id="listbtn">목록</button>
            <button class="btn btn" id="updatebtn">수정</button>
            <button class="btn btn" id="deletebtn">삭제</button>
        </div>
    </div>


</div>




</div>

</section>
<%@ include file="../layout/footer.jsp" %>

<script>
    //목록 버튼을 눌렀을 때 처리
    document.getElementById("listbtn").addEventListener("click", function () {
        location.href = "list";
    });

    <c:if test = "${user.email == vo.email}">
    //삭제 버튼을 눌렀을 때 처리
    document.getElementById("deletebtn").addEventListener("click", function () {
        location.href = "delete?bno=" + ${vo.bno};
    });

    //수정 버튼을 눌렀을 때 처리
    document.getElementById("updatebtn").addEventListener("click", function () {
        location.href = "update?bno=" + ${vo.bno};
    });
    </c:if>
