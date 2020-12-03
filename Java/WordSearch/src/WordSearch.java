/* ******************************************************
* WordSearch.java
* Author: Taylor Last
* Submission Date: [4/29/19]
*
* Purpose: Loops through a 2D array of chars and finds words 
* based on a 2D array provided to us in the jar file.
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
//*******************************************************

import java.util.Scanner;

public class WordSearch {
	
	public static void main (String[] args) {

		Scanner scan = new Scanner (System.in);
		long seed = WordSearch.promtUserForSeed(scan);
		WordBoard board = WordSearch.findWords(10,10,seed);
		System.out.println(board);
		System.out.println();
		board.checkAnswers();
	}
	
	public static long promtUserForSeed(Scanner scan) {
		System.out.println("Enter the seed for a 10x10 board:");
		return scan.nextLong();
	}
	
	public static WordBoard findWords(int rows, int cols, long seed) {
		WordBoard board = new WordBoard(rows, cols, seed);
		char[][] array = board.getBoard();
		String [] dictionary = board.getDictionary();
		
		for (int z = 0; z < dictionary.length; z++) {
			
			boolean foundWord = false;
			String line = "";
			int istartIndex = 0;
			int iendIndex = 0;
			int jstartIndex = 0;
			int jendIndex = 0;
			
			// loops through all rows
			for (int i = 0; i < rows; i++) {
				line ="";
				
				for (int j = 0; j < cols; j++) {
					line += array[i][j];
					
					// if the line contains the word we're looking for, it gets the position.
					if (line.contains(dictionary[z])) {
						istartIndex = i;
						iendIndex = i;
						jstartIndex = line.indexOf(dictionary[z]);
						jendIndex = j;
						board.highlightWord(istartIndex, jstartIndex, iendIndex, jendIndex);
						foundWord = true;
						break;
					}
				}
				if (foundWord == true) {
					break;
				}
			}
			
			foundWord = false;
			line = "";
			istartIndex = 0;
			iendIndex = 0;
			jstartIndex = 0;
			jendIndex = 0;
			
			// loop through all rows backwards.
			for (int i = rows-1; i >= 0; i--) {
				line ="";
				for (int j = cols-1; j >= 0; j--) {
					line += array[i][j];
					
					// sets the first character in the string to the starting index.
					if (array[i][j] == dictionary[z].charAt(0)) {
						jstartIndex = j;
					}
					// if the line contains the word we're looking for, it gets the position.
					if (line.contains(dictionary[z])) {
						istartIndex = i;
						iendIndex = i;
						jendIndex = j;
						board.highlightWord(istartIndex, jstartIndex, iendIndex, jendIndex);
						foundWord = true;
						break;
					}
				}
				if (foundWord == true) {
					break;
				}
			}
			
			
			foundWord = false;
			line = "";
			istartIndex = 0;
			iendIndex = 0;
			jstartIndex = 0;
			jendIndex = 0;
			
			// loops through all columns
			for (int j = 0; j < cols; j++) {
				line ="";
				
				for (int i = 0; i < rows; i++) {
					line += array[i][j];
					
					// if the line contains the word we're looking for, it gets the position.
					if (line.contains(dictionary[z])) {
						istartIndex = line.indexOf(dictionary[z]);
						iendIndex = i;
						jstartIndex = j;
						jendIndex = j;
						board.highlightWord(istartIndex, jstartIndex, iendIndex, jendIndex);
						foundWord = true;
						break;
					}
				}
				if (foundWord == true) {
					break;
				}
			}
			
			foundWord = false;
			line = "";
			istartIndex = 0;
			iendIndex = 0;
			jstartIndex = 0;
			jendIndex = 0;
			
			// loop through all columns backwards.
			for (int j = cols-1; j >= 0; j--) {
				line ="";
				for (int i = rows-1; i >= 0; i--) {
					line += array[i][j];
					
					// sets the first character in the string to the starting index.
					if (array[i][j] == dictionary[z].charAt(0)) {
						istartIndex = i;
					}
					
					// if the line contains the word we're looking for, it gets the position.
					if (line.contains(dictionary[z])) {
						iendIndex = i;
						jstartIndex = j;
						jendIndex = j;
						board.highlightWord(istartIndex, jstartIndex, iendIndex, jendIndex);
						foundWord = true;
						break;
					}
				}
				if (foundWord == true) {
					break;
				}
			}
		}
		return board;
	}
	
	
	
}
