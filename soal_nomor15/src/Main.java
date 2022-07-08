import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Main obj = new Main();
        obj.readWord();
        obj.display();
    }

    String huruf = "";
    String palindrome = "";
    int jumlah = 0;

    void readWord() {
        System.out.println("Inputkan jumlah huruf : ");
        Scanner sc1 = new Scanner(System.in);
        int n = sc1.nextInt();
        System.out.println();

        System.out.println("Inputkan huruf per huruf : ");
        for (int i = 1; i <= n; i++) {
            Scanner sc2 = new Scanner(System.in);
            char letter = sc2.next().charAt(0);

            String str = String.valueOf(letter);

            huruf += str;
        }
        jumlah = huruf.length();
    }

    String s = "";
    boolean checkPalindrome() {
        for (int i = jumlah - 1; i >= 0; i--) {
            char ch = huruf.charAt(i);
            this.s = this.s + ch;
        }
        return !this.s.equalsIgnoreCase(huruf);
    }

    void getPalindrome() {
        if (checkPalindrome()) {
            palindrome = huruf + s.substring(1, jumlah);
        }
    }

    void display() {
        System.out.println("Huruf : " + huruf);
        getPalindrome();
        if (checkPalindrome()) {
            System.out.println("Palindrome : " + palindrome);
        }
    }
}