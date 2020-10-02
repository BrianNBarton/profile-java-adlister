<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create A New Ad"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Ad Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Ad Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>
        <div>
            <label>
<%--            <c:set var="count" value="0" scope="page" />--%>
                <span>Categories: </span>
            <c:forEach var="cat" items="${allCategories}">
                    <input type="checkbox" value="${cat.id}" name="category"> ${cat.name}
            </c:forEach>
                </label>
            </div>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
</body>
</html>
