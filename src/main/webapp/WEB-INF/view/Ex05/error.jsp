<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loi - Ex05</title>
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

        .error-box {
            background: white;
            padding: 50px;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 500px;
        }

        .error-icon {
            font-size: 60px;
            margin-bottom: 20px;
        }

        h2 {
            color: #dc3545;
            margin-bottom: 15px;
        }

        p {
            color: #666;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            padding: 10px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }

        .btn:hover {
            background: #5568d3;
        }
    </style>
</head>
<body>

<div class="error-box">
    <div class="error-icon">!</div>
    <h2>Co loi xay ra</h2>
    <p>
        <c:out value="${errorMessage}" />
    </p>
    <a href="<c:url value='/session02/ex05/employees' />" class="btn">Quay lai trang chu</a>
</div>

</body>
</html>