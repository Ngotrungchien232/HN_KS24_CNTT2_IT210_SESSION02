<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://jakarta.tags.fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sach nhan vien - Ex05</title>
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
            max-width: 1200px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
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

        tbody tr:hover {
            background: #f9f9f9;
        }

        .badge {
            display: inline-block;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
            color: white;
        }

        .badge-green {
            background: #28a745;
        }

        .badge-orange {
            background: #ff9800;
        }

        .badge-blue {
            background: #2196F3;
        }

        .link {
            color: #667eea;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        .stt {
            width: 50px;
            text-align: center;
            font-weight: bold;
        }

        .summary {
            background: white;
            padding: 20px;
            margin-top: 20px;
            border-radius: 4px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<%@ include file="layout/header.jsp" %>

<div class="container">
    <table>
        <thead>
        <tr>
            <th class="stt">STT</th>
            <th>Ma NV</th>
            <th>Ho ten</th>
            <th>Phong ban</th>
            <th>Luong</th>
            <th>Ngay vao lam</th>
            <th>Trang thai</th>
            <th>Thao tac</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="emp" items="${employees}" varStatus="status">
            <tr>
                <td class="stt">${status.count}</td>
                <td><c:out value="${emp.code}" /></td>
                <td><c:out value="${emp.fullName}" /></td>
                <td><c:out value="${emp.department}" /></td>
                <td>
                    <fmt:formatNumber value="${emp.salary}"
                                      type="number"
                                      groupingUsed="true" /> VND
                </td>
                <td>
                    <fmt:formatDate value="${emp.hireDate}"
                                    pattern="dd/MM/yyyy" />
                </td>
                <td>
                    <c:choose>
                        <c:when test="${emp.status == 'Dang lam'}">
                            <span class="badge badge-green">Dang lam</span>
                        </c:when>
                        <c:when test="${emp.status == 'Nghi phep'}">
                            <span class="badge badge-orange">Nghi phep</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge badge-blue">Thu viec</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <a href="<c:url value='/session02/ex05/employees/${emp.code}' />"
                       class="link">Xem chi tiet</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="summary">
        <strong>Tong luong phong ban Ky thuat:</strong>
        <fmt:formatNumber value="${techDepartmentSalary}"
                          type="number"
                          groupingUsed="true" /> VND
    </div>
</div>

<%@ include file="layout/footer.jsp" %>

</body>
</html>