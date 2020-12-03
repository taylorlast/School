/*
*
* File name: Stat.java
* Author: Taylor Last
* Submission Date: 4/16/2019
*
* The stat class creates an array and creates methods for the array that includes 
* getters and setters. It also checks if two arrays are equal, it gets the minimum value,
* it gets the maximum value, it gets the average, and it gets the mode. 
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
import java.util.Arrays;

public class StatOrig {

	private double[] data;
	
	// Constructor that initializes a new array on length 1 with the value 0.0
	public StatOrig() {
		double [] d = new double [1];
		d[0] = 0.0;
		data = d;
	}
	
	// Constructor that initializes a new array double [] d.
	public StatOrig(double[] d) {
		data = new double[d.length];
		for (int i = 0; i < d.length; i++) {
			data[i] = d[i];
		}
	}
	
	// Creates a new array that is a copy of the instance variable and prints the copy.
	public double[] getData() {
		double[] d = new double[data.length];
		for (int i = 0; i < data.length; i++) {
			d[i] = this.data[i];
		}
		return d;
	}
	
	// Creates a new array that is a copy of the instance variable and manipulates the copy with the new array.
	public void setData(double[] d) {
		data = new double[d.length];
		for (int i = 0; i < d.length; i++) {
			data[i] = d[i];
		}
	}
	
	// Checks to see if both arrays are equal to each other.
	public boolean equals (Stat s) {
		int count = 0;
		int length = 0;
		double[] d = new double [data.length];
		d = s.getData();
		if (data.length <= d.length) {
			length = data.length;
		}
		if (data.length > d.length) {
			length = d.length;
		}
		for (int i = 0; i < length;i++) {
			if (data[i] != d[i]) {
				count++;
			}
		}
		if (count > 0) {
			return false;
		}
		else {
			return true;
		}
	}
	
	// Prints out the array formatted correctly with [] and commas.
	public String toString() {
		String dataString = "[";
		for (int i = 0; i < data.length; i++) {
			if (i != data.length-1) {
				dataString += data[i] + ", ";
			}
			else {
				dataString += data[i];
			}
		}
		dataString += "]";
		return dataString;
	}
	
	// Finds the min of the doubles in the array
	public double min() {
		double min = data[0];
		for (int i = 0; i < data.length;i++) {
			if (data[i] < min) {
				min = data[i];
			}
		}
		return min;
	}
	
	// Finds the max of the doubles in the array
	public double max() {
		double max = data[0];
		for (int i = 0; i < data.length;i++) {
			if (data[i] > max) {
				max = data[i];
			}
		}
		return max;
	}
	
	// Finds the average of the doubles in the array
	public double average() {
		double sum = 0;
		for (int i = 0; i < data.length;i++) {
			sum += data[i];
		}
		double average = (sum/data.length);
		return average;
	}
	
	// Finds the double that occurs the most in the array. If the array is bimodal, the program returns NaN.
	public double mode() {
		int count = 0;
		int modeCount = 0;
		double mode = data[0];
		
		// Nested for loop takes the index and compares it to the rest of the array indicies. 
		for (int i = 0; i < data.length; i++) {
			if (mode == data[i]) {
				count = 0;
				modeCount++;
			}
			// increases count when doubles int the array are equal.
			for (int j = 0; j < data.length; j++) {
				if (data[i] == data[j]) {
					count++;
				}
				
				if (count > modeCount) {
					mode = data[i];
				}
				if (count == modeCount) {
					mode = Double.NaN;
				}
			}
		}
		if (count <= 1 || modeCount <= 1) {
			mode = Double.NaN;
		}
		if (data.length == 1) {
			mode = data[0];
		}
		return mode;
	}
}
