/*
*
* File name: Hangman2.java
* Author: Taylor Last
* Submission Date: 3/22/2019
*
* This program does the following: 
* Prompts the user to play a game of hangman by getting a random word
* from an enumerated list and lets the user guess the letters until they
* get the word right or run out of guesses.
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

public class Hangman2 {

	private static final boolean testingMode = true;
	
	public static void main(String[] args) {
		
		int gameCount = 0;
		int totalScore = 0;
		String playGame = "y";
		boolean invalid = false;
		
		// Outer loop that runs the game until the user doesn't want to play again
		while (playGame.contentEquals("y") && gameCount < 20) {
		
			// Stores the word from RandomWord in a string called secretWord
			System.out.print("The word is: ");
			String secretWord = RandomWord.newWord();
			String dashWord = "";
			String hangWord = "";
		
		// Loops through secret word and establishes a dashedWord
		for(int i = 0; i < secretWord.length(); i++) {
			 dashWord += "-";
		}
			System.out.println(dashWord);
		
		// Shows the secret word if testingMode is true
		if (testingMode) {
			System.out.println("The secret word is: " + secretWord);
		}
		
		// Prompts the user to enter the amount of spaces they want to guess
		System.out.println("Enter the number of spaces allowed: ");
		Scanner scan = new Scanner(System.in);
		int numSpacesAllowed = scan.nextInt();
		
		int numSpaces= secretWord.length();
		
		// Loops to check if the input is valid
		while (numSpacesAllowed > numSpaces || numSpacesAllowed == 0) {
			System.out.println("Invalid input. Try again. ");
			System.out.println("Enter the number of spaces allowed: ");
			numSpacesAllowed = scan.nextInt();
		} 
		
		int spaceLength = numSpacesAllowed * 2;
		int guessesRemaining = 20;
		boolean wordSolved = false;
		scan.nextLine();

		// Plays the game if the user still has guesses left and has still not solved the word.
		while (guessesRemaining > 0 && wordSolved == false) {
			System.out.print("Please enter the letter you would like to guess: ");
			String letterGuess = scan.nextLine();
			char letter = letterGuess.charAt(0);
			
			System.out.println("Please enter the spaces you want to check (separated by spaces)");
			String spaceCheck = scan.nextLine();
			System.out.println();
	
			// loops to check for invalid input
			while (Character.isDigit(letter) || Character.isLetter(spaceCheck.charAt(0)) || 
					numSpacesAllowed > numSpaces || numSpacesAllowed == 0) {
				System.out.println("Invalid input. Try again. ");
				System.out.println("Guesses remaining: " + guessesRemaining);
				System.out.print("Please enter the letter you would like to guess: ");
				letterGuess = scan.nextLine();
				letter = letterGuess.charAt(0);
				
				System.out.println("Please enter the spaces you want to check (separated by spaces)");
				spaceCheck = scan.nextLine();
				System.out.println();
		}
		
		// initializes a variable that increases when the user correctly guesses.
		int count = 0;
		
		// Loops through the String that contains the number spaces
		for ( int i = 0; i < spaceLength-1; i+=2) {
			// initializes a value that contains the integer value of the spaces.
			int value = Character.getNumericValue(spaceCheck.charAt(i));
			if (value > numSpaces) {
				System.out.println("Invalid input. Try again. ");
				System.out.println("Guesses remaining: " + guessesRemaining);
				System.out.print("Please enter the letter you would like to guess: ");
				letterGuess = scan.nextLine();
				letter = letterGuess.charAt(0);
				invalid = true;
				
				System.out.println("Please enter the spaces you want to check (separated by spaces)");
				spaceCheck = scan.nextLine();
				System.out.println();
			}
		}
		// Loops to increase count when the user guesses correctly.
		for ( int i = 0; i < spaceLength-1; i+=2) {
			int value = Character.getNumericValue(spaceCheck.charAt(i));
			if (secretWord.charAt(value) == letter) {
				count++;
			}
		}  
		
		// If the user is right, the dashWord String will be manipulated to reveal correct spaces.
		if (count > 0) {	
			System.out.println("Your guess is in the word!");
			System.out.print("Your updated word: ");
			for ( int i = 0; i < spaceLength-1; i+=2) 
			{
				int value = Character.getNumericValue(spaceCheck.charAt(i));
				if (secretWord.charAt(value) == letter) {
					 dashWord = dashWord.substring(0, value) + letter + dashWord.substring(value +1);
				}
					
			}
			System.out.println(dashWord);
		}
		
		// If the user is wrong, guessesRemaining is decreased by 1.
		else {
		System.out.println("Your letter was not found in the spaces you provided.");
		guessesRemaining--;
		}
		
		System.out.println("Guesses Remaining: " + guessesRemaining);
		
		// Ends the game when guessesRemaining is equal to 0.
		if (guessesRemaining == 0) {
			System.out.println("You have failed to guess the word... :(");
			int roundScore = (guessesRemaining* 10 / numSpacesAllowed);
			System.out.println("Score for this round:" + roundScore);
			totalScore += roundScore;
			System.out.println("Total Score: " + totalScore);
		}
		
		// Ends the game when the user correctly guesses the full word.
		if (!(dashWord.contains("-"))) {
			wordSolved = true;
			System.out.println("You have guessed the word! Congratulations");
			int roundScore = (guessesRemaining* 10 / numSpacesAllowed);
			System.out.println("Score for this round:" + roundScore);
			totalScore += roundScore;
			System.out.println("Total Score: " + totalScore);
		}
		}
		System.out.println("Would you like to play again? Yes(y) or No(n)");
		playGame = scan.nextLine();
		gameCount++;
		
		}
	}

}
