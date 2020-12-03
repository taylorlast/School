/*
*
* File name: Stat.java
* Author: Taylor Last
* Submission Date: 4/21/2019
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

public class Stat {

	private double[] data;
	
	// Constructor that initializes a new array on length 1 with the value 0.0
	public Stat() {
		double [] d = new double [0];
		data = d;
	}
	
	// Constructor that initializes a new array double [] d.
	public Stat(double[] d) {
		data = new double[d.length];
		if(d != null) {
			for (int i = 0; i < d.length; i++) {
				data[i] = d[i];
			}
		}
	}
	
	public Stat(float [] f) {
		data = new double[f.length];
		if(f != null) {
			for (int i = 0; i < f.length; i++) {
				data[i] = f[i];
			}
		}
	}
	
	public Stat(int [] i) {
		data = new double[i.length];
		if(i != null) {
			for (int index = 0; index < i.length; index++) {
				data[index] = i[index];
			}
		}
	}
	
	public Stat(long[] lo) {
		data = new double[lo.length];
		if(lo != null) {
			for (int i = 0; i < lo.length; i++) {
				data[i] = lo[i];
			}
		}
	}
	
	public void setData(float[] f) {
		data = new double[f.length];
		if (f != null) {
			for (int i = 0; i < f.length; i++) {
				data[i] = f[i];
			}
		}
	}
	
	// Creates a new array that is a copy of the instance variable and manipulates the copy with the new array.
	public void setData(double[] d) {
		if (d != null) {
			data = new double[d.length];
			for (int i = 0; i < d.length; i++) {
				data[i] = d[i];
			}
		}
		else {
			data = new double[0];
		}
	}
	
	public void setData(int[] i) {
		if(i != null) {
			data = new double[i.length];
			for (int index = 0; index < i.length; index++) {
				data[index] = i[index];
			}
		}
		else {
			data = new double[0];
		}
	}
	
	public void setData(long[] lo) {
		if (lo != null) {
			data = new double[lo.length];
			for (int i = 0; i < lo.length; i++) {
				data[i] = lo[i];
			}
		}
		else {
			data = new double[0];
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
	
	// Checks to see if both arrays are equal to each other.
	public boolean equals (Stat s) {
		if (s != null && s.data.length == data.length) {
			int count = 0;
			int length = 0;
			
			double[] d = new double [length];
			d = s.getData();
			
			if (data.length <= d.length) {
				length = d.length;
			}
			if (data.length > d.length) {
				length = data.length;
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
		else {
			return false;
		}
	}
	
	public void reset() {
		data = new double[0];
	}
	
	public void append(int[] i) {
		if(i != null) {
			double [] array = new double[i.length + data.length];
			for (int index = 0; index < data.length; index++) {
				array[index] = data[index];
			}
			for (int index = data.length; index < array.length; index++) {
				array[index] = i[index - data.length];
			}
			data = array;
		}
	}
	
	public void append(float[] f) {
		if(f != null) {
			double [] array = new double[f.length + data.length];
			for (int index = 0; index < data.length; index++) {
				array[index] = data[index];
			}
			for (int index = data.length; index < array.length; index++) {
				array[index] = f[index - data.length];
			}
			data = array;
		}
	}
	
	public void append(long[] lo) {
		if(lo != null) {
			double [] array = new double[lo.length + data.length];
			for (int index = 0; index < data.length; index++) {
				array[index] = data[index];
			}
			for (int index = data.length; index < array.length; index++) {
				array[index] = lo[index - data.length];
			}
			data = array;
		}
	}
	
	public void append(double[] d) {
		if(d != null) {
			double [] array = new double[d.length + data.length];
			for (int index = 0; index < data.length; index++) {
				array[index] = data[index];
			}
			for (int index = data.length; index < array.length; index++) {
				array[index] = d[index - data.length];
			}
			data = array;
		}
	}
	
	public boolean isEmpty() {
		return data.length == 0;
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
		if (data.length != 0) {
			double min = data[0];
			for (int i = 0; i < data.length;i++) {
				if (data[i] < min) {
					min = data[i];
				}
			}
			return min;
			}
		else {
			return Double.NaN;
		}
	}
	
	// Finds the max of the doubles in the array
	public double max() {
		if (data.length != 0) {
			double max = data[0];
			for (int i = 0; i < data.length;i++) {
				if (data[i] > max) {
					max = data[i];
				}
			}
			return max;
		}
		else {
			return Double.NaN;
		}
	}
	
	// Finds the average of the doubles in the array
	public double average() {
		if (data.length != 0) {
			double sum = 0;
			for (int i = 0; i < data.length;i++) {
				sum += data[i];
			}
			double lng = data.length;
			double average = (sum/data.length);
			return average;
		}
		else {
			return Double.NaN;
		}
	}
	
	// Finds the double that occurs the most in the array. If the array is bimodal, the program returns NaN.
	public double mode() {
		if (data.length != 0) {
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
					// Checks to make sure that it doesn't set a bimodal mode. The "+2"
					// comes from the max difference between modeCount and count before the 
					// value becomes the new mode. 
					if (count > modeCount + 2) {
						mode = data[i];
					}
					
				}
			}
			// Makes sure there is no mode when the value only occurs once. 
			if (count <= 1 || modeCount <= 1) {
				mode = Double.NaN;
			}
			// If the array has one value, the mode is that value.
			if (data.length == 1) {
				mode = data[0];
			}
			return mode;
			
		}
		else {
			return Double.NaN;
		}
	}
	
	private int occursNumberOfTimes(double value) {
		int count = 0;
		for (int i = 0; i < data.length; i++) {
			if (value == data[i]) {
				count++;
			}
		}
		return count;
	}
	
	public double variance() {
		double average = this.average();
		double sumOfErr = 0;
		for (int i = 0; i < data.length; i++) {
			sumOfErr += Math.pow(data[i] - average, 2);
		}
		return sumOfErr/data.length;
	}
	
	public double standardDeviation() {
		if (data.length == 0) {
			return Double.NaN;
		}
		else {
			return Math.sqrt(this.variance());
		}
	}
}
