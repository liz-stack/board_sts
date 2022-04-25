<%@ include file="../layout/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    /* 웹브라우저 back키 누를때 페이지 리로딩 */
    window.onpageshow = function (event) {
        if (event.persisted) {
            document.location.reload();
        }
    }
</script>
<style>

    .con_lf {
        margin: 20px;
        padding: 30px;
    }

</style>
<div class="con_lf mt-3">
    <div class="col pt-3">
        <br/>
        <h2>게시판 - 보기</h2>
        <br/>
    </div>

    <div class="row">
        <div class="boardDetail col-md-1">${boardDetail.userName}</div>
        <div class="boardDetail">수정일시
            <c:choose>
                <c:when test="${empty board.modifyDate}">&#45;</c:when>
                <c:otherwise><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                             value="${board.modifyDate}"/></c:otherwise>
            </c:choose>
        </div>&nbsp;&nbsp;&nbsp;

        <div class="boardDetail col-md-4">등록일시 <fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                               value="${boardDetail.createDate}"/>
            &nbsp;&nbsp;
        </div>&nbsp;&nbsp;
    </div>
    <div class="row boldRow">
        <div class="boardDetail col-md-1">[${boardDetail.category}]</div>
        <div class="boardDetail">${boardDetail.title}</div>
        <div class="boardDetail col-md-4" style="float: right">조회수:&nbsp;${boardDetail.viewCount}</div>
        <br/>
    </div>
    <div class="form-group">
    </div>

    <%--본문--%>
    <div class="form-group">
        <textarea type="textarea" class="form-control" name="content" rows="15"
                  readonly>${boardDetail.content}</textarea>
    </div>
    <div class="form-group"><label>파일첨부</label>
        <input id="fileInput" filestyle="" type="file" data-class-button="btn btn-default"
               data-class-input="form-control" data-button-text="" data-icon-name="fa fa-upload"
               class="form-control" tabindex="-1" style="position: absolute; clip: rect(0px 0px 0px 0px);">
        <div class="bootstrap-filestyle input-group"><input type="text" id="userfile" class="form-control"
                                                            name="userfile" disabled=""> <span
                class="group-span-filestyle input-group-btn" tabindex="0"> <label for="fileInput"
                                                                                  class="btn btn-default"> <span
                class="glyphicon fa fa-upload"></span> </label> </span></div>
    </div>

    <div class="card mb-2">
        <div class="card-header bg-light">
            <i class="fa fa-comment fa"></i> REPLY
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    <button type="button" class="btn btn-dark mt-3" onClick="javascript:addReply();">post reply</button>
                </li>
            </ul>
        </div>
    </div>
    <div class="box-footer" style="display: flex; justify-content: center;">
        <button class="btn btn-dark mt-3" id="listbtn" onclick="location.href='/board/list'">목록</button>
        <button class="btn btn-dark mt-3" id="updatebtn"
                onclick="location.href='/board/modify?boardNo=${boardDetail.boardNo}'">수정
        </button>
        <button class="btn btn-dark mt-3" id="deletebtn">삭제</button>
    </div>
</div>
<%--댓글--%>


<br/>


</section>
<%@ include file="../layout/footer.jsp" %>

<script>
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

    $(document).ready(function () {
        $("#fileInput").on('change', function () { // 값이 변경되면
            if (window.FileReader) { // modern browser
                var filename = $(this)[0].files[0].name;
            } else { // old IE
                var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
            }
            // 추출한 파일명 삽입
            $("#userfile").val(filename);
        })
    });

</script>
