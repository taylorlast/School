import java.util.Scanner;

public class InClassWeek4 {

	public static void main(String[] args) {
		Scanner scan = new Scanner (System.in);
		
		System.out.println ("Enter in how many drinks you had: ");
		int numOfDrinks = scan.nextInt();
		System.out.println("What is your weight? (lbs):");
		int weight = scan.nextInt();
		
		double ozOfAlc = .55;
		boolean drunk;
		
		double bac = (4.136 * numOfDrinks * ozOfAlc)/weight;
		
		
		if (bac > .08)
			drunk = true;
		else
			drunk = false;
		
		if (drunk)
			System.out.println("You fucked up");
		else
			System.out.println("Drink more");
		
			
		
		

	}

}
