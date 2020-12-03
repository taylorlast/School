import java.text.DecimalFormat;


/**
*
* Person.java
* Author: Taylor Last
* Submission Date: [3/29/19]
*
* Purpose: Uses OOP to create 5 random houses and a person. The person has the option
* to Look at the 5 houses for sale, buy a house, sell a house, see their profile, or exit. 
* The program runs until they exit.
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
* 
* Class representing a person (a human user) on a real estate market.
* A person has a name, age, cash, and (potentially) a house.
*/
public class Person {

	/* Instance variables */

	private String name;
	private int age;
	private double cash;
	private House house;
	
	/* Constructors */

	/**
	 * The Default constructor creates a 21 year old John L. with a penny of cash and no home.
	 */
	public Person() {
		
		name = "John L.";
		age = 21;
		cash = .01;
		house = null;
		
	}
	/**
	 * A second constructor that enables the creation of a custom instance of the Person class. 
	 * The house instance variable is set to null.
	 * @param name : the person's name 
	 * @param age : the person's age
	 * @param cash : the amount of money the person has
	 */
	public Person(String name, int age, double cash) {
		
		this.name = name;
		this.age = age;
		this.cash = cash;
		house = null;

	}

	/**
	 * A third constructor including a parameter for the persons house. The house is also updated
	 * because it is no longer for sale.
	 * @param name : the person's name 
	 * @param age : the person's age
	 * @param cash : the amount of money the person has
	 * @param house : the person's home
	 */
	public Person(String name, int age, double cash, House house) {
		
		
		this.name = name;
		this.age = age;
		this.cash = cash;
		this.house = house;
		house.setForSale(false);
		
	}
	
	/**
	 * Show the name and age of the person as well as their assets (cash and home if they have one).
	 * E.g.
	 * Name: John L.
	 * Age: 20 years old
	 * Cash: $ 0.01
	 */
	@Override
	public String toString() {
		DecimalFormat decimalFormatObj = (DecimalFormat) DecimalFormat.getInstance();
        decimalFormatObj.setDecimalSeparatorAlwaysShown(true);
        decimalFormatObj.setMinimumFractionDigits(3);
        decimalFormatObj.setMaximumFractionDigits(3);
		String s = "";
		s+= "Name: " + getName() + "\n";
		s+= "Age: " + getAge() + " years old \n";
        decimalFormatObj.setMinimumFractionDigits(2);
        decimalFormatObj.setMaximumFractionDigits(2);
		s+= "Cash: $" + decimalFormatObj.format(getCash()) + "\n";
		return s;
		
	}
	
	/* Accessors / Getters */
	
	/**
	 * @return the person's name 
	 */
	public String getName() {
		
		return name;
		
	}
	/**
	 * @return the person's age
	 */
	public int getAge() {
		
		return age;
		
	}
	
	/**
	 * @return the amount of cash this person has
	 */
	public double getCash() {
		
		return cash;
		
	}
	
	/**
	 * @return a reference the house object currently owned by this person
	 */
	public House getHouse() {
		
		return house;
		
	}
	

	/**
	 * @return true if this person has a home
	 */
	public boolean ownsAHouse() {
		
		if (house == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	/* Mutators */
	
	/**
	 * @param amount : the amount of cash to give this person
	 */
	public void addCash(double amount) {
		
		cash += amount;

	}
	
	/**
	 * If this person owns home, put it up for sale and pay the person the price of the home.
	 */
	public void sellHome() {
		
		if (house != null) {
			house.setForSale(true);
			cash += house.getPrice();
			System.out.println(name + " has sold their house!");
			house = null;
		}
		else {
			System.out.println(name + " has no house to sell.");
		}
		
	}

	/**
	 * This method lets the person buy a home if they do not already have a home, have the cash and the home is for sale.
	 * If the person successfully buys a home, their cash is decreased by the cost of the home.
	 * @param h the house to be bought
	 */
	public void buyHouse(House h) {
		
		if (house == null && cash >= h.getPrice() && h.isForSale()) {
			h.setForSale(false);
			cash -= h.getPrice();
			house = h;
			System.out.println(name + " is now a proud homeowner!");
		}
		else if (cash < h.getPrice()) {
			System.out.println(name + " cannot afford this home");
		}
		else if (house != null) {
			System.out.println(name + " is already a homeowner.");
		}

	}
}
