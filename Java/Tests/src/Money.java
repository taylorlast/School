
import java.util.Scanner;

/**
 * A class representing an amount of Money.
 * The dollars and cents are stored as whole numbers
 * so there is no loss of precision.
 */
public class Money {
	private long dollars;
	private long cents;

	private static final Scanner input = new Scanner(System.in);
	
	/**
	 * Sets dollars to the parameter and set cents to 0.
	 * If a negative amount is given, an error message is printed and
	 * no changes are made to the calling object.
	 * @param newDollars the dollar amount for this Money object.
	 */
	public void set(long newDollars) {
		if (newDollars > 0) {
		dollars = newDollars;
		cents = 0;
		}
		else {
		System.out.println("The value must be greater than 0");
		}
		
	} // set

	/**
	 * Sets the instance variables based on the parameter. The dollars are the whole
	 * number part of the parameter and the cents become the fractional part. The cents
	 * are rounded to the nearest cent using Math.round.
	 * 
	 * If newAmount is negative, print an error message and return.
	 * 
	 * @param newAmount the amount to set this Money object.
	 */
	public void set(double newAmount) {
		if (newAmount > 0) {
			dollars = (int)(newAmount);
			cents = (long)(newAmount) - (int)(newAmount);
		}
	} // set

	/**
	 * Sets the calling object's instance variables to the parameter's instance variables.
	 * 
	 * @param moneyObject the object used to set up the calling object's instance variables.
	 */
	public void set(Money moneyObject) {
	      this.dollars = moneyObject.dollars;
	      this.cents = moneyObject.cents;
	} // set
	
	/**
	 * Sets up the Money object by asking the user for dollars and cents in two separate
	 * prompts.
	 */
	public void readInput( ) {
		System.out.print("Enter the dollar amount in $###.## format: ");
		//Read the user's input and call the appropriate setter method.
		
	} // readInput
	
	/**
	 * "Pretty Print" this money object.
	 */
	public void writeOutput( ) {
		System.out.print("$" + dollars + ".");
		if(cents < 10)
			System.out.print("0");
		System.out.print(cents);
		System.out.println();
	} // writeOutput
 	
	/**
	 * Creates a new Money object containing n times the amount of the calling
	 * object. If the calling object contains the amount 5.75 and n is 2, this
	 * method will return a new Money object of 11.50.
	 * 
	 * @param n the multiplier
	 * @return a new Money object that is n times the calling object's value
	 */
	public Money times(int n) {
		Money returnMoney = new Money();
		
		double allCents = this.dollars + (this.cents/100.0);
		returnMoney.set(allCents * n);
		
		return returnMoney;
	} // times

	/**
	 * Returns a new object that contains the sum of the calling object and the argument.
	 * 
	 * @param otherAmount the Money object to add to the calling object.
	 * @return a new Money object containing the value of the calling object added to the
	 * value of the parameter.
	 */
	public Money add(Money otherAmount) {
		Money returnMoney = new Money();
		
		double callingCents = this.dollars + (this.cents/100.0);
		double otherCents = otherAmount.dollars + (otherAmount.cents/100.0);
		returnMoney.set(callingCents + otherCents);
		
		return returnMoney;
	} // add

	public static void main(String[] args) {
		Money[] allTheMoney = new Money[5];
		for(int i = 0; i < allTheMoney.length; i++) {
			allTheMoney[i] = new Money();
		} // for
		
		allTheMoney[0].readInput();
		allTheMoney[1].set(allTheMoney[0]);
		allTheMoney[2] = allTheMoney[0].add(allTheMoney[1]);
		allTheMoney[3] = allTheMoney[2].times(4);
		allTheMoney[4] = allTheMoney[1].add(allTheMoney[3]);
		
		//What's the expected output if the user enters 12.345?
		for(Money m: allTheMoney) {
			m.writeOutput();
		} // for
		
	} // main

}
