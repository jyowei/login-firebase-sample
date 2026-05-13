<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>新規ユーザー登録</title>

<style>
.password-wrapper {
	position: relative;
	width: 100%;
}

.password-wrapper input {
	width: 100%;
	padding-right: 36px;
	box-sizing: border-box;
}

.password-toggle {
	position: absolute;
	right: 8px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

.input-box {
	width: 260px;
	box-sizing: border-box;
	margin-bottom: 16px;
}
</style>

<script>
	// パスワード表示切り替え
	function togglePassword() {
		const pw = document.getElementById("password");
		const icon = document.getElementById("toggleIcon");

		if (pw.type === "password") {
			pw.type = "text";
			icon.textContent = "👁";
		} else {
			pw.type = "password";
			icon.textContent = "👁‍🗨";
		}
	}

	// ページを開いたときにリセット
	window.onload = function() {
		document.getElementById("registerForm").reset();
	};
</script>

</head>

<body>

	<h2>新規ユーザー登録</h2>

	<form id="registerForm"
		action="<%=request.getContextPath()%>/SignupServlet" method="post"
		autocomplete="off">

		<label>メールアドレス</label>
		<div class="input-box">
			<input type="email" name="email"
				style="width: 100%; box-sizing: border-box;">
		</div>

		<label>パスワード</label>
		<div class="input-box">
			<div class="password-wrapper">
				<input type="password" id="password" name="password"> <span
					id="toggleIcon" class="password-toggle" onclick="togglePassword()">👁‍🗨</span>
			</div>
		</div>

		<br>
		<button type="submit">登録</button>
		<p>
			<a href="login.jsp">ログイン画面へ</a>
		</p>

	</form>

</body>
</html>