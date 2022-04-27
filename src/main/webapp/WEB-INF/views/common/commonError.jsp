<%@ include file="../layout/header.jsp" %>

<section class="content container-fluid">

    <h3><i class="fa fa-warning text-red"></i>ERRORS: ${exception.getMessage()}</h3>
    <ul>
        <c:forEach items="${exception.getStackTrace()}" var="stack">
            <li>${stack.toString()}</li>
        </c:forEach>
    </ul>

</section>
<%@ include file="../layout/footer.jsp" %>
