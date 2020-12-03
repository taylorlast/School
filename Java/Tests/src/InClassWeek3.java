
import java.util.Scanner;

public class InClassWeek3 {

	public static void main(String[] args) {
		Scanner scan = new Scanner (System.in);
		
		// #1
		/*
		System.out.println("Full Name (Last, First): ");
		String fullname = scan.nextLine();
		int comma = fullname.indexOf(",");
		String lastname = fullname.substring(0,comma);
		String firstname = fullname.substring(comma + 1);
		
		String firstletter = firstname.substring(1,2);
		firstletter = firstletter.toUpperCase();
		String lastletter = lastname.substring(0,1);
		lastletter = lastletter.toUpperCase();
		
		firstname = firstname.substring(2);
		lastname = lastname.substring(1);
		
		System.out.println("Name: " + firstletter + firstname + " " + 
							lastletter + lastname);
		*/
		
		//#2
		System.out.println("Enter a 4-bit binary: ");
		String input = scan.nextLine();
		
		System.out.println(Integer.parseInt(input,2));
		
		
	}

}
