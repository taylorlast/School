import java.util.Scanner;

public class InClassFollow {

	public static void main(String[] args) {
		double rand;
		// Declare count variables 
		int tails = 0, heads = 0, count = 0;
		
		Scanner scan = new Scanner (System.in);
		System.out.println("How many times would you like to flip the coin?");
		int max = scan.nextInt();
		
		// figure out if rand is representative of heads
		// or tails. Tails is between 0 and .5
		while (count < max) {
			rand = Math.random();
		if (rand < .5) {
			tails++;
		}
		else 
		{
			heads++;
		}
		count++;
		}
		System.out.println("The number of heads is " + heads);
		System.out.println("The number of tails is " + tails);
		
	}

}
