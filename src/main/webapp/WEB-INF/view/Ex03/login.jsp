<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dang nhap - Ex03</title>
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
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 5px rgba(102, 126, 234, 0.3);
        }

        button {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            opacity: 0.9;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
            text-align: center;
        }

        .demo {
            background: #e7f3ff;
            padding: 15px;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 13px;
            color: #555;
        }

        .demo strong {
            color: #0c5460;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Dang nhap - Ex03</h2>

    <%-- Hien thi loi tu REQUEST SCOPE --%>
    <c:if test="${not empty errorMessage}">
        <div class="error">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>

    <form method="POST" action="/session02/ex03/login">
        <div class="form-group">
            <label>Ten dang nhap:</label>
            <input type="text" name="username" required>
        </div>

        <div class="form-group">
            <label>Mat khau:</label>
            <input type="password" name="password" required>
        </div>

        <button type="submit">Dang nhap</button>
    </form>

    <div class="demo">
        <strong>Tai khoan demo:</strong><br>
        admin / admin123 (Quan tri vien)<br>
        staff / staff123 (Nhan vien ban hang)
    </div>
</div>

</body>
</html>