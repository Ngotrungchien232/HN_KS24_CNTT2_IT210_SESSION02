<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tim kiem su kien - Ex04</title>
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
            padding: 30px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
        }

        .header {
            margin-bottom: 40px;
            border-bottom: 4px solid #667eea;
            padding-bottom: 30px;
        }

        .header h1 {
            color: #333;
            font-size: 32px;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .header p {
            color: #666;
            font-size: 18px;
            margin: 10px 0;
        }

        .keyword-highlight {
            color: #667eea;
            font-weight: bold;
            background: #f0f2ff;
            padding: 2px 8px;
            border-radius: 4px;
        }

        .search-info {
            background: linear-gradient(135deg, #e7f3ff 0%, #fff9e6 100%);
            border-left: 5px solid #667eea;
            padding: 18px;
            margin-top: 20px;
            border-radius: 6px;
            font-size: 16px;
        }

        .search-info strong {
            color: #667eea;
            font-size: 18px;
        }

        .empty-message {
            text-align: center;
            padding: 80px 30px;
            color: #999;
        }

        .empty-message p {
            font-size: 20px;
            margin: 15px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 18px;
            text-align: left;
            font-weight: bold;
            font-size: 15px;
        }

        td {
            padding: 15px 18px;
            border-bottom: 1px solid #eee;
            font-size: 14px;
        }

        tbody tr {
            transition: background 0.3s, box-shadow 0.3s;
        }

        tbody tr:hover {
            background: linear-gradient(90deg, #f9f9ff 0%, #fffef9 100%);
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.15);
        }

        tbody tr:nth-child(even) {
            background: #fafafa;
        }

        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
            color: white;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .badge-success {
            background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
        }

        .badge-danger {
            background: linear-gradient(135deg, #dc3545 0%, #e74c3c 100%);
        }

        .badge-warning {
            background: linear-gradient(135deg, #ffc107 0%, #ff9800 100%);
            color: #333;
        }

        .price {
            font-weight: bold;
            color: #667eea;
            font-size: 16px;
        }

        .tickets-available {
            color: #28a745;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .tickets-low {
            color: #ff9800;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .tickets-sold-out {
            color: #dc3545;
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            transition: all 0.3s;
            font-weight: bold;
            font-size: 13px;
            border: none;
            cursor: pointer;
            text-align: center;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(102, 126, 234, 0.6);
        }

        .btn-disabled {
            background: #ccc;
            color: #999;
            cursor: not-allowed;
            opacity: 0.6;
        }

        .btn-disabled:hover {
            transform: none;
            box-shadow: none;
        }

        .footer {
            margin-top: 50px;
            padding-top: 30px;
            border-top: 2px solid #eee;
            color: #666;
            font-size: 14px;
        }

        .footer p {
            margin: 12px 0;
            line-height: 1.6;
        }

        .footer strong {
            color: #667eea;
            font-size: 16px;
        }

        .copyright {
            margin-top: 30px;
            text-align: center;
            color: #999;
            font-size: 12px;
        }

        .stt {
            width: 50px;
            text-align: center;
            font-weight: bold;
            color: #667eea;
        }
    </style>
</head>
<body>

<div class="container">

    <%-- PHAN 1: HEADER --%>
    <div class="header">
        <h1>Tim kiem su kien</h1>

        <%-- XSS PROTECTION: Dung <c:out> de escape HTML --%>
        <p>
            Ket qua tim kiem cho:
            <c:choose>
                <c:when test="${not empty keyword}">
                    <span class="keyword-highlight">
                        <c:out value="${keyword}" />
                    </span>
                </c:when>
                <c:otherwise>
                    <span class="keyword-highlight">(khong co tu khoa)</span>
                </c:otherwise>
            </c:choose>
        </p>

        <%-- Hien thi tong so ket qua --%>
        <div class="search-info">
            <strong>Tim thay ${totalFound} su kien</strong>
        </div>
    </div>

    <%-- PHAN 2: KIEM TRA DANH SACH RONG --%>
    <c:choose>
        <c:when test="${empty events}">
            <%-- Khong tim thay ket qua --%>
            <div class="empty-message">
                <p>Khong tim thay su kien nao phu hop.</p>
                <p>Vui long thu lai voi tu khoa khac.</p>
            </div>
        </c:when>

        <c:otherwise>
            <%-- Hien thi bang ket qua --%>
            <table>
                <thead>
                <tr>
                    <th class="stt">STT</th>
                    <th>Ten su kien</th>
                    <th>Ngay to chuc</th>
                    <th>Gia ve</th>
                    <th>Ve con lai</th>
                    <th>Thao tac</th>
                </tr>
                </thead>
                <tbody>
                    <%-- VONG LAP: Dung <c:forEach> khong Scriptlet --%>
                <c:forEach var="event" items="${events}" varStatus="status">
                    <tr>
                            <%-- STT: Dung varStatus.count --%>
                        <td class="stt">${status.count}</td>

                            <%-- TEN SU KIEN: <c:out> chong XSS --%>
                        <td>
                            <strong><c:out value="${event.name}" /></strong>
                        </td>

                            <%-- NGAY TO CHUC: Hien thi string nguyen ban --%>
                        <td>
                            <c:out value="${event.eventDate}" />
                        </td>

                            <%-- GIA VE: Dung <c:choose> xu ly 2 truong hop --%>
                        <td>
                            <c:choose>
                                <c:when test="${event.price == 0}">
                                    <span class="badge badge-success">MIEN PHI</span>
                                </c:when>
                                <c:otherwise>
                                        <span class="price">
                                            <%-- Dinh dang so co dau phan cach --%>
                                            <fmt:formatNumber value="${event.price}"
                                                              type="number"
                                                              groupingUsed="true" /> dong
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                            <%-- VE CON LAI: Dung <c:choose> xu ly 3 truong hop --%>
                        <td>
                            <c:choose>
                                <%-- Truong hop 1: HET VE --%>
                                <c:when test="${event.remainingTickets == 0}">
                                    <span class="badge badge-danger">HET VE</span>
                                </c:when>

                                <%-- Truong hop 2: SAP HET (< 10 ve) --%>
                                <c:when test="${event.remainingTickets < 10}">
                                        <span class="tickets-low">
                                            Sap het (con
                                            <c:out value="${event.remainingTickets}" /> ve)
                                        </span>
                                </c:when>

                                <%-- Truong hop 3: CON VE BINH THUONG --%>
                                <c:otherwise>
                                        <span class="tickets-available">
                                            Con
                                            <c:out value="${event.remainingTickets}" /> ve
                                        </span>
                                </c:otherwise>
                            </c:choose>
                        </td>

                            <%-- THAO TAC: Link "Dat ve" --%>
                        <td>
                            <c:choose>
                                <%-- Neu het ve -> disabled --%>
                                <c:when test="${event.remainingTickets == 0}">
                                    <button class="btn btn-disabled" disabled>
                                        Dat ve
                                    </button>
                                </c:when>

                                <%-- Neu con ve -> link hoat dong --%>
                                <c:otherwise>
                                    <%-- <c:url> tu dong them context path --%>
                                    <c:url var="bookUrl"
                                           value="/ex04/events/${event.id}/book" />
                                    <a href="${bookUrl}" class="btn btn-primary">
                                        Dat ve
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>

    <%-- PHAN 3: FOOTER --%>
    <div class="footer">
        <%-- Guard: Kiem tra null truoc khi dung fn:toUpperCase --%>
        <c:if test="${not empty events}">
            <p>
                Su kien hang dau:
                <strong>
                        <%-- fn:toUpperCase: Chuyen thanh chu hoa --%>
                        ${fn:toUpperCase(events[0].name)}
                </strong>
            </p>
        </c:if>

        <%-- fn:length: Do dai chuoi --%>
        <p>
            Tu khoa tim kiem co
            <strong>${fn:length(keyword)}</strong>
            ky tu.
        </p>

        <div class="copyright">
            Copyright 2026 He thong ban ve su kien | Built with Spring MVC + JSTL
        </div>
    </div>

</div>

</body>
</html>