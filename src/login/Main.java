package login;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scanner = new Scanner(System.in);
        AuthService authService = new AuthService();

        System.out.println("=== Firebase ログイン画面 ===");

        System.out.print("メールアドレス：");
        String email = scanner.nextLine();

        System.out.print("パスワード：");
        String password = scanner.nextLine();

        LoginResult result = authService.login(email, password);

        System.out.println(result.getMessage());

        scanner.close();
    }
}