<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sach don hang - Ex03</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            margin: 0;
        }

        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 20px;
        }

        .header-info h1 {
            margin: 0;
            color: #333;
        }

        .header-info p {
            color: #666;
            font-size: 14px;
            margin-top: 5px;
        }

        .logout-btn {
            background: #dc3545;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            font-weight: bold;
        }

        .logout-btn:hover {
            background: #c82333;
        }

        h2 {
            color: #333;
            margin-top: 30px;
            margin-bottom: 20px;
            font-size: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
        }

        th {
            background: #667eea;
            color: white;
            padding: 15px;
            text-align: left;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        tbody tr {
            transition: background 0.3s;
        }

        tbody tr:hover {
            background-color: #f9f9f9;
        }

        tbody tr:nth-child(even) {
            background-color: #fafafa;
        }

        .stats-box {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            margin-top: 30px;
        }

        .stats-box strong {
            font-size: 32px;
            display: block;
            margin-bottom: 10px;
        }

        .stats-box p {
            font-size: 14px;
            opacity: 0.9;
        }
    </style>
</head>
<body>

<div class="container">

    <%-- PHAN 1: HEADER (SESSION SCOPE) --%>
    <div class="header">
        <div class="header-info">
            <h1>Xin chao, ${loggedUser.fullName}!</h1>
            <p>Vai tro: ${loggedUser.role}</p>
        </div>
        <form action="/session02/ex03/logout" method="get" style="margin: 0;">
            <button type="submit" class="logout-btn">Dang xuat</button>
        </form>
    </div>

    <%-- PHAN 2: BANG DON HANG (REQUEST SCOPE) --%>
    <h2>Danh sach don hang</h2>

    <c:choose>
        <c:when test="${empty orders}">
            <p>Khong co don hang nao.</p>
        </c:when>
        <c:otherwise>
            <table>
                <thead>
                <tr>
                    <th>Ma don</th>
                    <th>San pham</th>
                    <th>Tong tien</th>
                    <th>Ngay dat</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td><c:out value="${order.orderCode}" /></td>
                        <td><c:out value="${order.productName}" /></td>
                        <td>
                                <%-- Dinh dang tien te VND --%>
                            <fmt:formatNumber value="${order.totalAmount}"
                                              type="currency"
                                              currencySymbol="VND "
                                              groupingUsed="true" />
                        </td>
                        <td>
                                <%-- Dinh dang ngay (dd/MM/yyyy) --%>
                            <fmt:formatDate value="${order.orderDate}"
                                            pattern="dd/MM/yyyy" />
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <%-- PHAN 3: BO DEM TOAN CUC (APPLICATION SCOPE) --%>
    <div class="stats-box">
        <strong>${totalViewCount}</strong>
        <p>Tong luot xem don hang toan he thong</p>
        <p style="font-size: 12px; margin-top: 10px;">
            (Cap nhat tu tat ca nhan vien)
        </p>
    </div>

</div>

</body>
</html>
