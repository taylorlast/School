/*
*
* File name: TemperatureConverter.java
* Author: Taylor Last
* Submission Date: 2/22/2019
*
* This program does the following: 
* Aids the student in calculating his/her grade to see how well they 
* did in the course in letter grade form. It also shows the average 
* score they need to achieve to receive a certain letter grade
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

public class GradeCalculator {

	public static void main(String[] args) {
		// Prints Grading Scale
		System.out.print(
		"Grading Scale: \n" +
		"A\t" + "90-100\n" +
		"B\t" + "80-89\n" + 
		"C\t" + "70-79\n" +
		"D\t" + "60-69\n" +
		"F\t" + "below 60\n");
		
		//Checks to make sure that the grade is a valid letter grade
		Scanner scan = new Scanner (System.in);
		System.out.println("What letter grade do you want to achieve for this course? ");
		String desiredGrade = scan.nextLine();
		if (!(desiredGrade.equalsIgnoreCase("a") ||desiredGrade.equalsIgnoreCase("b") || desiredGrade.equalsIgnoreCase("c") ||
				desiredGrade.equalsIgnoreCase("d") || desiredGrade.equalsIgnoreCase("f"))) {
			System.out.println("Input Error");
			System.exit(0);
		}
		// Input Weight of category
		System.out.println("Enter Percentage Weights: ");
		System.out.print("Exam 1:\t\t");
		int exam1 = scan.nextInt();
		System.out.print("Exam 2:\t\t");
		int exam2 = scan.nextInt();
		System.out.print("Final Exam:\t");
		int finalExam = scan.nextInt();
		System.out.print("Labs:\t\t");
		int labs = scan.nextInt();
		System.out.print("Projects:\t");
		int projects = scan.nextInt();
		System.out.print("Attendance:\t");
		int attendance = scan.nextInt();
		System.out.print("Quizzes:\t");
		int quizzes = scan.nextInt();
		
		// Checks to make sure weights add up to 100
		int totalWeight = exam1 + exam2 + finalExam + labs + projects + attendance + quizzes;
		if (totalWeight != 100) {
			System.out.println("Weights don't add up to 100, program exiting...");
			System.exit(0);
		}
		double totalKnownGradeWeight = 0;
		int exam1Score = 0;
		int exam2Score = 0;
		int finalExamScore = 0;
		int labAverage = 0;
		int projAverage = 0;
		int attendAverage = 0;
		int quizAverage = 0;
		
		// Prompts user to enter grade if they know it and uses boolean logic to check to make sure that
		// the previous exam was known. 
		System.out.println("Enter your scores out of 100:");
		System.out.print("Do you know your Exam 1 score? ");
		String exam1Know = scan.next();
		exam1Know = exam1Know.toLowerCase();
		if (exam1Know.equals("y") || exam1Know.equals("yes")) {
			System.out.print("Score received on exam 1: ");
			exam1Score = scan.nextInt();
			totalKnownGradeWeight += exam1;
			
			System.out.print("Do you know your Exam 2 score? ");
			String exam2Know = scan.next();
			exam2Know = exam2Know.toLowerCase();
			if (exam2Know.equals("y") || exam2Know.equals("yes")) {
				System.out.print("Score received on exam 2: ");
				exam2Score = scan.nextInt();
				totalKnownGradeWeight += exam2;
				
				System.out.print("Do you know your Final Exam score? ");
				String finalExamKnow = scan.next();
				finalExamKnow = finalExamKnow.toLowerCase();
				if (finalExamKnow.equals("y") || finalExamKnow.equals("yes")) {
					System.out.print("Score received on final exam: ");
					finalExamScore = scan.nextInt();
					totalKnownGradeWeight += finalExam;
			}
			}
		}
			// Prompts user to enter in grades if they know them
			System.out.print("Do you know your lab average? ");
			String labKnow = scan.next();
			labKnow = labKnow.toLowerCase();
			if (labKnow.equals("y") || labKnow.equals("yes")) {
				System.out.print("Average Lab Grade: ");
				labAverage = scan.nextInt();
				totalKnownGradeWeight += labs;
				}
			System.out.print("Do you know your project average? ");
			String projKnow = scan.next();
			projKnow = projKnow.toLowerCase();
			if (projKnow.equals("y") || projKnow.equals("yes")) {
				System.out.print("Average Project Grade: ");
				projAverage = scan.nextInt();
				totalKnownGradeWeight += projects;
				}
			System.out.print("Do you know your attendance average? ");
			String attendKnow = scan.next();
			attendKnow = attendKnow.toLowerCase();
			if (attendKnow.equals("y") || attendKnow.equals("yes")) {
				System.out.print("Average Attendance Grade: ");
				attendAverage = scan.nextInt();
				totalKnownGradeWeight += attendance;
				}
			System.out.print("Do you know your Quiz average? ");
			String quizKnow = scan.next();
			quizKnow = quizKnow.toLowerCase();
			if (quizKnow.equals("y") || quizKnow.equals("yes")) {
				System.out.print("Average Quiz Grade: ");
				quizAverage = scan.nextInt();
				totalKnownGradeWeight += quizzes;
				}
			
			// Calculates the current grade score
			double currentScore = ((exam1 * exam1Score/totalKnownGradeWeight) + (exam2 * exam2Score/totalKnownGradeWeight) +
					(finalExam * finalExamScore/totalKnownGradeWeight) + (labs * labAverage/totalKnownGradeWeight) + 
					(projects * projAverage/totalKnownGradeWeight) + (attendance * attendAverage/totalKnownGradeWeight) +
					(quizzes * quizAverage/totalKnownGradeWeight));
			
			currentScore = (currentScore* 100);
			currentScore = Math.ceil(currentScore)/100;
			
			System.out.println("Current Grade Score: " + currentScore);
			String currentLetterGrade = "";
			// Calculates the current letter grade
			if (currentScore >= 90) {
				System.out.println("Your current letter grade is a A");
				currentLetterGrade = "a";
			}
			else if (currentScore >= 80) {
				System.out.println("Your current letter grade is a B");
				currentLetterGrade = "b";
			}
			else if (currentScore >= 70) {
				System.out.println("Your current letter grade is a C");
				currentLetterGrade = "c";
			}
			else if (currentScore >= 60) {
				System.out.println("Your current letter grade is a D");
				currentLetterGrade = "d";
			}
			else {
				System.out.println("Your current letter grade is a F");
				currentLetterGrade = "f";
			}
			// Tracks the lower bound for a letter grade
			double finalOverallScore = 0;
			
			if (desiredGrade.equals("a"))
				finalOverallScore = 90;
			else if (desiredGrade.equals("b"))
				finalOverallScore = 80;
			else if (desiredGrade.equals("c"))
				finalOverallScore = 70;
			else if (desiredGrade.equals("d"))
				finalOverallScore = 60;
			else
				finalOverallScore = 0;
			
			// Calculates the amount needed to receive the desired grade.
			double avgToFinalLetterGrade = ((100 * finalOverallScore) - (exam1 * exam1Score + exam2 * exam2Score + 
					finalExam * finalExamScore + labs * labAverage + projects * projAverage + attendance * attendAverage +
					quizzes * quizAverage))/(100-totalKnownGradeWeight);
			
			avgToFinalLetterGrade = (avgToFinalLetterGrade* 100);
			avgToFinalLetterGrade = Math.ceil(avgToFinalLetterGrade)/100;
			
			// Prints concluding statement based on score required in remaining items to receive the desired grade.
			if (totalKnownGradeWeight == 100 && desiredGrade.equals(currentLetterGrade))
				System.out.println("Congratulations! You receive the " + desiredGrade.toUpperCase() +
						" that you wanted!");
			else if (totalKnownGradeWeight == 100 && (!desiredGrade.equals(currentLetterGrade)))
				System.out.println("Sorry, you cannot receive a " + desiredGrade.toUpperCase() + " in the course");
			else if (totalKnownGradeWeight < 100 && (avgToFinalLetterGrade <= 100) && (avgToFinalLetterGrade >= 0))
				System.out.println("You have to score an average greater than or equal to " + avgToFinalLetterGrade +
						" in the remaining grade items to receive a " + desiredGrade.toUpperCase() + " in the course");
			else if (totalKnownGradeWeight < 100 && (avgToFinalLetterGrade > 100))
				System.out.println("Sorry, you cannot receive a " + desiredGrade.toUpperCase() + " in the course");
			else if (totalKnownGradeWeight < 100 && (avgToFinalLetterGrade < 0))
				System.out.println("You will receive at least a " + desiredGrade.toUpperCase() + " no matter what");
			else
				System.out.println("");
				
		}
	}
		
		

		