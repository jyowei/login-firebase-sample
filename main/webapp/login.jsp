<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>

<style>
body {
    font-family: sans-serif;
    line-height: 1.6;
}

/* 共通入力枠 */
.input-box {
    width: 260px;
    box-sizing: border-box;
    margin-bottom: 16px;
}

/* input 共通 */
.input-box input {
    width: 100%;
    box-sizing: border-box;
}

/* パスワード用 */
.password-wrapper {
    position: relative;
    width: 100%;
}

.password-wrapper input {
    padding-right: 36px;
}

/* 👁アイコン */
.password-toggle {
    position: absolute;
    right: 8px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    user-select: none;
}

/* ボタン */
button {
    margin-top: 8px;
}
</style>

<script>
// パスワード表示切替
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

// ページ表示時に入力リセット
window.onload = function() {
    document.getElementById("loginForm").reset();
};
</script>

</head>

<body>

<h2>ログイン</h2>

<form id="loginForm" action="login" method="post" autocomplete="off">

    <!-- メールアドレス -->
    <label>メールアドレス</label>
    <div class="input-box">
        <input type="text" name="email" required>
    </div>

    <!-- パスワード -->
    <label>パスワード</label>
    <div class="input-box">
        <div class="password-wrapper">
            <input type="password" id="password" name="password" required>
            <span class="password-toggle"
                  id="toggleIcon"
                  onclick="togglePassword()">👁‍🗨</span>
        </div>
    </div>

    <button type="submit">ログイン</button>
</form>

<p>
    <a href="signup.jsp">新規ユーザー登録へ</a>
</p>

</body>
</html>