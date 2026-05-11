<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン失敗</title>
</head>
<body>

<h2>ログインに失敗しました</h2>

<p style="color:red;">
    ${errorMessage}
</p>

<form action="<%= request.getContextPath() %>/login.jsp" method="get">
    <button type="submit">ログイン画面に戻る</button>
</form>

</body>
</html>