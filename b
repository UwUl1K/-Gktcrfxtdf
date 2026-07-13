import java.io.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        PrintWriter pw = new PrintWriter(System.out);
        
        String s = br.readLine().trim();
        int n = s.length();
        
        // Вычисляем префикс-функцию (алгоритм КМП)
        int[] pi = new int[n];
        for (int i = 1; i < n; i++) {
            int j = pi[i - 1];
            while (j > 0 && s.charAt(i) != s.charAt(j)) {
                j = pi[j - 1];
            }
            if (s.charAt(i) == s.charAt(j)) {
                j++;
            }
            pi[i] = j;
        }
        
        // Длина периода
        int period = n - pi[n - 1];
        
        // Проверяем, делится ли длина строки на период
        if (n % period == 0) {
            pw.println(period);
        } else {
            pw.println(n);
        }
        
        pw.flush();
    }
}
