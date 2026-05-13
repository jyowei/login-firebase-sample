<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	padding-right: 36px; /* 👁 分の余白 */
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
	width: 260px; /* 横幅を統一 */
	box-sizing: border-box;
	margin-bottom: 16px;
}
</style>

<script>
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
</script>

</head>
<body>

	<h2>新規ユーザー登録</h2>

	<form action="<%=request.getContextPath()%>/SignupServlet"
		method="post">
		<label>メールアドレス</label>
		<div class="input-box">
			<input type="email" name="email" value="admin11@test.com"
				style="width: 100%; box-sizing: border-box;">
		</div>


		<label>パスワード</label>
		<div class="input-box">
			<div class="password-wrapper">
				<input type="password" id="password" name="password"> <span
					class="password-toggle" onclick="togglePassword()">👁‍🗨</span>
			</div>
		</div>

		<br>
		<button type="submit">登録</button>
</body>
</html>