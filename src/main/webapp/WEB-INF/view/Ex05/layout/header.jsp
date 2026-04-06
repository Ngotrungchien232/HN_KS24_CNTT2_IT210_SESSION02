<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.tags.core" prefix="c" %>

<!-- HEADER CHUNG -->
<header style="background: #667eea; color: white; padding: 20px; margin-bottom: 30px;">
    <div style="max-width: 1200px; margin: 0 auto;">
        <div style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <h1 style="margin: 0;">Portal Nhan Su</h1>
                <p style="margin: 5px 0; font-size: 14px;">He thong quan ly nhan su</p>
            </div>

            <div style="text-align: right;">
                <p style="margin: 0;">Xin chao, <strong><c:out value="${loggedUser.fullName}" /></strong></p>
                <p style="margin: 5px 0; font-size: 13px;">
                    Role:
                    <c:choose>
                        <c:when test="${role == 'hr_manager'}">Quan ly nhan su</c:when>
                        <c:otherwise>Nhan vien</c:otherwise>
                    </c:choose>
                </p>
                <a href="<c:url value='/session02/ex05/logout' />"
                   style="color: white; text-decoration: none; font-size: 13px;">Dang xuat</a>
            </div>
        </div>

        <!-- MENU NAV -->
        <nav style="margin-top: 15px; border-top: 1px solid rgba(255,255,255,0.2); padding-top: 10px;">
            <a href="<c:url value='/session02/ex05/employees' />"
               style="color: white; text-decoration: none; margin-right: 20px;">Danh sach nhan vien</a>

            <c:if test="${role == 'hr_manager'}">
                <a href="#" style="color: white; text-decoration: none; margin-right: 20px;">Quan ly luong</a>
                <a href="#" style="color: white; text-decoration: none;">Bao cao</a>
            </c:if>
        </nav>
    </div>
</header>