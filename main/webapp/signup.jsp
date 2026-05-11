<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>新規ユーザー登録</title>
</head>
<body>

	<h2>新規ユーザー登録</h2>

	<form action="<%= request.getContextPath() %>/SignupServlet"
		method="post">
		<label>メールアドレス</label><br> <input type="email" name="email"
			required><br>
		<br> <label>パスワード（6文字以上）</label><br> <input type="password"
			name="password" required><br>
		<br>

		<button type="submit">登録</button>
	</form>

	<p>
		<a href="login.jsp">ログイン画面へ</a>
	</p>

</body>
</html>