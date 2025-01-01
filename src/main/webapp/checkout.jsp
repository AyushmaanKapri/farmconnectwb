<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <c:if test="${empty sessionScope['current-user']}">
            <c:set var="message" value="You are not logged in !! Login first to access checkout page" scope="session"/>
            <c:redirect url="login.jsp"/>
        </c:if>

        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <!-- Card -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">
                                <!-- Cart items will be dynamically loaded here -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!-- Form details -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form action="#">
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input value="${sessionScope['current-user'].userEmail}" type="email" class="form-control" id="email" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="${sessionScope['current-user'].userName}" type="text" class="form-control" id="name" placeholder="Enter name">
                                </div>
                                <div class="form-group">
                                    <label for="contact">Your contact</label>
                                    <input value="${sessionScope['current-user'].userPhone}" type="text" class="form-control" id="contact" placeholder="Enter contact number">
                                </div>
                                <div class="form-group">
                                    <label for="address">Your shipping address</label>
                                    <textarea class="form-control" id="address" placeholder="Enter your address" rows="3">${sessionScope['current-user'].userAddress}</textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Order Now</button>
                                    <button type="button" class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
