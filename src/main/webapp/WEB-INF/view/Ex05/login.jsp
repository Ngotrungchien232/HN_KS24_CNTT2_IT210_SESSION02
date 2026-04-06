<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dang nhap - Ex05</title>
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
        }

        button {
            width: 100%;
            padding: 12px;
            background: #667eea;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #5568d3;
        }

        .error {
            background: #f8d7da;
            color: #721c24;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #f5c6cb;
            border-radius: 4px;
        }

        .demo {
            background: #e7f3ff;
            padding: 15px;
            margin-top: 20px;
            border-radius: 4px;
            font-size: 13px;
            color: #0c5460;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Dang nhap Portal Nhan Su</h2>

    <c:if test="${not empty errorMessage}">
        <div class="error">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>

    <form method="POST" action="<c:url value='/session02/ex05/login' />">
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
        hr_manager / hr123 (Quan ly)<br>
        hr_staff / staff456 (Nhan vien)
    </div>
</div>

</body>
</html>