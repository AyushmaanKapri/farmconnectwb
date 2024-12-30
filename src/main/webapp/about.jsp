<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>

        <%@include  file="components/navbar.jsp" %>

       
        <div class="jumbotron">
            <h1>About FarmConnect</h1>
            <p>FarmConnect is a mobile application platform designed to bridge the gap between farmers and consumers, facilitating the trade of agricultural goods and services. It aims to streamline the process of buying and selling produce, providing a user-friendly interface for both parties while leveraging technology for efficiency and convenience.</p>
        </div>

        <%@include  file="components/common_modals.jsp" %>
    </body>
</html>
