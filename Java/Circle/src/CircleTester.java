/*******************************************************
// CircleTester.java
* Author: Taylor Last
* Submission Date: [3/29/19]
*
* Purpose:  
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
//  A client to test the functionality of objects
//  of the class Circle
// 
//*******************************************************
 * 
 */
public class CircleTester{
	public static final double THRESHOLD = 0.000000001;
	
	public static void main(String[] args) {
		
		Circle circle1 = new Circle();
		Circle circle2 = new Circle();
		circle1.setName("Circle 1");
		circle1.setX(0.0);
		circle1.setY(0.0);
		circle1.setRadius(2);
		circle2.setName("Circle 2");
		circle2.setX(2.0);
		circle2.setY(1.0);
		circle2.setRadius(1);
		System.out.println("circle1="+circle1);
		System.out.println("circle2="+circle2);
		
		// If the method setRadius is implemented correctly,
		// a call to setRadius with a negative number
		// will not change the value of the circle's radius.
		//
		circle1.setRadius(-2.0); 
		
		//This is a unit test.  It is best to have tests output pass or fail instead of just a bunch of values.
		//Notice how the double comparison is done
		if(Math.abs(2-circle1.getRadius()) < THRESHOLD)
			System.out.println("PASSED: Set Radius");
		else
			System.out.println("FAILED: Set Radius");
		
		//
		// Reset the center of circle1 (-3.0,4.0)
		//
		circle1.setX(-3.0);
		circle1.setY(4.0);
		
		
		// print circle1 characteristics (center and radius), use a statement similar 
		// to the previous println statements. Note that is not necessary to call
		//the method toString, why?
		System.out.println();
		System.out.println("circle1="+circle1);
		
		// set the circle2 radius to 5.3
		circle2.setRadius(5.3);
		
		// print circle2 characteristics (center and radius), use a statement similar to the first and
		// second println statements
		System.out.println(circle2.toString());
		
		// print circle1 diameter, area and perimeter
		System.out.println();
		System.out.println("Circle 1 diameter: " + circle1.diameter());
		System.out.println("Circle 1 area: " + circle1.area());
		System.out.println("Circle 1 perimeter: " + circle1.perimeter());
		
		// print circle2 diameter, area and perimeter
		System.out.println();
		System.out.println("Circle 2 diameter: " + circle2.diameter());
		System.out.println("Circle 2 area: " + circle2.area());
		System.out.println("Circle 2 perimeter: " + circle2.perimeter());
		
		// display whether circle1 is a unit circle
		System.out.println();
		if (circle1.isUnitCircle() == true) {
			System.out.println("Circle 1 is a unit circle.");
		}
		else {
			System.out.println("Circle 1 is not a unit circle");
		}
		// display whether circle2 is a unit circle
		System.out.println();
		if (circle2.isUnitCircle() == true) {
			System.out.println("Circle 2 is a unit circle.");
		}
		else {
			System.out.println("Circle 2 is not a unit circle");
		}
		// your additional tests should be placed below here.  Make sure to include at least 2-3 test cases
		// for each method you write.  It is best to write proper unit tests which print pass, fail for each
		// test instead of just dumping values to the screen.
		
		// Equals check
		System.out.println();
		System.out.println("Equals method tests:\nFirst case: ");
		
		if (circle1.equals(circle2)) {
			System.out.println ("Passed: they are equal");
		}
		else {
			System.out.println ("Failed: they are not equal");
		}
		
		circle1.setX(0);
		circle2.setX(0);
		circle1.setY(0);
		circle2.setY(0);
		circle1.setRadius(1);
		circle2.setRadius(1);
		
		System.out.println("New Case:");
		if (circle1.equals(circle2)) {
			System.out.println ("Passed: they are equal");
		}
		else {
			System.out.println ("Failed: they are not equal");
		}
		
		// Distance checks
		System.out.println();
		System.out.println("Distance method tests:\nFirst case: ");
		
		if (circle1.distance(circle2) == 0) {
			System.out.println ("Passed: the distance was correct");
		}
		else {
			System.out.println ("Failed: the distance was incorrect");
		}
		
		circle1.setX(4);
		circle2.setX(0);
		circle1.setY(3);
		circle2.setY(0);
		circle1.setRadius(1);
		circle2.setRadius(1);
		
		System.out.println("New Case:");
		if (circle1.distance(circle2) == 5) {
			System.out.println ("Passed: the distance was correct");
		}
		else {
			System.out.println ("Failed: the distance was incorrect");
		}
		
		// isSmaller check
		System.out.println();
		System.out.println("isSmaller method tests:\nFirst case: ");
		
		if (circle1.isSmaller(circle2)) {
			System.out.println ("Passed: circle1 is smaller");
		}
		else {
			System.out.println ("Failed: circle1 is not smaller");
		}
		
		circle1.setX(0);
		circle2.setX(0);
		circle1.setY(0);
		circle2.setY(0);
		circle1.setRadius(1);
		circle2.setRadius(3);
		
		System.out.println("New Case:");
		if (circle1.isSmaller(circle2)) {
			System.out.println ("Passed: circle1 is smaller");
		}
		else {
			System.out.println ("Failed: circle1 is not smaller");
		}
		
		// compareTo check
		System.out.println();
		System.out.println("compareTo method tests:\nFirst case: ");
		
		if (circle1.compareTo(circle2) == 1) {
			System.out.println ("Passed: circle1 is larger");
		}
		else {
			System.out.println ("Failed: circle1 is not larger");
		}
		
		circle1.setX(0);
		circle2.setX(0);
		circle1.setY(0);
		circle2.setY(0);
		circle1.setRadius(1);
		circle2.setRadius(1);
		
		System.out.println("New Case:");
		if (circle1.compareTo(circle2) == 0) {
			System.out.println ("Passed: They are the same size");
		}
		else {
			System.out.println ("Failed: They are not the same size");
		}
		
		// intersects check
		System.out.println();
		System.out.println("intersects method tests:\nFirst case: ");
		
		if (circle1.intersects(circle2)) {
			System.out.println ("Passed: they intersect");
		}
		else {
			System.out.println ("Failed: they do not intersect");
		}
		
		circle1.setX(4);
		circle2.setX(0);
		circle1.setY(3);
		circle2.setY(0);
		circle1.setRadius(3);
		circle2.setRadius(3);
		
		System.out.println("New Case:");
		if (circle1.intersects(circle2)) {
			System.out.println ("Passed: they intersect");
		}
		else {
			System.out.println ("Failed: they do not intersect");
		}
	}
	
}