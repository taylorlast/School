/*
*
* File name: StringFun.java
* Author: Taylor Last
* Submission Date: 2/28/2019
*
* This program does the following: 
* Prompts the user to input a String and gives them the option to 
* manipulate the String with 5 commands until they would like to 
* exit the program
*
* Statement of Academic Honesty:
*
* The following code represents my own work. I have neither
* received nor given inappropriate assistance. I have not copied
* or modified code from any source other than the course webpage
* or the course textbook. I recognize that any unauthorized
* assistance or plagiarism will be handled in accordance with
* the University of Georgia's Academic Honesty Policy and the
* policies of this course. I recognize that my work is based
* on an assignment created by the Department of Computer
* Science at the University of Georgia. Any publishing
* or posting of source code for this project is strictly
* prohibited unless you have written consent from the Department
* of Computer Science at the University of Georgia.
*/
import java.util.Scanner;

public class StringFun {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner (System.in);
		System.out.println("Enter the String to be manipulated: ");
		String input = scan.nextLine();
		
		String command = "";
		while (!(command.equalsIgnoreCase("quit"))) {
			

				System.out.println("Enter your command (reverse, replace first, replace last, remove all, remove)");
				command = scan.nextLine();
			
				// checks to see if the command says reverse, then the reverse, reverses the string
				if (command.equalsIgnoreCase("reverse")) {
			int newStart = input.length();
			int i = 0;
			String newString = "";
			while (i < newStart) {
				newString += (input.charAt(newStart-1));
				newStart--;
			}
			input = newString;
			System.out.println("The new sentence is: " + newString);
				}
				
				// checks to see if the command says replace first, then takes the first instance of a character 
				// and replaces it with the new specified character.
				else if (command.equalsIgnoreCase("replace first")) {
					
			System.out.println("Enter the character to replace ");	
			String oldChar = scan.nextLine();
			System.out.println("Enter the new character ");
			String newChar = scan.nextLine();
			int c = 0;
			for (int i = 0; i < input.length();i++) {
				if (oldChar.charAt(0) == input.charAt(i)) {
					c++;
				}
			}
			if (c < 1) {
				System.out.println("The letter was not found in the word");
			}
			else {
				String newString = "";
			for (int i = input.length()-1; i >= 0; i--) {
				char letter = input.charAt(i);
				if (letter == oldChar.charAt(0)) {
					letter = newChar.charAt(0);
					newString = input.substring(0,i) + letter + input.substring(i+1);
					}	
				}
			input = newString;
			System.out.println("The new sentence is: " + newString);
				}
				}
				
				// checks to see if the command says replace last, then takes the last instance of a character 
				// and replaces it with the new specified character.
				else if (command.equalsIgnoreCase("replace last")) {
					System.out.println("Enter the character to replace ");	
					String oldChar = scan.nextLine();
					System.out.println("Enter the new character ");
					String newChar = scan.nextLine();
					int c = 0;
					for (int i = 0; i < input.length();i++) {
						if (oldChar.charAt(0) == input.charAt(i)) {
							c++;
						}
					}
					if (c < 1) {
						System.out.println("The letter was not found in the word");
					}
					else {
						String newString = "";
					for (int i = 0; i < input.length();i++) {
						char letter = input.charAt(i);
						if (letter == oldChar.charAt(0)) {
							letter = newChar.charAt(0);
							newString = input.substring(0,i) + letter + input.substring(i+1);
							}	
						}
					input = newString;
					System.out.println("The new sentence is: " + newString);
						}
						}
				
				// checks to see if the command says remove all, then removes all of the specified characters
				else if (command.equalsIgnoreCase("remove all")) {
				System.out.println("Which character would you like to remove? ");
				char removedChar = scan.nextLine().charAt(0);
				String newString = "";
				for (int i = 0; i < input.length();i++) {
					char letter = input.charAt(i);
					if (!(letter == removedChar)) {
						newString += input.charAt(i);
					}
				}
				input = newString;
				System.out.println("The new sentence is: " + newString);
				}
				
				// checks to see if the command says remove, then removes one character from the input message. The 
				// character removed is specified by the user.
				else if (command.equalsIgnoreCase("remove")) {
					System.out.println("Enter the letter you would like to remove");
					String removedChar = scan.nextLine();
					System.out.println("Enter the " + removedChar + " you would you like to remove "
							+ "(Not the index - 1 = 1st, 2 = 2nd, etc.): ");
					int removedInt = scan.nextInt();
					String newString = "";
					int count = 0;
					for (int i = 0; i < input.length();i++) {
						if (input.charAt(i) == removedChar.charAt(0)) {
							count++;
						}
							if (count == removedInt && input.charAt(i) == removedChar.charAt(0)) {
								newString = input.substring(0,i) + input.substring(i+1);
							}
					}
					if (removedInt > count) {
						System.out.println("Error: the letter you are trying to remove does not exist");
					}
					else {
					System.out.println("The new sentence is: " + newString);
					input = newString;
					}
					scan.nextLine();
				}
		}
		System.out.println("...Execution ends...");
		System.exit(0);
	}
}