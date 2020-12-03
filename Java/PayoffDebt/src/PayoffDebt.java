/*
* PayoffDebt.java
* Author: Taylor Last
* Submission Date: [2/8/19]
*
* Purpose: Take user input for principal, annual interest rate,
* and monthly payment and calculates the number of months needed
* to pay off credit card debt
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
import java.lang.Math;

public class PayoffDebt {


	public static void main(String[] args) {
		
		Scanner scan = new Scanner (System.in);
		System.out.println("Principal: ");
		double principal = scan.nextDouble();
		System.out.println("Annual Interest Rate (%): ");
		double intRate = scan.nextDouble();
		System.out.println("Monthly Payment: ");
		double monthPay = scan.nextDouble();
		
		double numOfMonths;
		int numOfMonthsCeil;
		
		// Calculates the number of months needed to pay off
		numOfMonths = ((Math.log(monthPay)) - Math.log(monthPay - (intRate/1200.0)
						* principal))/(Math.log((intRate/1200.0)+1.0));

		numOfMonthsCeil = (int)(Math.ceil(numOfMonths));
		double totalAmtPaid = numOfMonthsCeil * monthPay;
		double interestPaid = totalAmtPaid - principal;
		double overPay = (totalAmtPaid - (numOfMonths * monthPay));
		
		System.out.printf("Principal: \t\t\t %1.2f", principal);
		System.out.println();
		System.out.println("Annaul Interest Rate (%): \t " + intRate);
		System.out.printf("Monthly Payment: \t\t %1.2f", monthPay);
		System.out.println();
		System.out.println();
		System.out.println("Months needed to pay off: \t " + 
							numOfMonthsCeil);
		System.out.printf("Total Amount Paid: \t\t $%1.2f", totalAmtPaid);
		System.out.println();
		System.out.printf("Total Interest Paid: \t\t $%1.2f", interestPaid);
		System.out.println();
		System.out.printf("OverPayment: \t\t\t $%1.2f", overPay);
		
	}

}
