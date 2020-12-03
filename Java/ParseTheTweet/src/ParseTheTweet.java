/*
* ParseTheTweet.java
* Author: Taylor Last
* Submission Date: [1/31/19]
*
* Purpose: Takes a tweet and displays the type, detail, location,
* latitude, and longitude. The lab is a lesson for how String methods
* work.
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

public class ParseTheTweet {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner (System.in);
		System.out.println("Enter in the Tweet:");
		String tweet1 = scan.nextLine();
		String tweet = tweet1.trim();
		
		String type = "";
	    String location = "";
		String detail = "";
		String longitude = "";
		String latitude = "";
		
		int start = tweet.indexOf("#");
		int finish = tweet.indexOf(";");
		
		type = tweet.substring((start+5), finish);
		type = type.toUpperCase();
		System.out.println("Type: \t\t\t" + type);
		tweet = tweet.substring(finish+1);
		tweet = tweet.trim();
		finish = tweet.indexOf(";");
		
		detail = tweet.substring((start+5), finish);
		System.out.println("Detail: \t\t" + detail);
		tweet = tweet.substring(finish+1);
		tweet = tweet.trim();
		finish = tweet.indexOf(";");
		
		location= tweet.substring((start + 5), finish);
		location = location.replace(",","-");
		System.out.println("Location: \t\t" + location);
		tweet = tweet.substring(finish+1);
		tweet = tweet.trim();
		finish = tweet.indexOf(";");
		
		latitude = tweet.substring((start + 5), finish);
		System.out.println("Latitude: \t\t" + latitude);
		tweet = tweet.substring(finish+1);
		tweet = tweet.trim();
		finish = tweet.indexOf(";");
		
		longitude = tweet.substring((start + 5), finish);
		System.out.println("Longitude: \t\t" + longitude);
		
		
		
	}
}
