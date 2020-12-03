/*
*
* File name: Player.java
* Author: Taylor Last
* Submission Date: 4/12/2019
*
* Plays a game using OOP. User navigates through a map to find treasure.
* The user tries to avoid being eaten by a grue by keeping the path light
* with a lamp.
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
public class Player {

	// Initialize instance variables
	
	private Key theKey;
	private Lamp theLamp;
	private Room theRoom;
	private int x;
	private int y;
	
	//Getters
	
	public Key getKey() {
		return theKey;
	}
	
	public Lamp getLamp() {
		return theLamp;
	}
	
	public Room getRoom() {
		return theRoom;
	}
	
	public int getX() {
		return x;
	}
	
	public int getY() {
		return y;
	}
	
	//Setters
	
	public void setKey(Key newKey) {
		theKey = newKey;
	}
	
	public void setLamp(Lamp newLamp) {
		theLamp = newLamp;
	}
	
	public void setRoom(Room newRoom) {
		theRoom = newRoom;
	}
	
	public void setX(int newX) {
		x = newX;
	}
	
	public void setY (int newY) {
		y = newY;
	}
	
}
