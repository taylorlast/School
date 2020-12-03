/*
*
* File name: Adventure.java
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
import java.util.Scanner;

public class Adventure {

	public static void main(String[] args) {
		
		Player player1 = new Player();
		player1.setX(0);
		player1.setY(0);
		int x = 0;
		int y = 0;
		boolean isAlive = true;
		
		Map map = new Map();
		Room firstRoom = map.getRoom(0,0);
		Room playersRoom = map.getRoom(player1.getX(), player1.getY());
		Lamp lamp = new Lamp();
		
		System.out.println("Welcome to UGA Adventures: Episode I\n" + 
				"The Adventure of the Cave of Redundancy Adventure\n" + 
				"By: Taylor Last");
		
		System.out.println();
		System.out.println(playersRoom.getDescription());
		Scanner scan = new Scanner (System.in);
		
		while (isAlive) {
			String command = scan.nextLine();
			
			if (command.equalsIgnoreCase("get lamp")) {
				if (playersRoom.getLamp() != null) {
					System.out.println("OK");
					player1.setLamp(playersRoom.getLamp());
					playersRoom.clearLamp();
				}
				else {
					System.out.println("No lamp present");
				}	
			}
			
			else if (command.equalsIgnoreCase("light lamp")) {
				if (player1.getLamp() != null) {
					System.out.println("OK");
					lamp.setIsLit(true);
				}
				else {
					System.out.println("You don't have a lamp to light");
				}
			}
			
			else if (command.equalsIgnoreCase("north")) {
				if (playersRoom.canGoNorth()) {
					if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
						System.out.println("You have stumbled into a passing grue, and have been eaten");
						System.exit(0);
					}
					else {
							x++;
							player1.setX(x);
							playersRoom = map.getRoom(x, y);
							if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
								System.out.println("It is pitch black, you can't see anything. You may be eaten by a grue!");
							}
							else {
							System.out.println(playersRoom.getDescription());
							}
						}
					}
				else {
					System.out.println("Can't go that way");
				}
			}
			
			else if (command.equalsIgnoreCase("south")) {
				if (playersRoom.canGoSouth()) {
					if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
						System.out.println("You have stumbled into a passing grue, and have been eaten");
						System.exit(0);
					}
					else {
						x--;
						player1.setX(x);
						playersRoom = map.getRoom(x, y);
					
						if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
							System.out.println("It is pitch black, you can't see anything. You may be eaten by a grue!");
						}
						else {
							System.out.println(playersRoom.getDescription());
						}
					}
				}
				else {
					System.out.println("Can't go that way");
				}
			}
			
			else if (command.equalsIgnoreCase("east")) {
				if (playersRoom.canGoEast()) {
					if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
						System.out.println("You have stumbled into a passing grue, and have been eaten");
						System.exit(0);
					}
					else {
						y++;
						player1.setY(y);
						playersRoom = map.getRoom(x, y);
						if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
							System.out.println("It is pitch black, you can't see anything. You may be eaten by a grue!");
						}
						else {
							System.out.println(playersRoom.getDescription());
						}
						}
				}
				else {
					System.out.println("Can't go that way");
				}
			}
			
			else if (command.equalsIgnoreCase("west")) {
				if (playersRoom.canGoWest()) {
					if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
						System.out.println("You have stumbled into a passing grue, and have been eaten");
						System.exit(0);
					}
					else {
						y--;
						player1.setY(y);
						playersRoom = map.getRoom(x, y);
						if (playersRoom.isDark() == true && (lamp == null || lamp.getIsLit() == false)) {
							System.out.println("It is pitch black, you can't see anything. You may be eaten by a grue!");
						}
						else {
							System.out.println(playersRoom.getDescription());
						}
						}
				}
				else {
					System.out.println("Can't go that way");
				}
			}
			
			else if (command.equalsIgnoreCase("look")) {
				System.out.println(playersRoom.getDescription());
				if (playersRoom.isDark() && (lamp == null || lamp.getIsLit() == false)) {
					System.out.println("It is pitch black, you can't see anything. You may be eaten by a grue!");
				}
				if( playersRoom.getLamp() != null) {
					System.out.println("There is an old oil lamp here that was made long ago");
				}
				if(playersRoom.getKey() != null) {
					System.out.println("You see the outline of a key on a dusty shelf that's covered in dust.");
				}
				if (playersRoom.getChest() != null) {
					System.out.println("There is a large, wooden, massive, oaken chest here with the word “CHEST” carved into it");
					
				}
				if (!(playersRoom.isDark() && (lamp == null || lamp.getIsLit() == false))) {
				System.out.println("Exits are: ");
				if (playersRoom.canGoNorth()) {
					System.out.println("north ");
				}
				if (playersRoom.canGoSouth()) {
					System.out.println("south ");
				}
				if (playersRoom.canGoEast()) {
					System.out.println("east ");
				}
				if (playersRoom.canGoWest()) {
					System.out.println("west ");
				}
			}
			}
				
			else if (command.equalsIgnoreCase("get key")) {
				if (playersRoom.getKey() != null) {
					System.out.println("OK");
					player1.setKey(playersRoom.getKey());
					playersRoom.clearKey();
				}
				else {
					System.out.println("No key present");
				}
			}
			
			else if (command.equalsIgnoreCase("open chest")) {
				if (playersRoom.getChest() != null && playersRoom.getChest().isLocked()== false) {
					System.out.println("all the gold");
				}
				else if (playersRoom.getChest() != null && playersRoom.getChest().isLocked() == true) {
					System.out.println("The chest is locked");
				}
				else {
					System.out.println("No chest present");
				}
			}
			
			else if (command.equalsIgnoreCase("unlock chest")) {
				if (player1.getKey() != null && playersRoom.getChest() != null) {
					System.out.println("OK");
					player1.getKey().use(playersRoom.getChest());
				}
				if (player1.getKey() == null && playersRoom.getChest() != null) {
					System.out.println("Need a key to do anything!");
				}
				if (playersRoom.getChest() == null) {
					System.out.println("No chest to unlock");
				}
			}
			
			else {
				System.out.println("I don't know how to do that");
			}
		}
	}
}
