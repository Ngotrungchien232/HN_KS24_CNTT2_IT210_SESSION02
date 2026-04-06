<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo cáo điểm - Ex02</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 30px 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.2);
        }

        .header {
            margin-bottom: 30px;
            border-bottom: 3px solid #667eea;
            padding-bottom: 20px;
        }

        .header h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 10px;
        }

        .header p {
            color: #666;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            text-align: left;
            font-weight: bold;
            font-size: 14px;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid #eee;
        }

        tbody tr {
            transition: background 0.3s;
        }

        tbody tr:hover {
            background: #f9f9f9;
        }

        tbody tr:nth-child(even) {
            background: #fafafa;
        }

        .stt {
            width: 50px;
            text-align: center;
            font-weight: bold;
            color: #667eea;
        }

        .rank {
            font-weight: bold;
            padding: 4px 8px;
            border-radius: 4px;
            display: inline-block;
            color: white;
            text-transform: uppercase;
            font-size: 12px;
        }

        .rank-excellent {
            background: #28a745;
        }

        .rank-good {
            background: #17a2b8;
        }

        .rank-fair {
            background: #ffc107;
            color: #333;
        }

        .rank-average {
            background: #fd7e14;
        }

        .rank-poor {
            background: #dc3545;
        }

        .footer {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
            color: #999;
            font-size: 12px;
            text-align: center;
        }

        .badge-info {
            background: #e7f3ff;
            border-left: 4px solid #2196F3;
            padding: 12px;
            margin: 15px 0;
            border-radius: 4px;
            color: #0c5460;
        }
    </style>
</head>
<body>

<div class="container">

    <%--  PHẦN 1: HEADER --%>
    <div class="header">
        <%--  SỬA LỖI 1 + 2: Dùng EL ${} thay Scriptlet <%= %> --%>
        <h1>${reportTitle}</h1>

        <%--  SỬA LỖI 6: Dùng JSP Comment <%-- --%> thay HTML comment --%>
        <%-- Báo cáo điểm sinh viên cuối kỳ (ẩn khỏi client) --%>

        <div class="badge-info">
             Danh sách ${studentList.size()} sinh viên
        </div>
    </div>

    <%--  PHẦN 2: BẢNG DỮ LIỆU --%>
    <table>
        <thead>
        <tr>
            <th class="stt">STT</th>
            <th>Họ tên</th>
            <th>Điểm</th>
            <th>Xếp loại</th>
        </tr>
        </thead>
        <tbody>
        <%--
             SỬA LỖI 2, 3: Dùng JSTL <c:forEach> thay vòng lặp Scriptlet for
             SỬA LỖI 4: Logic xếp loại từ Model (Student.getRank())
             SỬA LỖI 5: Dùng <c:out> để escape HTML (chống XSS)
             SỬA LỖI 7: Dùng EL ${student.score} không dấu chấm phẩy dư
        --%>
        <c:forEach var="student" items="${studentList}" varStatus="status">
            <tr>
                    <%--  STT: Dùng varStatus.count (tự động đếm từ 1) --%>
                <td class="stt">${status.count}</td>

                    <%--  HỌ TÊN: <c:out> chống XSS --%>
                <td>
                    <c:out value="${student.fullName}" />
                </td>

                    <%--  ĐIỂM: EL ${} không cần dấu chấm phẩy --%>
                <td>
                        ${student.score}
                </td>

                    <%--  XẾP LOẠI: Logic từ Model.getRank(), chỉ hiển thị ở View --%>
                <td>
                    <c:choose>
                        <c:when test="${student.rank == 'Xuất sắc'}">
                            <span class="rank rank-excellent"> ${student.rank}</span>
                        </c:when>
                        <c:when test="${student.rank == 'Giỏi'}">
                            <span class="rank rank-good"> ${student.rank}</span>
                        </c:when>
                        <c:when test="${student.rank == 'Khá'}">
                            <span class="rank rank-fair"> ${student.rank}</span>
                        </c:when>
                        <c:when test="${student.rank == 'Trung bình khá'}">
                            <span class="rank rank-average"> ${student.rank}</span>
                        </c:when>
                        <c:otherwise>
                            <span class="rank rank-poor"> ${student.rank}</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--  PHẦN 3: FOOTER --%>
    <div class="footer">
        <%--  SỬA LỖI 1: Xoá hoàn toàn Declaration <%! %> và requestCounter --%>
        <%-- Không còn biến toàn cục bị Race Condition --%>
        <p>✨ Báo cáo được sinh ra bởi Spring MVC + JSTL (Zero Scriptlet)</p>
    </div>

</div>

</body>
</html>