/*
* ClassifyMessage.java
* Author: Taylor Last
* Submission Date: [2/8/19]
*
* Purpose: Uses input from a tweet and displays a category 
* based on the wording within the tweet using if-else.
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

public class ClassifyMessage {

	enum MessageCategory {NEED, OFFER, ALERT, INFO, UNKNOWN};
	
	public static void main(String[] args) {
		
		Scanner scan = new Scanner (System.in);
		
		String catString, payload;
		double longitude, latitude;
		boolean isInRange;
		MessageCategory category;
		
		double south = 39.882343;
		double north = 40.231315;
		double west = -105.743511;
		double east = -104.907864;
		
		System.out.println("Please enter a formatted message: ");
		
		catString = scan.next();
		latitude = scan.nextDouble();
		longitude = scan.nextDouble();
		payload = scan.nextLine();
		
		if(catString.equalsIgnoreCase("fire") || catString.equalsIgnoreCase("smoke"))
			category = MessageCategory.ALERT;
		else if (catString.equalsIgnoreCase("need"))
			category = MessageCategory.NEED;
		else if (catString.equalsIgnoreCase("offer"))
			category = MessageCategory.OFFER;
		else if (catString.equalsIgnoreCase("structure") || catString.equalsIgnoreCase("road")
				|| catString.equalsIgnoreCase("photo") || catString.equalsIgnoreCase("evac"))
			category = MessageCategory.INFO;
		else
			category = MessageCategory.UNKNOWN;
		
		if (latitude >= south && latitude <= north && longitude <= east &&
				longitude >= west)
			isInRange = true;
		else
			isInRange = false;
				
		System.out.println("Category: \t " + category);
		System.out.println("Raw Cat: \t " + catString);
		System.out.println("Message: \t" + payload);
		System.out.println("Latitude: \t " + latitude);
		System.out.println("Longitude: \t " + longitude);
		System.out.println("In Range: \t " + isInRange);
		
	}

}
