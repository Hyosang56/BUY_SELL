import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class test {
	
	public static String randomid(){
	    StringBuilder sb = new StringBuilder();
	    Random random = new Random();
	    for (int i = 0; i < 6; i++) {
	        int n = random.nextInt(36); // 0~35 사이의 난수
	        if (n > 25) {
	            sb.append(n - 25); // 숫자 (0~9)
	        } else {
	            sb.append((char) (n + 65)); // 대문자 A~Z
	        }
	    }
	    return sb.toString();
	}
	
	public static void main(String[] args) {
		test test = new test();
		String str= test.randomid();
		
	System.out.println(str);
	
	
}
}

