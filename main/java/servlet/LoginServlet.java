package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginServlet extends HttpServlet {

	// Firebase の Web API キー
	private static final String API_KEY = "AIzaSyDgnskWvSpp-yIPCx1Q-CUX-HX10GMgxuo";

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// JSP から送られてきた入力値を取得
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		boolean success = loginWithFirebase(email, password);


		if (success) {
			// 成功画面へ
			response.sendRedirect(request.getContextPath() + "/success");
		} else {
			// 失敗時：メッセージ付きで戻す

			request.setAttribute("errorMessage", "メールアドレスまたはパスワードが違います");
			request.getRequestDispatcher("/result.jsp")
			.forward(request, response);
		}


	}

	/**
	 * Firebase Authentication によるログイン処理
	 */
	private boolean loginWithFirebase(String email, String password) {

		try {
			String urlStr =
					"https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="
							+ API_KEY;

			URL url = new URL(urlStr);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setDoOutput(true);

			// Firebaseへ送るJSON
			String json = String.format(
					"{\"email\":\"%s\",\"password\":\"%s\",\"returnSecureToken\":true}",
					email, password
					);

			try (OutputStream os = conn.getOutputStream()) {
				os.write(json.getBytes());
			}

			// 認証成功時は 200
			return conn.getResponseCode() == HttpURLConnection.HTTP_OK;

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}