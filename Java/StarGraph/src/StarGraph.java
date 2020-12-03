/*
*
* File name: StarGraph.java
* Author: Taylor Last
* Submission Date: 3/8/2019
*
* This program does the following: 
* Fills an array of x and y with user input and outputs
* a star graph using the coordinates.
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

public class StarGraph {

	public static void main(String[] args) {
		// Prompts user to enter amount of times the loop will execute. Then
		// it checks to make sure the number is greater than 0. 
		System.out.println("Please enter the number of x values to process: ");
		Scanner scan = new Scanner (System.in);
		int xLength = scan.nextInt();
		if (xLength <= 0) {
			System.out.println("The number of x values must be an integer greater than 0.");
			System.exit(0);
		}
        // Prompts the user for a minimum value of x.
		System.out.println("Enter a minimum value for x: ");
		double minValue = scan.nextDouble();
		System.out.println("Enter the amount to increment x: ");
		double increment = scan.nextDouble();
		// Checks to make sure the increment is greater than 0.
		if (increment <= 0) {
			System.out.println("The increment must be a decimal number greater than 0.");
			System.exit(0);
		}
		// Initializing arrays x and y.
		double [] x = new double [xLength];
		double [] y = new double [xLength];
		
		System.out.println("Values");
		// The for loop populates and prints the arrays x and y in the corrrect format.
		for (int i = 0; i < xLength; i++) {
			x[i] = minValue + (increment * i);
			y[i] = (20.0)*(Math.abs(Math.sin(x[i])));
			System.out.print("x: ");
			System.out.printf("%.3f", x[i]);
			System.out.print(", " + "y: ");
			System.out.printf("%.3f", y[i]);
			System.out.println();
		}
		System.out.println("Graph");
		// The for loop creates a graph based on the y values in an int value.
		for (int i = 0; i < xLength; i++) {
			x[i] = minValue + (increment * i);
			y[i] = (int)((20.0)*(Math.abs(Math.sin(x[i]))));
			System.out.print(":");
			for (int j = 0; j < y[i]; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}

}
