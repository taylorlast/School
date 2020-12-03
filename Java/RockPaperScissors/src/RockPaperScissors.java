/*
*
* File name: RockPaperScissors.java
* Author: Taylor Last
* Submission Date: 2/22/2019
*
* This program does the following: 
* Plays a game of rock paper scissors with the computer by 
* randomly assigning an int to "rock", "paper", or "scissors" 
* and deciding who wins. Then it calculates who wins the series.
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

public class RockPaperScissors {

	public static void main(String[] args) {
		
		int compWins = 0;
		int playWins = 0;

		String record = "";
		
		Scanner scan = new Scanner (System.in);
		System.out.println("How many wins do you need to win the series? ");
		int amtOfWins = scan.nextInt();
		
		while (compWins < amtOfWins && playWins < amtOfWins) {
			String computerMove = ComputerOpponent.getMove();
			
			System.out.println("Rock, Paper, or Scissors? ");
			String inputPlayerMove = scan.next();

			String playerMove = inputPlayerMove.toLowerCase();
			
			if(playerMove.equals("rock") || playerMove.equals("paper") || playerMove.equals("scissors")) {
			
			if (playerMove.equals(computerMove)) {
				System.out.print("The computer chose " + computerMove + " so it is a tie. ");
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else if (playerMove.equals("rock") && computerMove.equals("paper")) {
				System.out.print("The computer chose " + computerMove + " so you lose. ");
				compWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else if (playerMove.equals("rock") && computerMove.equals("scissors")) {
				System.out.print("The computer chose " + computerMove + " so you win. ");
				playWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else if (playerMove.equals("scissors") && computerMove.equals("rock")){
				System.out.print("The computer chose " + computerMove + " so you lose. ");
				compWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else if (playerMove.equals("paper") && computerMove.equals("scissors")) {
				System.out.print("The computer chose " + computerMove + " so you lose. ");
				compWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else if (playerMove.equals("scissors") && computerMove.equals("paper")) {
				System.out.print("The computer chose " + computerMove + " so you win. ");
				playWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);
			}
			else {
				System.out.print("The computer chose " + computerMove + " so you win. ");
				playWins++;
				record = "(" + playWins + "-" + compWins + ")";
				System.out.println(record);	
				}
			}
			else
				System.out.println("Please chose 'rock', 'paper', or 'scissors'");
		}
		if (playWins > compWins)
			System.out.println("Congratulations! You won!");
		else
			System.out.println("Sorry, you lost. Better luck next time! ");
	}
}
