package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    // Firebase の APIキー（ログイン時と同じ）
    private static final String API_KEY = "AIzaSyDgnskWvSpp-yIPCx1Q-CUX-HX10GMgxuo";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean success = signupWithFirebase(email, password);

        if (success) {
            request.getRequestDispatcher("/signupSuccess.jsp")
                   .forward(request, response);
        } else {
            request.setAttribute("errorMessage", "登録に失敗しました");
            request.getRequestDispatcher("/signupResult.jsp")
                   .forward(request, response);
        }
    }

    private boolean signupWithFirebase(String email, String password) {
        try {
            String urlStr =
                "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="
                + API_KEY;

            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String json = String.format(
                "{\"email\":\"%s\",\"password\":\"%s\",\"returnSecureToken\":true}",
                email, password
            );

            try (OutputStream os = conn.getOutputStream()) {
                os.write(json.getBytes("UTF-8"));
            }

            return conn.getResponseCode() == HttpURLConnection.HTTP_OK;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}