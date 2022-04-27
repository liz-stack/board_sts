<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Date" %>
<!-- datepicker -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
    $(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']);
        $("#startDate").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dateFormat: "yymmdd",
            maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            onClose: function (selectedDate) {
                //시작일(startDate) datepicker가 닫힐때
                //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#endDate").datepicker("option", "minDate", selectedDate);
            }

        });
        $("#endDate").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dateFormat: "yymmdd",
            maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
            onClose: function (selectedDate) {
                // 종료일(endDate) datepicker가 닫힐때
                // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                $("#startDate").datepicker("option", "maxDate", selectedDate);
            }

        });
    });
</script>

<style>
    #startDate {
        width: 120px;
        height: 40px;
        text-align: center
    }

    #endDate {
        width: 120px;
        height: 40px;
        text-align: center
    }

    .table {
        table-layout: fixed;
    }

</style>
<script src="https://kit.fontawesome.com/1f04f2c2db.js" crossorigin="anonymous"></script>
<div class="container mt-3">
    <br/>
    <h2>게시판 - 목록</h2>
    <br/>

    <%-- TODO : 220418 등록일 기간검색 사이즈 수정   --%>
    <%-- TODO : 220418 기간 + 작성자+ 제목 + 내용 검색 기능  --%>
    <div class="card border"
         style="padding: inherit;">
        <br/>
        <div class="input-group mb-3 form-row">
            <%--TODO: 220421 등록일 가운데정렬--%>
            <span style="padding:7px; align-content: center">등록일</span>
            <input type="text" id="startDate" placeholder="2022.04.18"> &nbsp;
            <input type="text" id="endDate" placeholder="2022.04.20">
            <span style="padding:7px;"></span>
            <div class="input-group-prepend">
                <span> <label for="category"
                              style="width: max-content; padding:7px; align-content: center">카테고리 선택</label></span>
                <select class="form-control" id="category">
                    <option>JAVA</option>
                    <option>Javascript</option>
                    <option>Database</option>
                </select>
            </div>
            <div class="search-form">
                <form action="/board/list" method="GET">
                    <input
                            class="form-control" aria-label="Text input with dropdown button"
                            style="width: 440px; display: inline;"
                            type="text" name="keyword" value="${ pageMaker.cri.keyword }"
                            placeholder="검색어를 입력해 주세요. (제목+작성자+내용)"/>
                    <button type="submit" class="btn btn-primary">검색</button>
                </form>
            </div>
        </div>
        <br/>
        <%--검색--%>
        <div class="totalCount" style="font-size: large">&nbsp 총 ${getBoardCount}건</div>
        <div class="table">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th class="col-md-1">카테고리</th>
                    <th class="col-md-5">제목</th>
                    <th class="col-md-1">작성자</th>
                    <th class="col-md-1">조회수</th>
                    <th>등록 일시</th>
                    <th>수정 일시</th>
                </tr>
                </thead>
                <tbody id="myTable">
                <%--TODO: 작성자/조회수 한줄로 나오게 간격 조정--%>
                <c:forEach items="${getBoardList}" var="board">
                    <tr>

                        <td><c:out value="${board.category}"/></td>
                        <td style=" white-space:nowrap; overflow:hidden; text-overflow: ellipsis;"><a
                                href="/board/view?boardNo=${board.boardNo}"><c:out
                                value="${board.title}"/></a></td>
                        <td><c:out value="${board.userName}"/></td>
                        <td><c:out value="${board.viewCount}"/></td>
                        <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.createDate}"/></td>
                        <td><c:choose>
                            <c:when test="${empty board.modifyDate}">&#45;</c:when>
                            <c:otherwise><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
                                                         value="${board.modifyDate}"/></c:otherwise>
                        </c:choose></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <nav aria-label="Contacts Page Navigation">
            <ul class="pagination justify-content-center m-0">
                <li class="page-item"><a class="page-link"
                                         href="/board/list?pageNo=1">&laquo; </a></li>
                <c:if test="${ pageMaker.prev eq true }">
                    <%--TODO: 현재 페이지 표시--%>
                    <li class="page-item"><a class="page-link"
                                             href="/board/list?pageNo=${ pageMaker.startPage - 1 }">&lsaquo;</a></li>
                </c:if>
                <c:forEach var="idx" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="page-item">
                        <a class="page-link"
                           href="/board/list?pageNo=${idx}&type=${ pageMaker.cri.type }&keyword=${ pageMaker.cri.keyword }">${ idx }</a>
                    </li>
                </c:forEach>
                <c:if test="${ pageMaker.next eq true }">
                    <li class="page-item"><a class="page-link"
                                             href="/board/list?pageNo=${ pageMaker.endPage+1}">&rsaquo; </a></li>
                </c:if>
                <%--TODO: 220422 1페이지에서 맨끝 클릭할경우 pageNo=10으로 이동.. 조건추가해야--%>
                <li class="page-item"><a class="page-link"
                                         href="/board/list?pageNo=${ pageMaker.endPage}">&raquo; </a></li>
            </ul>
        </nav>


        <div>
            <button class="btn btn-secondary mt-3" style="float: right; clear: both;" id="write"
                    onclick="location.href='/board/write'">등록
            </button>
        </div>

    </div>

    <form id='actionForm' method="get">
        <input type="hidden" name="pageNo" value="${pageMaker.cri.pageNo}">
        <input type="hidden" name="pageAmount" value="${pageMaker.cri.pageAmount}">
    </form>


    <div>
        <button class="btn" id="listenbtn" onclick="location.href='/board/list'">목록</button>
    </div>
</div>
</div>

<%--<script type="text/javascript">
    $(document).ready(function (){
        var result = '<c:out value="${result}"';
            if(!(result==''))
                alert("게시글이 수정되었습니다.");
    })
</script>--%>
<%@ include file="../layout/footer.jsp" %>
