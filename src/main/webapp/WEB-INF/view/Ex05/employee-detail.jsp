<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiet nhan vien - Ex05</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f5f5f5;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
        }

        .info-row {
            margin-bottom: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
        }

        .label {
            color: #666;
            font-weight: bold;
            font-size: 13px;
            text-transform: uppercase;
        }

        .value {
            color: #333;
            font-size: 16px;
            margin-top: 5px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 20px;
        }

        .btn:hover {
            background: #5568d3;
        }

        .masked {
            color: #999;
            font-size: 16px;
        }
    </style>
</head>
<body>

<%@ include file="layout/header.jsp" %>

<div class="container">
    <h2>Chi tiet Nhan vien</h2>

    <div class="info-row">
        <div class="label">Ma nhan vien</div>
        <div class="value"><c:out value="${employee.code}" /></div>
    </div>

    <div class="info-row">
        <div class="label">Ho ten</div>
        <div class="value"><c:out value="${employee.fullName}" /></div>
    </div>

    <div class="info-row">
        <div class="label">Phong ban</div>
        <div class="value"><c:out value="${employee.department}" /></div>
    </div>

    <div class="info-row">
        <div class="label">Luong</div>
        <div class="value">
            <c:choose>
                <c:when test="${role == 'hr_manager'}">
                    <%-- Quan ly nhan su thay duoc luong --%>
                    <fmt:formatNumber value="${employee.salary}"
                                      type="number"
                                      groupingUsed="true" /> VND
                </c:when>
                <c:otherwise>
                    <%-- Nhan vien binh thuong khong thay luong --%>
                    <span class="masked">***</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="info-row">
        <div class="label">Ngay vao lam</div>
        <div class="value">
            <fmt:formatDate value="${employee.hireDate}"
                            pattern="dd/MM/yyyy" />
        </div>
    </div>

    <div class="info-row">
        <div class="label">Trang thai</div>
        <div class="value"><c:out value="${employee.status}" /></div>
    </div>

    <a href="<c:url value='/session02/ex05/employees' />" class="btn">Quay lai</a>
</div>

<%@ include file="layout/footer.jsp" %>

</body>
</html>