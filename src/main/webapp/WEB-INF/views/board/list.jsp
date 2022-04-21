<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp" %>

<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.SQLException" %>
<%@page import="java.util.Date" %>
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
<script src="https://kit.fontawesome.com/1f04f2c2db.js" crossorigin="anonymous"></script>
<div class="container mt-3">
    <br/>
    <h2>게시판 - 목록</h2>
    <br/>

    <%-- TODO : 220418 등록일 기간검색 사이즈 수정   --%>
    <%-- TODO : 220418 검색시 전체카테고리 드롭다운, 기간 + 작성자+ 제목 + 내용 검색 기능  --%>
    <%-- TODO : 220418 날짜 검색기 script 분리 --%>
    <div class="card border">
        <br/>
        <div class="input-group mb-3 form-row">
            <%--TODO: 220421 등록일 가운데정렬--%>
            <span style="padding:7px; align-content: center" >등록일</span>
           <%-- <div class="input-group-addon">
                <i class="fa fa-calendar fa-xl"  aria-hidden="true" style="padding: 2px"></i>
            </div>--%>
            <input type="text" id="startDate" placeholder="2022.04.18" style="width:120px; text-align:center"> &nbsp;
            <%--<div class="input-group-addon">
                <i class="fa fa-calendar fa-xl" aria-hidden="true" style="padding: 2px"></i>
            </div>--%>
            <input type="text" id="endDate" placeholder="2022.04.20" style="width:120px; text-align:center">
            <span style="padding:7px;"></span>
            <%--TODO:220420 카테고리 드롭다운 안됨--%>
            <div class="input-group-prepend">
                <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">카테고리
                </button>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a
                        class="dropdown-item" href="#">Something
                    else here</a>
                </div>
            </div>
            <input type="text" class="form-control" aria-label="Text input with dropdown button">
            <button type="submit" class="btn btn-primary">검색</button>
        </div>
    </div>
    <br/>

    총 ${boardCount}건
    <table class="table table-hover">
        <thead>
        <tr>
            <th>카테고리</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
            <th>등록 일시</th>
            <th>수정 일시</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <%--TODO: 220420 제목이 너무 길면 줄여서 보여주기, 작성자/조회수 한줄로 나오게 --%>
        <c:forEach items="${boardList}" var="board">
            <tr>
                <td><c:out value="${board.category}"/></td>
                <!-- TODO: 링크-->
                <td><a href="/board/view?${board.boardNo}"><c:out value="${board.title}"/></a></td>
                <td><c:out value="${board.userName}"/></td>
                <td><c:out value="${board.viewCount}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.createDate}"/></td>
                <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${board.modifyDate}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form id="moveForm" method="get">
        <input type="hidden" name="pageNo" value="${pageMaker.cri.pageNo}">
        <input type="hidden" name="pageAmount" value="${pageMaker.cri.pageAmount}">
    </form>

    <nav aria-label="Page navigation example" style="display: flex; justify-content: center;">
        <ul class="pagination">
            <%-- TODO: 220420 이전, 다음버튼 안나옴--%>
            <c:if test="${pageMaker.prev}">
                <li class="page-item">
                    <a class="page-link" href="/board/list?pageNo=${ pageMaker.startPage - 1 }" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>

            </c:if>
            <c:forEach var="i" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                <li class="page-item"><a class="page-link" href="/board/list?pageNo=${i}">${i}</a></li>
            </c:forEach>
            <c:if test="${pageMaer.next eq true}">
                <a class="page-link" href="/board/list?pageNo=${ pageMaker.endPage + 1 }" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span></a>
            </c:if>
        </ul>
    </nav>

</div>


<%@ include file="../layout/footer.jsp" %>