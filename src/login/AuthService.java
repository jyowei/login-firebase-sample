package login;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AuthService {

    // Firebase Web APIキー
    private static final String API_KEY = "AIzaSyDgnskWvSpp-yIPCx1Q-CUX-HX10GMgxuo";

    private static final String LOGIN_URL =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="
        + API_KEY;

    public LoginResult login(String email, String password) {

        try {
            URL url = new URL(LOGIN_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String json = """
            {
              "email": "%s",
              "password": "%s",
              "returnSecureToken": true
            }
            """.formatted(email, password);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(json.getBytes());
            }

            int status = conn.getResponseCode();

            if (status == 200) {
                return new LoginResult(true, "ログイン成功");
            } else {
                return new LoginResult(false, "ログイン失敗");
            }

        } catch (Exception e) {
            return new LoginResult(false, "通信エラー");
        }
    }
}