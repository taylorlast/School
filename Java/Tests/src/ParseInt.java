import java.util.Scanner;
public class ParseInt {

	public static void main(String[] args) {
		Scanner scan = new Scanner (System.in);
		System.out.println("Enter String with ints");
		String test = scan.nextLine();
		
		int testLength = test.length() + test.length()-1;
		for (int i = 0; i <= testLength-1; i+=2)  {
		int value = Character.getNumericValue(test.charAt(i));
		System.out.println(value);
		}
	}

}
