/* ******************************************************
* Circle.java
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
*/
//*******************************************************
public class Circle {
	
	// declare the private String instance  name
	private String name;
	// declare the private double instance  radius
	private double radius;
	// declare the private double instance  x
	private double x;
    // declare the private double instance  y
	private double y;

	//Used to compare doubles.  Remember, don't compare doubles directly using ==
	public static final double THRESHOLD = 0.000000001;

	//----------------------------------------------
	// getName - returns the value of name
	//----------------------------------------------
	public String getName() {
		
		return name;
		
	}
	
	//----------------------------------------------
	// getX - returns the value of x
	//----------------------------------------------
	public double getX() {
		
		return x;
	}
	

	//----------------------------------------------
	// getY - returns the value of y
	//----------------------------------------------
	public double getY() {
		
		return y;
		
	}
	
	//----------------------------------------------
	// getRadius - returns the value of radius
	//----------------------------------------------
	public double getRadius() {
		
		return radius;	
	}
	
	//----------------------------------------------
	// setName - assigns a new value to name
	//----------------------------------------------
	public void setName(String x) {
		
		name = x;
	}

	//----------------------------------------------
	// setX - assigns a new value to x
	//----------------------------------------------
	public void setX(double a) {
		
		x = a;
			
	}
	
	//----------------------------------------------
	// setY - assigns a new value to y
	//----------------------------------------------
	public void setY(double a) {
		
		y = a;	
	}
	
	
	//----------------------------------------------
	// setRadius - assigns a new value to radius
	//----------------------------------------------
	public void setRadius(double a) {
		if (a > 0) {
		radius = a;
		}
		else {
			radius = radius;
		}
	}
	
	//--------------------------------------------------------
	// area - returns the area of the circle
	//--------------------------------------------------------
	public double area() {
		
		double area = Math.PI * (radius * radius);
		return area;
	}
	
	//--------------------------------------------------------
	// perimeter - returns the perimeter of the circle
	//--------------------------------------------------------
	public double perimeter() {
		
		double perimeter = 2 * Math.PI * radius;
		return perimeter;
	}
	
	//--------------------------------------------------------
	// diameter - calculates the diameter of the circle
	//--------------------------------------------------------
	public double diameter() {
		
		double diameter = 2 * radius;
		return diameter;
	}

	
	//--------------------------------------------------------
	// isUnitCircle - return true if the radius of this circle
	//                is 1 and its center is (0,0) and false
	//      	      otherwise.
	//--------------------------------------------------------
	public boolean isUnitCircle() {
		
		if (radius > (1 -THRESHOLD) && radius < (1 + THRESHOLD) &&  
				x > THRESHOLD && x < (THRESHOLD * (-1)) && y > THRESHOLD && y < (THRESHOLD * (-1))) {
			return true;
		}
		else {
			return false;
		}
	}
	
	
	//--------------------------------------------------------
	// toString - return a String representation of
	//            this circle in the following format:
	//			  name: name
	//            center:(x,y)
	//            radius: r
	//--------------------------------------------------------
	public String toString() {
		
		String output = "\nname: " + name +
						"\ncenter: (" + x + "," + y + ")" +
						"\nradius: " + radius;
		
		return output;
	}

	// This method returns true when the radius and centers of both circles are the same; otherwise,
	// it returns false. 
	public boolean equals(Circle anotherCircle) {
		if (Math.abs(anotherCircle.getRadius() - radius) < THRESHOLD && Math.abs(anotherCircle.getX() - x) < THRESHOLD &&
				Math.abs(anotherCircle.getY() - y) < THRESHOLD) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//This method returns the distance between the centers of the circle executing the method and
	//anotherCircle.
	
	public double distance(Circle anotherCircle) {
		return Math.sqrt(Math.pow(x - anotherCircle.getX(),2) + Math.pow(y - anotherCircle.getY(),2));
	}
	
	// The method isSmaller returns true when the circle executing the method (calling object) is
	//smaller than the parameter (anotherCircle). Otherwise, it returns false.
	
	public boolean isSmaller(Circle anotherCircle) {
		
		if (this.diameter() - anotherCircle.diameter() < 0) {
			return true;
		}
		else {
			return false;
		}
	}
	
	//Works similar to the compareTo method in the String class. If the calling object is larger, the
	//method returns a positive 1. If the calling object is smaller than anotherCircle, it returns -1.
	//Otherwise, it returns 0.
	
	public int compareTo(Circle anotherCircle) {
		if (this.isSmaller(anotherCircle)) {
			return -1;
		}
		else if (anotherCircle.isSmaller(this)) {
			return 1;
		}
		else {
			return 0;
		}
	}
	
	//The method intersects returns true when the circle executing the method and
	// anotherCircle have an intersecting area (one or more points enclosed by both circles);
	// otherwise, it returns false. 
	public boolean intersects(Circle anotherCircle) {
		if (this.distance(anotherCircle) < (radius + anotherCircle.getRadius())){
			return true;
		}
		else {
			return false;
		}
	}
	
}