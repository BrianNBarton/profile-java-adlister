<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>

    <button><a href="/profile/edit"> Edit Profile</a></button>
    <button type="submit" name="delete_this_user" value="${sessionScope.user.username}"><a href="/remove">Delete User</a></button>

    <div>
        <h1> Your Ads: </h1>
        <c:forEach var="ad" items="${sessionScope.userAds}">
            <div>
                <h2> <c:out value="${ad.title}"/> </h2>
                <p> <c:out value="${ad.description}"/> </p>
                <form class= "ad_btn" action="/edit" method="get">
                    <button class="ad_btn" type="submit" name="adId" value="${ad.id}"> Edit Ad </button>
                </form>
                <form class= "ad_btn" action="/delete" method="post">
                    <button type="submit" name="delete_this_ad" value="${ad.id}">Delete Ad</button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>